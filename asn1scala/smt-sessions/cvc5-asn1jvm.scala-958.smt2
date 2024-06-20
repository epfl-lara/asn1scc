; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27074 () Bool)

(assert start!27074)

(declare-fun b!139283 () Bool)

(declare-fun e!92756 () Bool)

(declare-fun e!92757 () Bool)

(assert (=> b!139283 (= e!92756 (not e!92757))))

(declare-fun res!116104 () Bool)

(assert (=> b!139283 (=> res!116104 e!92757)))

(declare-fun lt!217196 () (_ BitVec 64))

(declare-fun lt!217194 () (_ BitVec 64))

(assert (=> b!139283 (= res!116104 (not (= lt!217196 (bvadd lt!217196 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217194)))))))

(declare-datatypes ((array!6339 0))(
  ( (array!6340 (arr!3564 (Array (_ BitVec 32) (_ BitVec 8))) (size!2869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5002 0))(
  ( (BitStream!5003 (buf!3285 array!6339) (currentByte!6115 (_ BitVec 32)) (currentBit!6110 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5002)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139283 (= lt!217196 (bitIndex!0 (size!2869 (buf!3285 thiss!1634)) (currentByte!6115 thiss!1634) (currentBit!6110 thiss!1634)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!139283 (= lt!217194 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5002 BitStream!5002) Bool)

(assert (=> b!139283 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8697 0))(
  ( (Unit!8698) )
))
(declare-fun lt!217192 () Unit!8697)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5002) Unit!8697)

(assert (=> b!139283 (= lt!217192 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139284 () Bool)

(declare-fun e!92755 () Bool)

(declare-fun array_inv!2658 (array!6339) Bool)

(assert (=> b!139284 (= e!92755 (array_inv!2658 (buf!3285 thiss!1634)))))

(declare-fun b!139285 () Bool)

(assert (=> b!139285 (= e!92757 true)))

(declare-datatypes ((tuple2!12194 0))(
  ( (tuple2!12195 (_1!6423 BitStream!5002) (_2!6423 BitStream!5002)) )
))
(declare-fun lt!217193 () tuple2!12194)

(declare-fun arr!237 () array!6339)

(declare-datatypes ((tuple2!12196 0))(
  ( (tuple2!12197 (_1!6424 BitStream!5002) (_2!6424 array!6339)) )
))
(declare-fun lt!217197 () tuple2!12196)

(declare-fun readByteArrayLoopPure!0 (BitStream!5002 array!6339 (_ BitVec 32) (_ BitVec 32)) tuple2!12196)

(assert (=> b!139285 (= lt!217197 (readByteArrayLoopPure!0 (_1!6423 lt!217193) arr!237 from!447 to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139285 (validate_offset_bits!1 ((_ sign_extend 32) (size!2869 (buf!3285 thiss!1634))) ((_ sign_extend 32) (currentByte!6115 thiss!1634)) ((_ sign_extend 32) (currentBit!6110 thiss!1634)) lt!217194)))

(declare-fun lt!217195 () Unit!8697)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5002 array!6339 (_ BitVec 64)) Unit!8697)

(assert (=> b!139285 (= lt!217195 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3285 thiss!1634) lt!217194))))

(declare-fun reader!0 (BitStream!5002 BitStream!5002) tuple2!12194)

(assert (=> b!139285 (= lt!217193 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139286 () Bool)

(declare-fun res!116106 () Bool)

(assert (=> b!139286 (=> (not res!116106) (not e!92756))))

(assert (=> b!139286 (= res!116106 (bvsge from!447 to!404))))

(declare-fun res!116105 () Bool)

(assert (=> start!27074 (=> (not res!116105) (not e!92756))))

(assert (=> start!27074 (= res!116105 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2869 arr!237))))))

(assert (=> start!27074 e!92756))

(assert (=> start!27074 true))

(assert (=> start!27074 (array_inv!2658 arr!237)))

(declare-fun inv!12 (BitStream!5002) Bool)

(assert (=> start!27074 (and (inv!12 thiss!1634) e!92755)))

(declare-fun b!139287 () Bool)

(declare-fun res!116103 () Bool)

(assert (=> b!139287 (=> (not res!116103) (not e!92756))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139287 (= res!116103 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2869 (buf!3285 thiss!1634))) ((_ sign_extend 32) (currentByte!6115 thiss!1634)) ((_ sign_extend 32) (currentBit!6110 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27074 res!116105) b!139287))

(assert (= (and b!139287 res!116103) b!139286))

(assert (= (and b!139286 res!116106) b!139283))

(assert (= (and b!139283 (not res!116104)) b!139285))

(assert (= start!27074 b!139284))

(declare-fun m!214273 () Bool)

(assert (=> b!139287 m!214273))

(declare-fun m!214275 () Bool)

(assert (=> b!139284 m!214275))

(declare-fun m!214277 () Bool)

(assert (=> start!27074 m!214277))

(declare-fun m!214279 () Bool)

(assert (=> start!27074 m!214279))

(declare-fun m!214281 () Bool)

(assert (=> b!139285 m!214281))

(declare-fun m!214283 () Bool)

(assert (=> b!139285 m!214283))

(declare-fun m!214285 () Bool)

(assert (=> b!139285 m!214285))

(declare-fun m!214287 () Bool)

(assert (=> b!139285 m!214287))

(declare-fun m!214289 () Bool)

(assert (=> b!139283 m!214289))

(declare-fun m!214291 () Bool)

(assert (=> b!139283 m!214291))

(declare-fun m!214293 () Bool)

(assert (=> b!139283 m!214293))

(push 1)

(assert (not b!139287))

(assert (not b!139283))

(assert (not b!139284))

(assert (not start!27074))

(assert (not b!139285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

