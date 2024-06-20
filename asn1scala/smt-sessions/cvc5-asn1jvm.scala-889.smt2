; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25338 () Bool)

(assert start!25338)

(declare-fun b!127930 () Bool)

(declare-fun e!84823 () Bool)

(declare-datatypes ((array!5888 0))(
  ( (array!5889 (arr!3279 (Array (_ BitVec 32) (_ BitVec 8))) (size!2662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4588 0))(
  ( (BitStream!4589 (buf!3020 array!5888) (currentByte!5768 (_ BitVec 32)) (currentBit!5763 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4588)

(declare-fun array_inv!2451 (array!5888) Bool)

(assert (=> b!127930 (= e!84823 (array_inv!2451 (buf!3020 thiss!1634)))))

(declare-fun b!127931 () Bool)

(declare-fun res!105859 () Bool)

(declare-fun e!84824 () Bool)

(assert (=> b!127931 (=> (not res!105859) (not e!84824))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127931 (= res!105859 (invariant!0 (currentBit!5763 thiss!1634) (currentByte!5768 thiss!1634) (size!2662 (buf!3020 thiss!1634))))))

(declare-fun b!127932 () Bool)

(assert (=> b!127932 (= e!84824 (or (bvsgt ((_ sign_extend 32) (size!2662 (buf!3020 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5768 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5763 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!127933 () Bool)

(declare-fun res!105861 () Bool)

(assert (=> b!127933 (=> (not res!105861) (not e!84824))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127933 (= res!105861 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2662 (buf!3020 thiss!1634))) ((_ sign_extend 32) (currentByte!5768 thiss!1634)) ((_ sign_extend 32) (currentBit!5763 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!127934 () Bool)

(declare-fun res!105862 () Bool)

(assert (=> b!127934 (=> (not res!105862) (not e!84824))))

(assert (=> b!127934 (= res!105862 (bvslt from!447 to!404))))

(declare-fun res!105860 () Bool)

(assert (=> start!25338 (=> (not res!105860) (not e!84824))))

(declare-fun arr!237 () array!5888)

(assert (=> start!25338 (= res!105860 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2662 arr!237))))))

(assert (=> start!25338 e!84824))

(assert (=> start!25338 true))

(assert (=> start!25338 (array_inv!2451 arr!237)))

(declare-fun inv!12 (BitStream!4588) Bool)

(assert (=> start!25338 (and (inv!12 thiss!1634) e!84823)))

(assert (= (and start!25338 res!105860) b!127933))

(assert (= (and b!127933 res!105861) b!127934))

(assert (= (and b!127934 res!105862) b!127931))

(assert (= (and b!127931 res!105859) b!127932))

(assert (= start!25338 b!127930))

(declare-fun m!193743 () Bool)

(assert (=> b!127930 m!193743))

(declare-fun m!193745 () Bool)

(assert (=> b!127931 m!193745))

(declare-fun m!193747 () Bool)

(assert (=> b!127933 m!193747))

(declare-fun m!193749 () Bool)

(assert (=> start!25338 m!193749))

(declare-fun m!193751 () Bool)

(assert (=> start!25338 m!193751))

(push 1)

(assert (not b!127933))

(assert (not b!127930))

(assert (not b!127931))

(assert (not start!25338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

