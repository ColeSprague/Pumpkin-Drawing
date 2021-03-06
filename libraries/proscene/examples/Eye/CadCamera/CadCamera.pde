/**
 * Cad Camera.
 * by Jean Pierre Charalambos.
 * 
 * This example illustrates how to add a CAD Camera type to your your scene.
 * 
 * Press 'h' to display the key shortcuts and mouse bindings in the console.
 * Press 'u' to switch between right handed and left handed world frame.
 * Press the space bar to switch between camera profiles: CAD and CAD_CAM.
 * Press x, y or z to set the main rotation axis (defined in the world
 * coordinate system) used by the CAD Camera.
 */

import remixlab.proscene.*;
import remixlab.dandelion.geom.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.core.Constants.*;

Scene scene;

void setup() {
  size(640, 360, P3D);
  //Scene instantiation
  scene = new Scene(this);
  //Set right handed world frame (useful for architects...)
  scene.setRightHanded();
  //scene.motionAgent().eyeProfile().setBinding(Constants.B_LEFT, DOF2Action.ROTATE_CAD);
  //same as the previous line:
  scene.setMouseButtonBinding(Target.EYE, LEFT, DOF2Action.ROTATE_CAD);
  scene.camera().frame().setRotationSensitivity(1.5);
  //no spinning:
  scene.camera().frame().setSpinningSensitivity(100);
  //no damping:
  scene.camera().frame().setDampingFriction(1);
}

void draw() {
  background(0);
  fill(204, 102, 0);
  box(20, 30, 50);
}

void keyPressed() {
  if (key == ' ')
    if ( scene.isMouseButtonActionBound(Target.EYE, DOF2Action.ROTATE_CAD) )
      scene.setMouseButtonBinding(Target.EYE, LEFT, DOF2Action.ROTATE);
    else {
      scene.setMouseButtonBinding(Target.EYE, LEFT, DOF2Action.ROTATE_CAD);
      scene.camera().setUpVector(new Vec(0, 1, 0));
    }
  if (key == 'u' || key == 'U')
    scene.flip();
  else {
    if (key == 'x' || key == 'X')
      scene.camera().setUpVector(new Vec(1, 0, 0));
    else if (key == 'y' || key == 'Y')
      scene.camera().setUpVector(new Vec(0, 1, 0));
    else if (key == 'z' || key == 'Z')
      scene.camera().setUpVector(new Vec(0, 0, 1));
    scene.camera().lookAt(scene.center());
  }
}
