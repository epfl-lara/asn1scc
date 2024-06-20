; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27072 () Bool)

(assert start!27072)

(declare-fun res!116093 () Bool)

(declare-fun e!92738 () Bool)

(assert (=> start!27072 (=> (not res!116093) (not e!92738))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6337 0))(
  ( (array!6338 (arr!3563 (Array (_ BitVec 32) (_ BitVec 8))) (size!2868 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6337)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27072 (= res!116093 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2868 arr!237))))))

(assert (=> start!27072 e!92738))

(assert (=> start!27072 true))

(declare-fun array_inv!2657 (array!6337) Bool)

(assert (=> start!27072 (array_inv!2657 arr!237)))

(declare-datatypes ((BitStream!5000 0))(
  ( (BitStream!5001 (buf!3284 array!6337) (currentByte!6114 (_ BitVec 32)) (currentBit!6109 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5000)

(declare-fun e!92742 () Bool)

(declare-fun inv!12 (BitStream!5000) Bool)

(assert (=> start!27072 (and (inv!12 thiss!1634) e!92742)))

(declare-fun b!139268 () Bool)

(declare-fun res!116092 () Bool)

(assert (=> b!139268 (=> (not res!116092) (not e!92738))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139268 (= res!116092 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2868 (buf!3284 thiss!1634))) ((_ sign_extend 32) (currentByte!6114 thiss!1634)) ((_ sign_extend 32) (currentBit!6109 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139269 () Bool)

(assert (=> b!139269 (= e!92742 (array_inv!2657 (buf!3284 thiss!1634)))))

(declare-fun e!92740 () Bool)

(declare-datatypes ((tuple2!12190 0))(
  ( (tuple2!12191 (_1!6421 BitStream!5000) (_2!6421 array!6337)) )
))
(declare-fun lt!217174 () tuple2!12190)

(declare-datatypes ((tuple2!12192 0))(
  ( (tuple2!12193 (_1!6422 BitStream!5000) (_2!6422 BitStream!5000)) )
))
(declare-fun lt!217175 () tuple2!12192)

(declare-fun b!139270 () Bool)

(assert (=> b!139270 (= e!92740 (or (not (= (size!2868 (_2!6421 lt!217174)) (size!2868 arr!237))) (not (= (_1!6421 lt!217174) (_2!6422 lt!217175))) (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5000 array!6337 (_ BitVec 32) (_ BitVec 32)) tuple2!12190)

(assert (=> b!139270 (= lt!217174 (readByteArrayLoopPure!0 (_1!6422 lt!217175) arr!237 from!447 to!404))))

(declare-fun lt!217176 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139270 (validate_offset_bits!1 ((_ sign_extend 32) (size!2868 (buf!3284 thiss!1634))) ((_ sign_extend 32) (currentByte!6114 thiss!1634)) ((_ sign_extend 32) (currentBit!6109 thiss!1634)) lt!217176)))

(declare-datatypes ((Unit!8695 0))(
  ( (Unit!8696) )
))
(declare-fun lt!217179 () Unit!8695)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5000 array!6337 (_ BitVec 64)) Unit!8695)

(assert (=> b!139270 (= lt!217179 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3284 thiss!1634) lt!217176))))

(declare-fun reader!0 (BitStream!5000 BitStream!5000) tuple2!12192)

(assert (=> b!139270 (= lt!217175 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139271 () Bool)

(assert (=> b!139271 (= e!92738 (not e!92740))))

(declare-fun res!116091 () Bool)

(assert (=> b!139271 (=> res!116091 e!92740)))

(declare-fun lt!217177 () (_ BitVec 64))

(assert (=> b!139271 (= res!116091 (not (= lt!217177 (bvadd lt!217177 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217176)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139271 (= lt!217177 (bitIndex!0 (size!2868 (buf!3284 thiss!1634)) (currentByte!6114 thiss!1634) (currentBit!6109 thiss!1634)))))

(assert (=> b!139271 (= lt!217176 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5000 BitStream!5000) Bool)

(assert (=> b!139271 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217178 () Unit!8695)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5000) Unit!8695)

(assert (=> b!139271 (= lt!217178 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139272 () Bool)

(declare-fun res!116094 () Bool)

(assert (=> b!139272 (=> (not res!116094) (not e!92738))))

(assert (=> b!139272 (= res!116094 (bvsge from!447 to!404))))

(assert (= (and start!27072 res!116093) b!139268))

(assert (= (and b!139268 res!116092) b!139272))

(assert (= (and b!139272 res!116094) b!139271))

(assert (= (and b!139271 (not res!116091)) b!139270))

(assert (= start!27072 b!139269))

(declare-fun m!214251 () Bool)

(assert (=> start!27072 m!214251))

(declare-fun m!214253 () Bool)

(assert (=> start!27072 m!214253))

(declare-fun m!214255 () Bool)

(assert (=> b!139269 m!214255))

(declare-fun m!214257 () Bool)

(assert (=> b!139271 m!214257))

(declare-fun m!214259 () Bool)

(assert (=> b!139271 m!214259))

(declare-fun m!214261 () Bool)

(assert (=> b!139271 m!214261))

(declare-fun m!214263 () Bool)

(assert (=> b!139268 m!214263))

(declare-fun m!214265 () Bool)

(assert (=> b!139270 m!214265))

(declare-fun m!214267 () Bool)

(assert (=> b!139270 m!214267))

(declare-fun m!214269 () Bool)

(assert (=> b!139270 m!214269))

(declare-fun m!214271 () Bool)

(assert (=> b!139270 m!214271))

(push 1)

(assert (not b!139268))

(assert (not b!139271))

(assert (not start!27072))

(assert (not b!139269))

(assert (not b!139270))

(check-sat)

(pop 1)

