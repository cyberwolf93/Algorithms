#include <iostream>

using namespace std;

struct Node {
    int value;
    Node* left = NULL;
    Node* right = NULL;
};

class AVLTree {
    public:
        Node* root;

        AVLTree() {
            root = NULL;
        }

        int height(Node* n) {
            if (!n) {
                return -1;
            }

            int left = height(n->left);
            int right = height(n->right);

            return left > right ? left + 1 : right+1; 

        }

        int getBalance(Node* n) {
            if (!n) {
                return -1;
            }

            return height(n->left) - height(n->right);
        }

        Node* rotateLeft(Node* n) {
            Node* y = n->right;
            Node* x = y->left;
            y->left = n;
            n->right = x;
            return y;
        }

        Node* rotateRight(Node* n) {
            Node* y = n->left;
            Node* x = y->right;
            y->right = n;
            n->left = x;
            return y;
        }


        Node* insert(Node* n, Node* newVal) {
            if (!n) {
                n = newVal;
                return n;
            } else if (newVal->value <= n->value) {
                n->left = insert(n->left, newVal);
            } else if (newVal->value > n->value) {
                n->right = insert(n->right, newVal);
            } 

            int bf = getBalance(n);
            if (bf > 1 && newVal->value < n->left->value) {
                n = rotateRight(n);
            } else if (bf > 1 && newVal->value > n->left->value) {
                n->left = rotateLeft(n->left);
                n = rotateRight(n);
            } else if (bf < -1 && newVal->value > n->right->value) {
                n = rotateLeft(n);
            } else if (bf < -1 && newVal->value < n->right->value) {
                n->right = rotateRight(n->right);
                n = rotateLeft(n);
            } 

            return n;
        }

        void print(Node* n, int space) {
            if (!n) {
                return;
            }

            cout << "{" << n->value << "|" << space << "}" << endl;
            print(n->left, space+1);
            print(n->right, space+1);
            
        }

};

Node* createNode(int val) {
    Node* n = new Node();
    n->value = val;
    return n;
}

int main() {

    AVLTree obj = AVLTree();
    obj.root = obj.insert(obj.root, createNode(3));
    obj.root = obj.insert(obj.root, createNode(2));
    obj.root = obj.insert(obj.root, createNode(4));
    obj.root = obj.insert(obj.root, createNode(5));
    obj.root = obj.insert(obj.root, createNode(6));

    cout << obj.root->right->value << endl;
    

    obj.print(obj.root, 0);

    return 0;
}




