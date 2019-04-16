#include <stdio.h>
#include <stdlib.h>

int main()
{

	struct Node *root = NULL;							//Drzewo które jest BST
	root = insert(root, 3);
	root = insert(root, 6);
	root = insert(root, 1);
	root = insert(root, 4);
	root = insert(root, 8);
    root = insert(root, 167);
    root = insert(root, -123);
    root = insert(root, 5);
	int answer = isItBST(root);
	printf("%i", answer);
    print(root);

	
	
	/*struct Node *root = CreateNode(2);				//Drzewo które nie jest BST
	root->right = CreateNode(1);
	root->left = CreateNode(1);
	root->left->left = CreateNode(5); 
	int answer = isItBST(root); */
	
	
	return 0;
}
