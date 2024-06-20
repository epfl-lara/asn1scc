; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27084 () Bool)

(assert start!27084)

(declare-fun b!139358 () Bool)

(declare-fun res!116166 () Bool)

(declare-fun e!92832 () Bool)

(assert (=> b!139358 (=> (not res!116166) (not e!92832))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139358 (= res!116166 (bvsge from!447 to!404))))

(declare-fun b!139359 () Bool)

(declare-fun e!92830 () Bool)

(assert (=> b!139359 (= e!92830 true)))

(declare-datatypes ((array!6349 0))(
  ( (array!6350 (arr!3569 (Array (_ BitVec 32) (_ BitVec 8))) (size!2874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5012 0))(
  ( (BitStream!5013 (buf!3290 array!6349) (currentByte!6120 (_ BitVec 32)) (currentBit!6115 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12214 0))(
  ( (tuple2!12215 (_1!6433 BitStream!5012) (_2!6433 BitStream!5012)) )
))
(declare-fun lt!217283 () tuple2!12214)

(declare-fun arr!237 () array!6349)

(declare-datatypes ((tuple2!12216 0))(
  ( (tuple2!12217 (_1!6434 BitStream!5012) (_2!6434 array!6349)) )
))
(declare-fun lt!217285 () tuple2!12216)

(declare-fun readByteArrayLoopPure!0 (BitStream!5012 array!6349 (_ BitVec 32) (_ BitVec 32)) tuple2!12216)

(assert (=> b!139359 (= lt!217285 (readByteArrayLoopPure!0 (_1!6433 lt!217283) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!5012)

(declare-fun lt!217282 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139359 (validate_offset_bits!1 ((_ sign_extend 32) (size!2874 (buf!3290 thiss!1634))) ((_ sign_extend 32) (currentByte!6120 thiss!1634)) ((_ sign_extend 32) (currentBit!6115 thiss!1634)) lt!217282)))

(declare-datatypes ((Unit!8707 0))(
  ( (Unit!8708) )
))
(declare-fun lt!217287 () Unit!8707)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5012 array!6349 (_ BitVec 64)) Unit!8707)

(assert (=> b!139359 (= lt!217287 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3290 thiss!1634) lt!217282))))

(declare-fun reader!0 (BitStream!5012 BitStream!5012) tuple2!12214)

(assert (=> b!139359 (= lt!217283 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139360 () Bool)

(declare-fun e!92831 () Bool)

(declare-fun array_inv!2663 (array!6349) Bool)

(assert (=> b!139360 (= e!92831 (array_inv!2663 (buf!3290 thiss!1634)))))

(declare-fun res!116165 () Bool)

(assert (=> start!27084 (=> (not res!116165) (not e!92832))))

(assert (=> start!27084 (= res!116165 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2874 arr!237))))))

(assert (=> start!27084 e!92832))

(assert (=> start!27084 true))

(assert (=> start!27084 (array_inv!2663 arr!237)))

(declare-fun inv!12 (BitStream!5012) Bool)

(assert (=> start!27084 (and (inv!12 thiss!1634) e!92831)))

(declare-fun b!139361 () Bool)

(declare-fun res!116163 () Bool)

(assert (=> b!139361 (=> (not res!116163) (not e!92832))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139361 (= res!116163 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2874 (buf!3290 thiss!1634))) ((_ sign_extend 32) (currentByte!6120 thiss!1634)) ((_ sign_extend 32) (currentBit!6115 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139362 () Bool)

(assert (=> b!139362 (= e!92832 (not e!92830))))

(declare-fun res!116164 () Bool)

(assert (=> b!139362 (=> res!116164 e!92830)))

(declare-fun lt!217286 () (_ BitVec 64))

(assert (=> b!139362 (= res!116164 (not (= lt!217286 (bvadd lt!217286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217282)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139362 (= lt!217286 (bitIndex!0 (size!2874 (buf!3290 thiss!1634)) (currentByte!6120 thiss!1634) (currentBit!6115 thiss!1634)))))

(assert (=> b!139362 (= lt!217282 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5012 BitStream!5012) Bool)

(assert (=> b!139362 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217284 () Unit!8707)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5012) Unit!8707)

(assert (=> b!139362 (= lt!217284 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!27084 res!116165) b!139361))

(assert (= (and b!139361 res!116163) b!139358))

(assert (= (and b!139358 res!116166) b!139362))

(assert (= (and b!139362 (not res!116164)) b!139359))

(assert (= start!27084 b!139360))

(declare-fun m!214383 () Bool)

(assert (=> b!139359 m!214383))

(declare-fun m!214385 () Bool)

(assert (=> b!139359 m!214385))

(declare-fun m!214387 () Bool)

(assert (=> b!139359 m!214387))

(declare-fun m!214389 () Bool)

(assert (=> b!139359 m!214389))

(declare-fun m!214391 () Bool)

(assert (=> b!139361 m!214391))

(declare-fun m!214393 () Bool)

(assert (=> b!139360 m!214393))

(declare-fun m!214395 () Bool)

(assert (=> b!139362 m!214395))

(declare-fun m!214397 () Bool)

(assert (=> b!139362 m!214397))

(declare-fun m!214399 () Bool)

(assert (=> b!139362 m!214399))

(declare-fun m!214401 () Bool)

(assert (=> start!27084 m!214401))

(declare-fun m!214403 () Bool)

(assert (=> start!27084 m!214403))

(push 1)

(assert (not b!139360))

(assert (not b!139361))

(assert (not b!139359))

(assert (not start!27084))

(assert (not b!139362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

