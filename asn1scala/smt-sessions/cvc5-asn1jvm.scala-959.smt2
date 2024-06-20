; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27080 () Bool)

(assert start!27080)

(declare-fun b!139328 () Bool)

(declare-fun res!116140 () Bool)

(declare-fun e!92798 () Bool)

(assert (=> b!139328 (=> (not res!116140) (not e!92798))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6345 0))(
  ( (array!6346 (arr!3567 (Array (_ BitVec 32) (_ BitVec 8))) (size!2872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5008 0))(
  ( (BitStream!5009 (buf!3288 array!6345) (currentByte!6118 (_ BitVec 32)) (currentBit!6113 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5008)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139328 (= res!116140 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2872 (buf!3288 thiss!1634))) ((_ sign_extend 32) (currentByte!6118 thiss!1634)) ((_ sign_extend 32) (currentBit!6113 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139329 () Bool)

(declare-fun e!92802 () Bool)

(assert (=> b!139329 (= e!92802 true)))

(declare-fun arr!237 () array!6345)

(declare-datatypes ((tuple2!12206 0))(
  ( (tuple2!12207 (_1!6429 BitStream!5008) (_2!6429 BitStream!5008)) )
))
(declare-fun lt!217246 () tuple2!12206)

(declare-datatypes ((tuple2!12208 0))(
  ( (tuple2!12209 (_1!6430 BitStream!5008) (_2!6430 array!6345)) )
))
(declare-fun lt!217247 () tuple2!12208)

(declare-fun readByteArrayLoopPure!0 (BitStream!5008 array!6345 (_ BitVec 32) (_ BitVec 32)) tuple2!12208)

(assert (=> b!139329 (= lt!217247 (readByteArrayLoopPure!0 (_1!6429 lt!217246) arr!237 from!447 to!404))))

(declare-fun lt!217249 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139329 (validate_offset_bits!1 ((_ sign_extend 32) (size!2872 (buf!3288 thiss!1634))) ((_ sign_extend 32) (currentByte!6118 thiss!1634)) ((_ sign_extend 32) (currentBit!6113 thiss!1634)) lt!217249)))

(declare-datatypes ((Unit!8703 0))(
  ( (Unit!8704) )
))
(declare-fun lt!217250 () Unit!8703)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5008 array!6345 (_ BitVec 64)) Unit!8703)

(assert (=> b!139329 (= lt!217250 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3288 thiss!1634) lt!217249))))

(declare-fun reader!0 (BitStream!5008 BitStream!5008) tuple2!12206)

(assert (=> b!139329 (= lt!217246 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139330 () Bool)

(assert (=> b!139330 (= e!92798 (not e!92802))))

(declare-fun res!116142 () Bool)

(assert (=> b!139330 (=> res!116142 e!92802)))

(declare-fun lt!217248 () (_ BitVec 64))

(assert (=> b!139330 (= res!116142 (not (= lt!217248 (bvadd lt!217248 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217249)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139330 (= lt!217248 (bitIndex!0 (size!2872 (buf!3288 thiss!1634)) (currentByte!6118 thiss!1634) (currentBit!6113 thiss!1634)))))

(assert (=> b!139330 (= lt!217249 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5008 BitStream!5008) Bool)

(assert (=> b!139330 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217251 () Unit!8703)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5008) Unit!8703)

(assert (=> b!139330 (= lt!217251 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!116141 () Bool)

(assert (=> start!27080 (=> (not res!116141) (not e!92798))))

(assert (=> start!27080 (= res!116141 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2872 arr!237))))))

(assert (=> start!27080 e!92798))

(assert (=> start!27080 true))

(declare-fun array_inv!2661 (array!6345) Bool)

(assert (=> start!27080 (array_inv!2661 arr!237)))

(declare-fun e!92800 () Bool)

(declare-fun inv!12 (BitStream!5008) Bool)

(assert (=> start!27080 (and (inv!12 thiss!1634) e!92800)))

(declare-fun b!139331 () Bool)

(declare-fun res!116139 () Bool)

(assert (=> b!139331 (=> (not res!116139) (not e!92798))))

(assert (=> b!139331 (= res!116139 (bvsge from!447 to!404))))

(declare-fun b!139332 () Bool)

(assert (=> b!139332 (= e!92800 (array_inv!2661 (buf!3288 thiss!1634)))))

(assert (= (and start!27080 res!116141) b!139328))

(assert (= (and b!139328 res!116140) b!139331))

(assert (= (and b!139331 res!116139) b!139330))

(assert (= (and b!139330 (not res!116142)) b!139329))

(assert (= start!27080 b!139332))

(declare-fun m!214339 () Bool)

(assert (=> b!139328 m!214339))

(declare-fun m!214341 () Bool)

(assert (=> b!139330 m!214341))

(declare-fun m!214343 () Bool)

(assert (=> b!139330 m!214343))

(declare-fun m!214345 () Bool)

(assert (=> b!139330 m!214345))

(declare-fun m!214347 () Bool)

(assert (=> start!27080 m!214347))

(declare-fun m!214349 () Bool)

(assert (=> start!27080 m!214349))

(declare-fun m!214351 () Bool)

(assert (=> b!139329 m!214351))

(declare-fun m!214353 () Bool)

(assert (=> b!139329 m!214353))

(declare-fun m!214355 () Bool)

(assert (=> b!139329 m!214355))

(declare-fun m!214357 () Bool)

(assert (=> b!139329 m!214357))

(declare-fun m!214359 () Bool)

(assert (=> b!139332 m!214359))

(push 1)

(assert (not b!139330))

(assert (not b!139329))

(assert (not b!139332))

(assert (not start!27080))

(assert (not b!139328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

