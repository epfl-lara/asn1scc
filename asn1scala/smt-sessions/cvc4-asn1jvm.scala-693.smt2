; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19552 () Bool)

(assert start!19552)

(declare-fun b!97482 () Bool)

(declare-fun res!79981 () Bool)

(declare-fun e!63864 () Bool)

(assert (=> b!97482 (=> (not res!79981) (not e!63864))))

(declare-datatypes ((array!4556 0))(
  ( (array!4557 (arr!2675 (Array (_ BitVec 32) (_ BitVec 8))) (size!2082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3638 0))(
  ( (BitStream!3639 (buf!2430 array!4556) (currentByte!4851 (_ BitVec 32)) (currentBit!4846 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5934 0))(
  ( (Unit!5935) )
))
(declare-datatypes ((tuple2!7802 0))(
  ( (tuple2!7803 (_1!4153 Unit!5934) (_2!4153 BitStream!3638)) )
))
(declare-fun lt!141273 () tuple2!7802)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun thiss!1288 () BitStream!3638)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97482 (= res!79981 (= (bitIndex!0 (size!2082 (buf!2430 (_2!4153 lt!141273))) (currentByte!4851 (_2!4153 lt!141273)) (currentBit!4846 (_2!4153 lt!141273))) (bvadd (bitIndex!0 (size!2082 (buf!2430 thiss!1288)) (currentByte!4851 thiss!1288) (currentBit!4846 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97483 () Bool)

(declare-fun e!63863 () Bool)

(declare-fun array_inv!1884 (array!4556) Bool)

(assert (=> b!97483 (= e!63863 (array_inv!1884 (buf!2430 thiss!1288)))))

(declare-fun res!79978 () Bool)

(declare-fun e!63861 () Bool)

(assert (=> start!19552 (=> (not res!79978) (not e!63861))))

(assert (=> start!19552 (= res!79978 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19552 e!63861))

(assert (=> start!19552 true))

(declare-fun inv!12 (BitStream!3638) Bool)

(assert (=> start!19552 (and (inv!12 thiss!1288) e!63863)))

(declare-fun b!97484 () Bool)

(declare-fun res!79980 () Bool)

(assert (=> b!97484 (=> (not res!79980) (not e!63861))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97484 (= res!79980 (validate_offset_bits!1 ((_ sign_extend 32) (size!2082 (buf!2430 thiss!1288))) ((_ sign_extend 32) (currentByte!4851 thiss!1288)) ((_ sign_extend 32) (currentBit!4846 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97485 () Bool)

(assert (=> b!97485 (= e!63864 false)))

(declare-fun lt!141274 () Bool)

(declare-fun isPrefixOf!0 (BitStream!3638 BitStream!3638) Bool)

(assert (=> b!97485 (= lt!141274 (isPrefixOf!0 thiss!1288 (_2!4153 lt!141273)))))

(declare-fun b!97486 () Bool)

(assert (=> b!97486 (= e!63861 e!63864)))

(declare-fun res!79979 () Bool)

(assert (=> b!97486 (=> (not res!79979) (not e!63864))))

(assert (=> b!97486 (= res!79979 (= (size!2082 (buf!2430 thiss!1288)) (size!2082 (buf!2430 (_2!4153 lt!141273)))))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7802)

(assert (=> b!97486 (= lt!141273 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97487 () Bool)

(declare-fun res!79982 () Bool)

(assert (=> b!97487 (=> (not res!79982) (not e!63861))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97487 (= res!79982 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19552 res!79978) b!97484))

(assert (= (and b!97484 res!79980) b!97487))

(assert (= (and b!97487 res!79982) b!97486))

(assert (= (and b!97486 res!79979) b!97482))

(assert (= (and b!97482 res!79981) b!97485))

(assert (= start!19552 b!97483))

(declare-fun m!141765 () Bool)

(assert (=> start!19552 m!141765))

(declare-fun m!141767 () Bool)

(assert (=> b!97487 m!141767))

(declare-fun m!141769 () Bool)

(assert (=> b!97485 m!141769))

(declare-fun m!141771 () Bool)

(assert (=> b!97484 m!141771))

(declare-fun m!141773 () Bool)

(assert (=> b!97482 m!141773))

(declare-fun m!141775 () Bool)

(assert (=> b!97482 m!141775))

(declare-fun m!141777 () Bool)

(assert (=> b!97486 m!141777))

(declare-fun m!141779 () Bool)

(assert (=> b!97483 m!141779))

(push 1)

(assert (not start!19552))

