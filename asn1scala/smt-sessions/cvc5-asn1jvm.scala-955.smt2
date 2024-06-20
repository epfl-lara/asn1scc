; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27002 () Bool)

(assert start!27002)

(declare-fun b!139058 () Bool)

(declare-fun e!92573 () Bool)

(declare-datatypes ((array!6318 0))(
  ( (array!6319 (arr!3555 (Array (_ BitVec 32) (_ BitVec 8))) (size!2860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4984 0))(
  ( (BitStream!4985 (buf!3273 array!6318) (currentByte!6097 (_ BitVec 32)) (currentBit!6092 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4984)

(declare-fun array_inv!2649 (array!6318) Bool)

(assert (=> b!139058 (= e!92573 (array_inv!2649 (buf!3273 thiss!1634)))))

(declare-fun b!139059 () Bool)

(declare-fun e!92574 () Bool)

(assert (=> b!139059 (= e!92574 true)))

(declare-fun lt!216798 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139059 (validate_offset_bits!1 ((_ sign_extend 32) (size!2860 (buf!3273 thiss!1634))) ((_ sign_extend 32) (currentByte!6097 thiss!1634)) ((_ sign_extend 32) (currentBit!6092 thiss!1634)) lt!216798)))

(declare-datatypes ((Unit!8676 0))(
  ( (Unit!8677) )
))
(declare-fun lt!216795 () Unit!8676)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4984 array!6318 (_ BitVec 64)) Unit!8676)

(assert (=> b!139059 (= lt!216795 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3273 thiss!1634) lt!216798))))

(declare-datatypes ((tuple2!12170 0))(
  ( (tuple2!12171 (_1!6411 BitStream!4984) (_2!6411 BitStream!4984)) )
))
(declare-fun lt!216796 () tuple2!12170)

(declare-fun reader!0 (BitStream!4984 BitStream!4984) tuple2!12170)

(assert (=> b!139059 (= lt!216796 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139060 () Bool)

(declare-fun res!115923 () Bool)

(declare-fun e!92576 () Bool)

(assert (=> b!139060 (=> (not res!115923) (not e!92576))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139060 (= res!115923 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2860 (buf!3273 thiss!1634))) ((_ sign_extend 32) (currentByte!6097 thiss!1634)) ((_ sign_extend 32) (currentBit!6092 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139061 () Bool)

(declare-fun res!115924 () Bool)

(assert (=> b!139061 (=> (not res!115924) (not e!92576))))

(assert (=> b!139061 (= res!115924 (bvsge from!447 to!404))))

(declare-fun b!139062 () Bool)

(assert (=> b!139062 (= e!92576 (not e!92574))))

(declare-fun res!115926 () Bool)

(assert (=> b!139062 (=> res!115926 e!92574)))

(declare-fun lt!216794 () (_ BitVec 64))

(assert (=> b!139062 (= res!115926 (not (= lt!216794 (bvadd lt!216794 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216798)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139062 (= lt!216794 (bitIndex!0 (size!2860 (buf!3273 thiss!1634)) (currentByte!6097 thiss!1634) (currentBit!6092 thiss!1634)))))

(assert (=> b!139062 (= lt!216798 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4984 BitStream!4984) Bool)

(assert (=> b!139062 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216797 () Unit!8676)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4984) Unit!8676)

(assert (=> b!139062 (= lt!216797 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!115925 () Bool)

(assert (=> start!27002 (=> (not res!115925) (not e!92576))))

(declare-fun arr!237 () array!6318)

(assert (=> start!27002 (= res!115925 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2860 arr!237))))))

(assert (=> start!27002 e!92576))

(assert (=> start!27002 true))

(assert (=> start!27002 (array_inv!2649 arr!237)))

(declare-fun inv!12 (BitStream!4984) Bool)

(assert (=> start!27002 (and (inv!12 thiss!1634) e!92573)))

(assert (= (and start!27002 res!115925) b!139060))

(assert (= (and b!139060 res!115923) b!139061))

(assert (= (and b!139061 res!115924) b!139062))

(assert (= (and b!139062 (not res!115926)) b!139059))

(assert (= start!27002 b!139058))

(declare-fun m!213985 () Bool)

(assert (=> start!27002 m!213985))

(declare-fun m!213987 () Bool)

(assert (=> start!27002 m!213987))

(declare-fun m!213989 () Bool)

(assert (=> b!139062 m!213989))

(declare-fun m!213991 () Bool)

(assert (=> b!139062 m!213991))

(declare-fun m!213993 () Bool)

(assert (=> b!139062 m!213993))

(declare-fun m!213995 () Bool)

(assert (=> b!139060 m!213995))

(declare-fun m!213997 () Bool)

(assert (=> b!139058 m!213997))

(declare-fun m!213999 () Bool)

(assert (=> b!139059 m!213999))

(declare-fun m!214001 () Bool)

(assert (=> b!139059 m!214001))

(declare-fun m!214003 () Bool)

(assert (=> b!139059 m!214003))

(push 1)

(assert (not b!139060))

(assert (not b!139059))

(assert (not start!27002))

(assert (not b!139062))

(assert (not b!139058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

