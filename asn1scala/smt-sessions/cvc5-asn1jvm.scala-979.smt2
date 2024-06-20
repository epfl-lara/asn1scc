; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27462 () Bool)

(assert start!27462)

(declare-fun b!141240 () Bool)

(declare-fun e!94095 () Bool)

(declare-datatypes ((array!6477 0))(
  ( (array!6478 (arr!3639 (Array (_ BitVec 32) (_ BitVec 8))) (size!2932 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5122 0))(
  ( (BitStream!5123 (buf!3353 array!6477) (currentByte!6213 (_ BitVec 32)) (currentBit!6208 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5122)

(declare-fun array_inv!2721 (array!6477) Bool)

(assert (=> b!141240 (= e!94095 (array_inv!2721 (buf!3353 thiss!1634)))))

(declare-fun res!117796 () Bool)

(declare-fun e!94096 () Bool)

(assert (=> start!27462 (=> (not res!117796) (not e!94096))))

(declare-fun arr!237 () array!6477)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27462 (= res!117796 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2932 arr!237))))))

(assert (=> start!27462 e!94096))

(assert (=> start!27462 true))

(assert (=> start!27462 (array_inv!2721 arr!237)))

(declare-fun inv!12 (BitStream!5122) Bool)

(assert (=> start!27462 (and (inv!12 thiss!1634) e!94095)))

(declare-fun b!141241 () Bool)

(declare-fun res!117803 () Bool)

(assert (=> b!141241 (=> (not res!117803) (not e!94096))))

(assert (=> b!141241 (= res!117803 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12472 0))(
  ( (tuple2!12473 (_1!6566 BitStream!5122) (_2!6566 BitStream!5122)) )
))
(declare-fun lt!219367 () tuple2!12472)

(declare-fun b!141242 () Bool)

(declare-datatypes ((tuple2!12474 0))(
  ( (tuple2!12475 (_1!6567 BitStream!5122) (_2!6567 (_ BitVec 8))) )
))
(declare-fun lt!219362 () tuple2!12474)

(declare-fun e!94094 () Bool)

(assert (=> b!141242 (= e!94094 (and (= (_2!6567 lt!219362) (select (arr!3639 arr!237) from!447)) (= (_1!6567 lt!219362) (_2!6566 lt!219367))))))

(declare-fun readBytePure!0 (BitStream!5122) tuple2!12474)

(assert (=> b!141242 (= lt!219362 (readBytePure!0 (_1!6566 lt!219367)))))

(declare-datatypes ((Unit!8846 0))(
  ( (Unit!8847) )
))
(declare-datatypes ((tuple2!12476 0))(
  ( (tuple2!12477 (_1!6568 Unit!8846) (_2!6568 BitStream!5122)) )
))
(declare-fun lt!219359 () tuple2!12476)

(declare-fun reader!0 (BitStream!5122 BitStream!5122) tuple2!12472)

(assert (=> b!141242 (= lt!219367 (reader!0 thiss!1634 (_2!6568 lt!219359)))))

(declare-fun b!141243 () Bool)

(declare-fun res!117805 () Bool)

(declare-fun e!94101 () Bool)

(assert (=> b!141243 (=> (not res!117805) (not e!94101))))

(declare-fun lt!219366 () tuple2!12476)

(declare-fun isPrefixOf!0 (BitStream!5122 BitStream!5122) Bool)

(assert (=> b!141243 (= res!117805 (isPrefixOf!0 (_2!6568 lt!219359) (_2!6568 lt!219366)))))

(declare-fun b!141244 () Bool)

(assert (=> b!141244 (= e!94096 (not true))))

(declare-fun lt!219365 () Bool)

(assert (=> b!141244 (= lt!219365 (isPrefixOf!0 thiss!1634 (_2!6568 lt!219359)))))

(declare-fun e!94098 () Bool)

(assert (=> b!141244 e!94098))

(declare-fun res!117804 () Bool)

(assert (=> b!141244 (=> (not res!117804) (not e!94098))))

(assert (=> b!141244 (= res!117804 (= (size!2932 (buf!3353 (_2!6568 lt!219359))) (size!2932 (buf!3353 (_2!6568 lt!219366)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5122 array!6477 (_ BitVec 32) (_ BitVec 32)) tuple2!12476)

(assert (=> b!141244 (= lt!219366 (appendByteArrayLoop!0 (_2!6568 lt!219359) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141244 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2932 (buf!3353 (_2!6568 lt!219359)))) ((_ sign_extend 32) (currentByte!6213 (_2!6568 lt!219359))) ((_ sign_extend 32) (currentBit!6208 (_2!6568 lt!219359))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219364 () Unit!8846)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5122 BitStream!5122 (_ BitVec 64) (_ BitVec 32)) Unit!8846)

(assert (=> b!141244 (= lt!219364 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6568 lt!219359) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141244 e!94094))

(declare-fun res!117797 () Bool)

(assert (=> b!141244 (=> (not res!117797) (not e!94094))))

(assert (=> b!141244 (= res!117797 (= (size!2932 (buf!3353 thiss!1634)) (size!2932 (buf!3353 (_2!6568 lt!219359)))))))

(declare-fun appendByte!0 (BitStream!5122 (_ BitVec 8)) tuple2!12476)

(assert (=> b!141244 (= lt!219359 (appendByte!0 thiss!1634 (select (arr!3639 arr!237) from!447)))))

(declare-fun b!141245 () Bool)

(declare-fun res!117801 () Bool)

(assert (=> b!141245 (=> (not res!117801) (not e!94096))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141245 (= res!117801 (invariant!0 (currentBit!6208 thiss!1634) (currentByte!6213 thiss!1634) (size!2932 (buf!3353 thiss!1634))))))

(declare-fun b!141246 () Bool)

(assert (=> b!141246 (= e!94098 e!94101)))

(declare-fun res!117800 () Bool)

(assert (=> b!141246 (=> (not res!117800) (not e!94101))))

(declare-fun lt!219360 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141246 (= res!117800 (= (bitIndex!0 (size!2932 (buf!3353 (_2!6568 lt!219366))) (currentByte!6213 (_2!6568 lt!219366)) (currentBit!6208 (_2!6568 lt!219366))) (bvadd (bitIndex!0 (size!2932 (buf!3353 (_2!6568 lt!219359))) (currentByte!6213 (_2!6568 lt!219359)) (currentBit!6208 (_2!6568 lt!219359))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219360))))))

(assert (=> b!141246 (= lt!219360 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!141247 () Bool)

(declare-fun e!94097 () Bool)

(assert (=> b!141247 (= e!94101 (not e!94097))))

(declare-fun res!117799 () Bool)

(assert (=> b!141247 (=> res!117799 e!94097)))

(declare-fun lt!219361 () tuple2!12472)

(declare-datatypes ((tuple2!12478 0))(
  ( (tuple2!12479 (_1!6569 BitStream!5122) (_2!6569 array!6477)) )
))
(declare-fun lt!219363 () tuple2!12478)

(assert (=> b!141247 (= res!117799 (or (not (= (size!2932 (_2!6569 lt!219363)) (size!2932 arr!237))) (not (= (_1!6569 lt!219363) (_2!6566 lt!219361)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5122 array!6477 (_ BitVec 32) (_ BitVec 32)) tuple2!12478)

(assert (=> b!141247 (= lt!219363 (readByteArrayLoopPure!0 (_1!6566 lt!219361) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141247 (validate_offset_bits!1 ((_ sign_extend 32) (size!2932 (buf!3353 (_2!6568 lt!219366)))) ((_ sign_extend 32) (currentByte!6213 (_2!6568 lt!219359))) ((_ sign_extend 32) (currentBit!6208 (_2!6568 lt!219359))) lt!219360)))

(declare-fun lt!219368 () Unit!8846)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5122 array!6477 (_ BitVec 64)) Unit!8846)

(assert (=> b!141247 (= lt!219368 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6568 lt!219359) (buf!3353 (_2!6568 lt!219366)) lt!219360))))

(assert (=> b!141247 (= lt!219361 (reader!0 (_2!6568 lt!219359) (_2!6568 lt!219366)))))

(declare-fun b!141248 () Bool)

(declare-fun res!117802 () Bool)

(assert (=> b!141248 (=> (not res!117802) (not e!94094))))

(assert (=> b!141248 (= res!117802 (isPrefixOf!0 thiss!1634 (_2!6568 lt!219359)))))

(declare-fun b!141249 () Bool)

(declare-fun res!117795 () Bool)

(assert (=> b!141249 (=> (not res!117795) (not e!94094))))

(assert (=> b!141249 (= res!117795 (= (bitIndex!0 (size!2932 (buf!3353 (_2!6568 lt!219359))) (currentByte!6213 (_2!6568 lt!219359)) (currentBit!6208 (_2!6568 lt!219359))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2932 (buf!3353 thiss!1634)) (currentByte!6213 thiss!1634) (currentBit!6208 thiss!1634)))))))

(declare-fun b!141250 () Bool)

(declare-fun res!117798 () Bool)

(assert (=> b!141250 (=> (not res!117798) (not e!94096))))

(assert (=> b!141250 (= res!117798 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2932 (buf!3353 thiss!1634))) ((_ sign_extend 32) (currentByte!6213 thiss!1634)) ((_ sign_extend 32) (currentBit!6208 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141251 () Bool)

(declare-fun arrayRangesEq!248 (array!6477 array!6477 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141251 (= e!94097 (not (arrayRangesEq!248 arr!237 (_2!6569 lt!219363) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!27462 res!117796) b!141250))

(assert (= (and b!141250 res!117798) b!141241))

(assert (= (and b!141241 res!117803) b!141245))

(assert (= (and b!141245 res!117801) b!141244))

(assert (= (and b!141244 res!117797) b!141249))

(assert (= (and b!141249 res!117795) b!141248))

(assert (= (and b!141248 res!117802) b!141242))

(assert (= (and b!141244 res!117804) b!141246))

(assert (= (and b!141246 res!117800) b!141243))

(assert (= (and b!141243 res!117805) b!141247))

(assert (= (and b!141247 (not res!117799)) b!141251))

(assert (= start!27462 b!141240))

(declare-fun m!217073 () Bool)

(assert (=> b!141245 m!217073))

(declare-fun m!217075 () Bool)

(assert (=> start!27462 m!217075))

(declare-fun m!217077 () Bool)

(assert (=> start!27462 m!217077))

(declare-fun m!217079 () Bool)

(assert (=> b!141250 m!217079))

(declare-fun m!217081 () Bool)

(assert (=> b!141240 m!217081))

(declare-fun m!217083 () Bool)

(assert (=> b!141244 m!217083))

(declare-fun m!217085 () Bool)

(assert (=> b!141244 m!217085))

(declare-fun m!217087 () Bool)

(assert (=> b!141244 m!217087))

(declare-fun m!217089 () Bool)

(assert (=> b!141244 m!217089))

(declare-fun m!217091 () Bool)

(assert (=> b!141244 m!217091))

(declare-fun m!217093 () Bool)

(assert (=> b!141244 m!217093))

(assert (=> b!141244 m!217091))

(declare-fun m!217095 () Bool)

(assert (=> b!141243 m!217095))

(declare-fun m!217097 () Bool)

(assert (=> b!141251 m!217097))

(assert (=> b!141248 m!217085))

(assert (=> b!141242 m!217091))

(declare-fun m!217099 () Bool)

(assert (=> b!141242 m!217099))

(declare-fun m!217101 () Bool)

(assert (=> b!141242 m!217101))

(declare-fun m!217103 () Bool)

(assert (=> b!141246 m!217103))

(declare-fun m!217105 () Bool)

(assert (=> b!141246 m!217105))

(declare-fun m!217107 () Bool)

(assert (=> b!141247 m!217107))

(declare-fun m!217109 () Bool)

(assert (=> b!141247 m!217109))

(declare-fun m!217111 () Bool)

(assert (=> b!141247 m!217111))

(declare-fun m!217113 () Bool)

(assert (=> b!141247 m!217113))

(assert (=> b!141249 m!217105))

(declare-fun m!217115 () Bool)

(assert (=> b!141249 m!217115))

(push 1)

(assert (not b!141242))

(assert (not b!141248))

(assert (not b!141247))

(assert (not b!141251))

(assert (not b!141243))

(assert (not b!141244))

(assert (not b!141245))

(assert (not b!141250))

(assert (not start!27462))

(assert (not b!141246))

(assert (not b!141249))

(assert (not b!141240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

