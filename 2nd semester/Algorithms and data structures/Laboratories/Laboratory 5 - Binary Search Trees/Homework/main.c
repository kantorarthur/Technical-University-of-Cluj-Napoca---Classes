#include <stdio.h>
#include <stdlib.h>

typedef struct _tree_node
{
    int key;
    struct _tree_node *left;
    struct _tree_node *right;
}tree_node;

tree_node *alloc(int key)
{
    tree_node *p=(tree_node *)calloc(1,sizeof(tree_node));
    if(!p)
    {
        return NULL;
    }
    p->key=key;
    return p;
}

void insert_key(tree_node **root,int key)
{
    if(*root==NULL)
    {
        (*root)=alloc(key);
        return;
    }
    else
    {
        if(key<(*root)->key)
        {
            insert_key(&(*root)->left,key);
        }
        else if(key>(*root)->key)
        {
            insert_key(&(*root)->right,key);
        }
        else
        {
            printf("Cheia %d exista deja, nu se mai poate introduce!",key);
        }
    }
}

tree_node *cautare(tree_node *root,int key)
{
    if(root==NULL || root->key==key)
        return root;
    else
    {
        if(root->key>key)
           return cautare(root->left,key);
        else
           return cautare(root->right,key);
    }
}

void preordine(tree_node *root)
{
    if(root)
    {
        printf("%d ",root->key);
        preordine(root->left);
        preordine(root->right);
    }

}
void inordine(tree_node *root)
{
    if(root)
    {
        inordine(root->left);
        printf("%d ",root->key);
        inordine(root->right);
    }
}
void postordine(tree_node *root)
{
    if(root)
    {
        postordine(root->left);
        postordine(root->right);
        printf("%d ",root->key);
    }
}


tree_node *min(tree_node *root)
{
    while(root->left)
    {
        root=root->left;
    }
    printf("\nminimul este: %d",root->key);
    return root;
}
tree_node *max(tree_node *root)
{
    while(root->right)
        root=root->right;
    printf("\nmaximul este:%d",root->key);
    return root;
}


tree_node *succesor(tree_node *root,tree_node *node)
{
    if(node==NULL)
        return NULL;
    if(node->right!=NULL)
    {
        return min(root->right);
    }
    tree_node *succ=NULL;
    while(root!=NULL)
    {
        if(node->key<root->key)
        {
            succ=root;
            root=root->left;
        }
        else if(node->key > root->key)
        {
            root=root->right;
        }
        else
        {
            break;
        }
    }
    return succ;
}

int main()
{
   tree_node *root=NULL;
   insert_key(&root,5);
   insert_key(&root,3);
   insert_key(&root,10);
   insert_key(&root,2);
   inordine(root);
   min(root);
   max(root);
   tree_node *node=cautare(root,5);
   succesor(root,node);
   return 0;
}

