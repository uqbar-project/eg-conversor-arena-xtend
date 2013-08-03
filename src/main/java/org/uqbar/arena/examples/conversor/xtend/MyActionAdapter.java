package org.uqbar.arena.examples.conversor.xtend;

import org.uqbar.lacar.ui.model.Action;

public class MyActionAdapter implements Action {
	private MyAction myAction;

	public MyActionAdapter(MyAction myAction) {
		this.myAction = myAction;
	}

	@Override
	public void execute() {
		myAction.execute(null);
	}
}
