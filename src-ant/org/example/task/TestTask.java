package org.example.task;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

public class TestTask extends Task {

  @Override
  public void execute() throws BuildException {
    new org.example.Test().print();
  }
}
