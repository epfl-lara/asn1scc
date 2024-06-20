; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19566 () Bool)

(assert start!19566)

(declare-fun b!97628 () Bool)

(declare-fun e!63947 () Bool)

(declare-fun e!63948 () Bool)

(assert (=> b!97628 (= e!63947 e!63948)))

(declare-fun res!80108 () Bool)

(assert (=> b!97628 (=> (not res!80108) (not e!63948))))

(declare-datatypes ((array!4570 0))(
  ( (array!4571 (arr!2682 (Array (_ BitVec 32) (_ BitVec 8))) (size!2089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3652 0))(
  ( (BitStream!3653 (buf!2437 array!4570) (currentByte!4858 (_ BitVec 32)) (currentBit!4853 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3652)

(declare-datatypes ((Unit!5948 0))(
  ( (Unit!5949) )
))
(declare-datatypes ((tuple2!7828 0))(
  ( (tuple2!7829 (_1!4166 Unit!5948) (_2!4166 BitStream!3652)) )
))
(declare-fun lt!141316 () tuple2!7828)

(assert (=> b!97628 (= res!80108 (= (size!2089 (buf!2437 thiss!1288)) (size!2089 (buf!2437 (_2!4166 lt!141316)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7828)

(assert (=> b!97628 (= lt!141316 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97629 () Bool)

(declare-fun res!80106 () Bool)

(assert (=> b!97629 (=> (not res!80106) (not e!63947))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97629 (= res!80106 (validate_offset_bits!1 ((_ sign_extend 32) (size!2089 (buf!2437 thiss!1288))) ((_ sign_extend 32) (currentByte!4858 thiss!1288)) ((_ sign_extend 32) (currentBit!4853 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97630 () Bool)

(declare-fun e!63945 () Bool)

(declare-fun array_inv!1891 (array!4570) Bool)

(assert (=> b!97630 (= e!63945 (array_inv!1891 (buf!2437 thiss!1288)))))

(declare-fun res!80103 () Bool)

(assert (=> start!19566 (=> (not res!80103) (not e!63947))))

(assert (=> start!19566 (= res!80103 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19566 e!63947))

(assert (=> start!19566 true))

(declare-fun inv!12 (BitStream!3652) Bool)

(assert (=> start!19566 (and (inv!12 thiss!1288) e!63945)))

(declare-fun b!97631 () Bool)

(assert (=> b!97631 (= e!63948 false)))

(declare-datatypes ((tuple2!7830 0))(
  ( (tuple2!7831 (_1!4167 BitStream!3652) (_2!4167 BitStream!3652)) )
))
(declare-fun lt!141315 () tuple2!7830)

(declare-fun reader!0 (BitStream!3652 BitStream!3652) tuple2!7830)

(assert (=> b!97631 (= lt!141315 (reader!0 thiss!1288 (_2!4166 lt!141316)))))

(declare-fun b!97632 () Bool)

(declare-fun res!80104 () Bool)

(assert (=> b!97632 (=> (not res!80104) (not e!63947))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97632 (= res!80104 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97633 () Bool)

(declare-fun res!80107 () Bool)

(assert (=> b!97633 (=> (not res!80107) (not e!63948))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97633 (= res!80107 (= (bitIndex!0 (size!2089 (buf!2437 (_2!4166 lt!141316))) (currentByte!4858 (_2!4166 lt!141316)) (currentBit!4853 (_2!4166 lt!141316))) (bvadd (bitIndex!0 (size!2089 (buf!2437 thiss!1288)) (currentByte!4858 thiss!1288) (currentBit!4853 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97634 () Bool)

(declare-fun res!80105 () Bool)

(assert (=> b!97634 (=> (not res!80105) (not e!63948))))

(declare-fun isPrefixOf!0 (BitStream!3652 BitStream!3652) Bool)

(assert (=> b!97634 (= res!80105 (isPrefixOf!0 thiss!1288 (_2!4166 lt!141316)))))

(assert (= (and start!19566 res!80103) b!97629))

(assert (= (and b!97629 res!80106) b!97632))

(assert (= (and b!97632 res!80104) b!97628))

(assert (= (and b!97628 res!80108) b!97633))

(assert (= (and b!97633 res!80107) b!97634))

(assert (= (and b!97634 res!80105) b!97631))

(assert (= start!19566 b!97630))

(declare-fun m!141889 () Bool)

(assert (=> b!97631 m!141889))

(declare-fun m!141891 () Bool)

(assert (=> b!97632 m!141891))

(declare-fun m!141893 () Bool)

(assert (=> b!97630 m!141893))

(declare-fun m!141895 () Bool)

(assert (=> b!97634 m!141895))

(declare-fun m!141897 () Bool)

(assert (=> start!19566 m!141897))

(declare-fun m!141899 () Bool)

(assert (=> b!97629 m!141899))

(declare-fun m!141901 () Bool)

(assert (=> b!97633 m!141901))

(declare-fun m!141903 () Bool)

(assert (=> b!97633 m!141903))

(declare-fun m!141905 () Bool)

(assert (=> b!97628 m!141905))

(push 1)

(assert (not b!97633))

(assert (not b!97631))

(assert (not b!97629))

(assert (not b!97632))

(assert (not b!97630))

(assert (not b!97634))

(assert (not start!19566))

(assert (not b!97628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

