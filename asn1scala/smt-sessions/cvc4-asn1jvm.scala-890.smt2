; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25348 () Bool)

(assert start!25348)

(declare-fun b!128005 () Bool)

(declare-fun e!84882 () Bool)

(declare-datatypes ((array!5898 0))(
  ( (array!5899 (arr!3284 (Array (_ BitVec 32) (_ BitVec 8))) (size!2667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4598 0))(
  ( (BitStream!4599 (buf!3025 array!5898) (currentByte!5773 (_ BitVec 32)) (currentBit!5768 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4598)

(declare-fun array_inv!2456 (array!5898) Bool)

(assert (=> b!128005 (= e!84882 (array_inv!2456 (buf!3025 thiss!1634)))))

(declare-fun res!105922 () Bool)

(declare-fun e!84881 () Bool)

(assert (=> start!25348 (=> (not res!105922) (not e!84881))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5898)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25348 (= res!105922 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2667 arr!237))))))

(assert (=> start!25348 e!84881))

(assert (=> start!25348 true))

(assert (=> start!25348 (array_inv!2456 arr!237)))

(declare-fun inv!12 (BitStream!4598) Bool)

(assert (=> start!25348 (and (inv!12 thiss!1634) e!84882)))

(declare-fun b!128006 () Bool)

(declare-fun res!105921 () Bool)

(assert (=> b!128006 (=> (not res!105921) (not e!84881))))

(assert (=> b!128006 (= res!105921 (bvslt from!447 to!404))))

(declare-fun b!128007 () Bool)

(declare-fun res!105920 () Bool)

(assert (=> b!128007 (=> (not res!105920) (not e!84881))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128007 (= res!105920 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2667 (buf!3025 thiss!1634))) ((_ sign_extend 32) (currentByte!5773 thiss!1634)) ((_ sign_extend 32) (currentBit!5768 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128008 () Bool)

(assert (=> b!128008 (= e!84881 (and (bvsle ((_ sign_extend 32) (size!2667 (buf!3025 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5773 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5768 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2667 (buf!3025 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5773 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5768 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128009 () Bool)

(declare-fun res!105919 () Bool)

(assert (=> b!128009 (=> (not res!105919) (not e!84881))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128009 (= res!105919 (invariant!0 (currentBit!5768 thiss!1634) (currentByte!5773 thiss!1634) (size!2667 (buf!3025 thiss!1634))))))

(assert (= (and start!25348 res!105922) b!128007))

(assert (= (and b!128007 res!105920) b!128006))

(assert (= (and b!128006 res!105921) b!128009))

(assert (= (and b!128009 res!105919) b!128008))

(assert (= start!25348 b!128005))

(declare-fun m!193793 () Bool)

(assert (=> b!128005 m!193793))

(declare-fun m!193795 () Bool)

(assert (=> start!25348 m!193795))

(declare-fun m!193797 () Bool)

(assert (=> start!25348 m!193797))

(declare-fun m!193799 () Bool)

(assert (=> b!128007 m!193799))

(declare-fun m!193801 () Bool)

(assert (=> b!128009 m!193801))

(push 1)

(assert (not start!25348))

(assert (not b!128007))

(assert (not b!128005))

(assert (not b!128009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

