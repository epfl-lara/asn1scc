; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19548 () Bool)

(assert start!19548)

(declare-fun b!97446 () Bool)

(declare-fun res!79952 () Bool)

(declare-fun e!63839 () Bool)

(assert (=> b!97446 (=> (not res!79952) (not e!63839))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97446 (= res!79952 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!79948 () Bool)

(assert (=> start!19548 (=> (not res!79948) (not e!63839))))

(assert (=> start!19548 (= res!79948 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19548 e!63839))

(assert (=> start!19548 true))

(declare-datatypes ((array!4552 0))(
  ( (array!4553 (arr!2673 (Array (_ BitVec 32) (_ BitVec 8))) (size!2080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3634 0))(
  ( (BitStream!3635 (buf!2428 array!4552) (currentByte!4849 (_ BitVec 32)) (currentBit!4844 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3634)

(declare-fun e!63840 () Bool)

(declare-fun inv!12 (BitStream!3634) Bool)

(assert (=> start!19548 (and (inv!12 thiss!1288) e!63840)))

(declare-fun b!97447 () Bool)

(declare-fun e!63838 () Bool)

(assert (=> b!97447 (= e!63839 e!63838)))

(declare-fun res!79949 () Bool)

(assert (=> b!97447 (=> (not res!79949) (not e!63838))))

(declare-datatypes ((Unit!5930 0))(
  ( (Unit!5931) )
))
(declare-datatypes ((tuple2!7798 0))(
  ( (tuple2!7799 (_1!4151 Unit!5930) (_2!4151 BitStream!3634)) )
))
(declare-fun lt!141262 () tuple2!7798)

(assert (=> b!97447 (= res!79949 (= (size!2080 (buf!2428 thiss!1288)) (size!2080 (buf!2428 (_2!4151 lt!141262)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3634 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7798)

(assert (=> b!97447 (= lt!141262 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97448 () Bool)

(declare-fun res!79951 () Bool)

(assert (=> b!97448 (=> (not res!79951) (not e!63839))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97448 (= res!79951 (validate_offset_bits!1 ((_ sign_extend 32) (size!2080 (buf!2428 thiss!1288))) ((_ sign_extend 32) (currentByte!4849 thiss!1288)) ((_ sign_extend 32) (currentBit!4844 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97449 () Bool)

(assert (=> b!97449 (= e!63838 false)))

(declare-fun lt!141261 () Bool)

(declare-fun isPrefixOf!0 (BitStream!3634 BitStream!3634) Bool)

(assert (=> b!97449 (= lt!141261 (isPrefixOf!0 thiss!1288 (_2!4151 lt!141262)))))

(declare-fun b!97450 () Bool)

(declare-fun res!79950 () Bool)

(assert (=> b!97450 (=> (not res!79950) (not e!63838))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97450 (= res!79950 (= (bitIndex!0 (size!2080 (buf!2428 (_2!4151 lt!141262))) (currentByte!4849 (_2!4151 lt!141262)) (currentBit!4844 (_2!4151 lt!141262))) (bvadd (bitIndex!0 (size!2080 (buf!2428 thiss!1288)) (currentByte!4849 thiss!1288) (currentBit!4844 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97451 () Bool)

(declare-fun array_inv!1882 (array!4552) Bool)

(assert (=> b!97451 (= e!63840 (array_inv!1882 (buf!2428 thiss!1288)))))

(assert (= (and start!19548 res!79948) b!97448))

(assert (= (and b!97448 res!79951) b!97446))

(assert (= (and b!97446 res!79952) b!97447))

(assert (= (and b!97447 res!79949) b!97450))

(assert (= (and b!97450 res!79950) b!97449))

(assert (= start!19548 b!97451))

(declare-fun m!141733 () Bool)

(assert (=> b!97449 m!141733))

(declare-fun m!141735 () Bool)

(assert (=> b!97447 m!141735))

(declare-fun m!141737 () Bool)

(assert (=> b!97446 m!141737))

(declare-fun m!141739 () Bool)

(assert (=> start!19548 m!141739))

(declare-fun m!141741 () Bool)

(assert (=> b!97451 m!141741))

(declare-fun m!141743 () Bool)

(assert (=> b!97448 m!141743))

(declare-fun m!141745 () Bool)

(assert (=> b!97450 m!141745))

(declare-fun m!141747 () Bool)

(assert (=> b!97450 m!141747))

(push 1)

(assert (not b!97451))

(assert (not b!97450))

(assert (not start!19548))

(assert (not b!97449))

(assert (not b!97448))

(assert (not b!97446))

(assert (not b!97447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

