//
//  GPSLab1.cpp
//
//  Copyright © 2017 CGIS. All rights reserved.
//

#include <cmath>
#include "GPSLab1.hpp"

namespace gps {

    //membrii de clasa pt glm::vec - .x, .y, .z, .w (in functie de cate dimensiuni e vec)
    //deocamdata nu lucram cu .w 
    size_t i{};

    float dot_product{};
    float cross_product{};

    float modul_v1{};
    float modul_v2{};

    float cos_theta{};
    float unghi_in_radiani{};

    size_t nr_varfuri_poligon{};
    size_t next{};
    bool are_pozitiv{};
    bool are_negativ{};


    glm::vec4 TransformPoint(const glm::vec4 &point)
    {//trebuie sa faca translatie cu (2.0, 0.0, 1.0) si apoi sa roteasca la 90 de grade in jurul axei x
     //functia trebuie sa returneze un vec4 care rezulta dupa operatiile astea pe vec de intrare

     //Ca sa translatezi/rotesti, ... un vector trebuie sa:
     //1. Incepi cu o matrice identitate
     //2. Aplici operatiile pe care vrei sa le aplici pe vector pe matricea identitate
     //3. Dupa ce ai facut toate operatiile pe matricea identitate, o inmultesti cu vectoru pe care ai vrut sa faci operatiile
     //si salvezi rezultatul inmultirii dintre matrice si vec initial in vec nou

        glm::mat4 matricea_identitate{1.0f};

        matricea_identitate = glm::rotate(matricea_identitate, glm::radians(90.0f), glm::vec3(1.0f, 0.0f, 0.0));
        //Acum in matricea identitate am: Rotatie cu 90 de grade in jurul axei X 

        matricea_identitate = glm::translate(matricea_identitate, glm::vec3(2.0f, 0.0f, 1.0f));
        //Acum in matricea identitate am: Translatie cu (2.0, 0.0, 1.0) si Rotatie cu 90 de grade in jurul axei X
        
        return matricea_identitate * point;
    }
    //Explicare functii glm:

    //glm::translate(matrice, punctele cu care vrei sa faci translate) - Aceasta returneaza tot o matrice, nu face operatiile in place
    //Punctele pe care vrei sa faci translate de obicei le initializezi cand le dai ca argument
    //EX: glm::translate(matrice, glm::vec3(1.0f, 2.0f, 0.0f) - Fac translate intre matrice si punctele: x = 1, y = 2, z = 0

    //glm::rotate(matrice, radiani, pe ce coordonate vrem sa facem rotatia) - Face rotate pe coordonatele pe care le dai pe mat
    //                                                                                      cu radianii pe care ii dai
    //Este ex mai sus


    //Trebuie sa calculez unghiul dintre v1 si v2 si sa-l returnez
    //
    //Calculare unghi dintre 2 vectori:
    //1. Faci dot productul lor
    //2. Calculezi modulele lor
    //3. Calculezi cos_theta
    //4. Obtii unghiul in radiani cu arccos(cos_theta)
    float ComputeAngle(const glm::vec3 &v1, const glm::vec3 &v2)
    {
        dot_product = v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;

        modul_v1 = std::sqrt(v1.x * v1.x + v1.y * v1.y + v1.z * v1.z);
        modul_v2 = std::sqrt(v2.x * v2.x + v2.y * v2.y + v2.z * v2.z);

        assert(modul_v1 && modul_v2 && "Nu se poate calcula unghiul pt un vector nul");

        cos_theta = dot_product / (modul_v1 * modul_v2);

        if(cos_theta > 1.0)
            cos_theta = 1.0; //Astea se fac din cauza erorilor de precizie CPP
        if(cos_theta < -1.0)
            cos_theta = -1.0;

        unghi_in_radiani = std::acos(cos_theta);

        return glm::degrees(unghi_in_radiani); // Il returnez ca unghi in grade
    }
    
    float func_cross_product(const glm::vec2& varf_1, const glm::vec2& varf_2, const glm::vec2& varf_3)
    {
        glm::vec2 ab = varf_2 - varf_1;
        glm::vec2 bc = varf_3 - varf_2;
        
        return ab.x * bc.y - ab.y * bc.x;
    }

    bool IsConvex(const std::vector<glm::vec2> &vertices)
    {
        nr_varfuri_poligon = vertices.size();
        assert( (nr_varfuri_poligon > 3) && "Un poligon trebuie sa aiba cel putin 3 varfuri");

        are_pozitiv = are_negativ = false;
        for(i = 0; i < nr_varfuri_poligon; ++i)
        {
            const glm::vec2 varf_1 = vertices[i];
            const glm::vec2 varf_2 = vertices[(i + 1) % nr_varfuri_poligon];
            const glm::vec2 varf_3 = vertices[(i + 2) % nr_varfuri_poligon];

            cross_product = func_cross_product(varf_1, varf_2, varf_3);//[=]{
                              //       return (varf_2.x - varf_1.x) * (varf_3.y - varf_2.y) * (varf_2.y - varf_1.y) * (varf_3.x - varf_2.x);
                                //  }
            //cross_product = cross_product dintre varf1, varf2, varf3;


            //daca cross_product > 0 are pozitiv = true
            //daca cross product < 0 are negativ = true

            //daca are si negativ si pozitiv, nu e poligon
            if(cross_product > 0)
                are_pozitiv = true;
            if(cross_product < 0)
                are_negativ = true;
            if(are_negativ && are_pozitiv)
                return false;
        }

        return true;
    }

    glm::vec2 normalized(glm::vec2 v)
    {
        float lungime = std::sqrt(v.x * v.x + v.y * v.y);

        if(lungime == 0.0f)
            return{0.0f, 0.0f};
        return {v.x / lungime, v.y / lungime};
    }
    
    std::vector<glm::vec2> ComputeNormals(const std::vector<glm::vec2> &vertices)
    {
        std::vector<glm::vec2> normalsList;
        nr_varfuri_poligon = vertices.size();
        normalsList.reserve(nr_varfuri_poligon);

        for(i = 0; i < nr_varfuri_poligon; ++i)
        {
            next = (i + 1) % nr_varfuri_poligon;
            glm::vec2 edge{vertices[next].x - vertices[i].x, vertices[next].y - vertices[i].y};

            glm::vec2 normala_spre_exterior{edge.y, -edge.x};

            normalsList.push_back(normalized(normala_spre_exterior));
        }

        return normalsList;
    }
}

