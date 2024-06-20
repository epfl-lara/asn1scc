; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44320 () Bool)

(assert start!44320)

(declare-fun b!211197 () Bool)

(declare-fun e!144034 () Bool)

(declare-datatypes ((array!10503 0))(
  ( (array!10504 (arr!5544 (Array (_ BitVec 32) (_ BitVec 8))) (size!4614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8336 0))(
  ( (BitStream!8337 (buf!5137 array!10503) (currentByte!9691 (_ BitVec 32)) (currentBit!9686 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18090 0))(
  ( (tuple2!18091 (_1!9700 BitStream!8336) (_2!9700 Bool)) )
))
(declare-fun lt!332154 () tuple2!18090)

(declare-fun lt!332163 () tuple2!18090)

(assert (=> b!211197 (= e!144034 (= (_2!9700 lt!332154) (_2!9700 lt!332163)))))

(declare-fun b!211198 () Bool)

(declare-fun e!144040 () Bool)

(declare-fun e!144035 () Bool)

(assert (=> b!211198 (= e!144040 e!144035)))

(declare-fun res!177365 () Bool)

(assert (=> b!211198 (=> res!177365 e!144035)))

(declare-fun lt!332165 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!332158 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!211198 (= res!177365 (not (= lt!332158 (bvsub (bvsub (bvadd lt!332165 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!15056 0))(
  ( (Unit!15057) )
))
(declare-datatypes ((tuple2!18092 0))(
  ( (tuple2!18093 (_1!9701 Unit!15056) (_2!9701 BitStream!8336)) )
))
(declare-fun lt!332168 () tuple2!18092)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211198 (= lt!332158 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168))))))

(declare-fun thiss!1204 () BitStream!8336)

(declare-fun isPrefixOf!0 (BitStream!8336 BitStream!8336) Bool)

(assert (=> b!211198 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332168))))

(declare-fun lt!332159 () Unit!15056)

(declare-fun lt!332149 () tuple2!18092)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8336 BitStream!8336 BitStream!8336) Unit!15056)

(assert (=> b!211198 (= lt!332159 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9701 lt!332149) (_2!9701 lt!332168)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8336 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18092)

(assert (=> b!211198 (= lt!332168 (appendBitsLSBFirstLoopTR!0 (_2!9701 lt!332149) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!211199 () Bool)

(declare-fun res!177356 () Bool)

(assert (=> b!211199 (=> res!177356 e!144035)))

(assert (=> b!211199 (= res!177356 (not (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332168))))))

(declare-fun b!211200 () Bool)

(declare-fun res!177358 () Bool)

(assert (=> b!211200 (=> res!177358 e!144035)))

(declare-fun lt!332148 () (_ BitVec 64))

(assert (=> b!211200 (= res!177358 (or (not (= (size!4614 (buf!5137 (_2!9701 lt!332168))) (size!4614 (buf!5137 thiss!1204)))) (not (= lt!332158 (bvsub (bvadd lt!332148 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211201 () Bool)

(declare-fun e!144037 () Bool)

(assert (=> b!211201 (= e!144037 (not e!144040))))

(declare-fun res!177352 () Bool)

(assert (=> b!211201 (=> res!177352 e!144040)))

(assert (=> b!211201 (= res!177352 (not (= lt!332165 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!332148))))))

(assert (=> b!211201 (= lt!332165 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(assert (=> b!211201 (= lt!332148 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun e!144031 () Bool)

(assert (=> b!211201 e!144031))

(declare-fun res!177353 () Bool)

(assert (=> b!211201 (=> (not res!177353) (not e!144031))))

(assert (=> b!211201 (= res!177353 (= (size!4614 (buf!5137 thiss!1204)) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(declare-fun lt!332153 () Bool)

(declare-fun appendBit!0 (BitStream!8336 Bool) tuple2!18092)

(assert (=> b!211201 (= lt!332149 (appendBit!0 thiss!1204 lt!332153))))

(declare-fun lt!332170 () (_ BitVec 64))

(assert (=> b!211201 (= lt!332153 (not (= (bvand v!189 lt!332170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211201 (= lt!332170 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!211203 () Bool)

(declare-datatypes ((tuple2!18094 0))(
  ( (tuple2!18095 (_1!9702 BitStream!8336) (_2!9702 BitStream!8336)) )
))
(declare-fun lt!332157 () tuple2!18094)

(declare-fun e!144036 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8336 (_ BitVec 64)) BitStream!8336)

(assert (=> b!211203 (= e!144036 (= (_1!9702 lt!332157) (withMovedBitIndex!0 (_2!9702 lt!332157) (bvsub lt!332165 lt!332158))))))

(declare-fun e!144030 () Bool)

(assert (=> b!211203 e!144030))

(declare-fun res!177368 () Bool)

(assert (=> b!211203 (=> (not res!177368) (not e!144030))))

(declare-datatypes ((tuple2!18096 0))(
  ( (tuple2!18097 (_1!9703 BitStream!8336) (_2!9703 (_ BitVec 64))) )
))
(declare-fun lt!332162 () tuple2!18096)

(declare-fun lt!332156 () tuple2!18096)

(assert (=> b!211203 (= res!177368 (and (= (_2!9703 lt!332162) (_2!9703 lt!332156)) (= (_1!9703 lt!332162) (_1!9703 lt!332156))))))

(declare-fun lt!332173 () tuple2!18094)

(declare-fun lt!332161 () (_ BitVec 64))

(declare-fun lt!332151 () Unit!15056)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15056)

(assert (=> b!211203 (= lt!332151 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161))))

(declare-fun lt!332150 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18096)

(assert (=> b!211203 (= lt!332156 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150))))

(declare-fun b!211204 () Bool)

(assert (=> b!211204 (= e!144030 (= (_1!9702 lt!332173) (withMovedBitIndex!0 (_2!9702 lt!332173) (bvsub lt!332148 lt!332158))))))

(declare-fun b!211205 () Bool)

(declare-fun res!177354 () Bool)

(assert (=> b!211205 (=> (not res!177354) (not e!144037))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211205 (= res!177354 (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204))))))

(declare-fun b!211206 () Bool)

(declare-fun res!177357 () Bool)

(assert (=> b!211206 (=> res!177357 e!144035)))

(assert (=> b!211206 (= res!177357 (not (isPrefixOf!0 thiss!1204 (_2!9701 lt!332149))))))

(declare-fun b!211207 () Bool)

(declare-fun e!144041 () Bool)

(declare-fun e!144042 () Bool)

(assert (=> b!211207 (= e!144041 e!144042)))

(declare-fun res!177355 () Bool)

(assert (=> b!211207 (=> (not res!177355) (not e!144042))))

(declare-fun lt!332152 () tuple2!18090)

(assert (=> b!211207 (= res!177355 (and (= (_2!9700 lt!332152) lt!332153) (= (_1!9700 lt!332152) (_2!9701 lt!332149))))))

(declare-fun readBitPure!0 (BitStream!8336) tuple2!18090)

(declare-fun readerFrom!0 (BitStream!8336 (_ BitVec 32) (_ BitVec 32)) BitStream!8336)

(assert (=> b!211207 (= lt!332152 (readBitPure!0 (readerFrom!0 (_2!9701 lt!332149) (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204))))))

(declare-fun b!211208 () Bool)

(declare-fun res!177359 () Bool)

(assert (=> b!211208 (=> (not res!177359) (not e!144037))))

(assert (=> b!211208 (= res!177359 (not (= i!590 nBits!348)))))

(declare-fun b!211209 () Bool)

(assert (=> b!211209 (= e!144035 e!144036)))

(declare-fun res!177367 () Bool)

(assert (=> b!211209 (=> res!177367 e!144036)))

(assert (=> b!211209 (= res!177367 (not (= (_1!9703 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332157) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150)) (_2!9702 lt!332157))))))

(declare-fun lt!332169 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211209 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332169)))

(declare-fun lt!332171 () Unit!15056)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8336 array!10503 (_ BitVec 64)) Unit!15056)

(assert (=> b!211209 (= lt!332171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332168)) lt!332169))))

(assert (=> b!211209 (= lt!332169 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!332174 () tuple2!18090)

(assert (=> b!211209 (= lt!332150 (bvor lt!332161 (ite (_2!9700 lt!332174) lt!332170 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211209 (= lt!332162 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161))))

(declare-fun lt!332155 () (_ BitVec 64))

(assert (=> b!211209 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)) lt!332155)))

(declare-fun lt!332164 () Unit!15056)

(assert (=> b!211209 (= lt!332164 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5137 (_2!9701 lt!332168)) lt!332155))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211209 (= lt!332161 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211209 (= (_2!9700 lt!332174) lt!332153)))

(assert (=> b!211209 (= lt!332174 (readBitPure!0 (_1!9702 lt!332173)))))

(declare-fun reader!0 (BitStream!8336 BitStream!8336) tuple2!18094)

(assert (=> b!211209 (= lt!332157 (reader!0 (_2!9701 lt!332149) (_2!9701 lt!332168)))))

(assert (=> b!211209 (= lt!332173 (reader!0 thiss!1204 (_2!9701 lt!332168)))))

(assert (=> b!211209 e!144034))

(declare-fun res!177364 () Bool)

(assert (=> b!211209 (=> (not res!177364) (not e!144034))))

(assert (=> b!211209 (= res!177364 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332154))) (currentByte!9691 (_1!9700 lt!332154)) (currentBit!9686 (_1!9700 lt!332154))) (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332163))) (currentByte!9691 (_1!9700 lt!332163)) (currentBit!9686 (_1!9700 lt!332163)))))))

(declare-fun lt!332172 () Unit!15056)

(declare-fun lt!332167 () BitStream!8336)

(declare-fun readBitPrefixLemma!0 (BitStream!8336 BitStream!8336) Unit!15056)

(assert (=> b!211209 (= lt!332172 (readBitPrefixLemma!0 lt!332167 (_2!9701 lt!332168)))))

(assert (=> b!211209 (= lt!332163 (readBitPure!0 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))))))

(assert (=> b!211209 (= lt!332154 (readBitPure!0 lt!332167))))

(declare-fun e!144033 () Bool)

(assert (=> b!211209 e!144033))

(declare-fun res!177363 () Bool)

(assert (=> b!211209 (=> (not res!177363) (not e!144033))))

(assert (=> b!211209 (= res!177363 (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (=> b!211209 (= lt!332167 (BitStream!8337 (buf!5137 (_2!9701 lt!332149)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun b!211210 () Bool)

(declare-fun e!144039 () Bool)

(assert (=> b!211210 (= e!144039 e!144037)))

(declare-fun res!177366 () Bool)

(assert (=> b!211210 (=> (not res!177366) (not e!144037))))

(assert (=> b!211210 (= res!177366 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)) lt!332155))))

(assert (=> b!211210 (= lt!332155 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211211 () Bool)

(assert (=> b!211211 (= e!144033 (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332168)))))))

(declare-fun b!211212 () Bool)

(assert (=> b!211212 (= e!144031 e!144041)))

(declare-fun res!177351 () Bool)

(assert (=> b!211212 (=> (not res!177351) (not e!144041))))

(declare-fun lt!332160 () (_ BitVec 64))

(declare-fun lt!332166 () (_ BitVec 64))

(assert (=> b!211212 (= res!177351 (= lt!332160 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!332166)))))

(assert (=> b!211212 (= lt!332160 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(assert (=> b!211212 (= lt!332166 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun res!177361 () Bool)

(assert (=> start!44320 (=> (not res!177361) (not e!144039))))

(assert (=> start!44320 (= res!177361 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44320 e!144039))

(assert (=> start!44320 true))

(declare-fun e!144032 () Bool)

(declare-fun inv!12 (BitStream!8336) Bool)

(assert (=> start!44320 (and (inv!12 thiss!1204) e!144032)))

(declare-fun b!211202 () Bool)

(declare-fun res!177360 () Bool)

(assert (=> b!211202 (=> (not res!177360) (not e!144041))))

(assert (=> b!211202 (= res!177360 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332149)))))

(declare-fun b!211213 () Bool)

(declare-fun res!177362 () Bool)

(assert (=> b!211213 (=> res!177362 e!144035)))

(assert (=> b!211213 (= res!177362 (not (invariant!0 (currentBit!9686 (_2!9701 lt!332168)) (currentByte!9691 (_2!9701 lt!332168)) (size!4614 (buf!5137 (_2!9701 lt!332168))))))))

(declare-fun b!211214 () Bool)

(declare-fun array_inv!4355 (array!10503) Bool)

(assert (=> b!211214 (= e!144032 (array_inv!4355 (buf!5137 thiss!1204)))))

(declare-fun b!211215 () Bool)

(assert (=> b!211215 (= e!144042 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332152))) (currentByte!9691 (_1!9700 lt!332152)) (currentBit!9686 (_1!9700 lt!332152))) lt!332160))))

(assert (= (and start!44320 res!177361) b!211210))

(assert (= (and b!211210 res!177366) b!211205))

(assert (= (and b!211205 res!177354) b!211208))

(assert (= (and b!211208 res!177359) b!211201))

(assert (= (and b!211201 res!177353) b!211212))

(assert (= (and b!211212 res!177351) b!211202))

(assert (= (and b!211202 res!177360) b!211207))

(assert (= (and b!211207 res!177355) b!211215))

(assert (= (and b!211201 (not res!177352)) b!211198))

(assert (= (and b!211198 (not res!177365)) b!211213))

(assert (= (and b!211213 (not res!177362)) b!211200))

(assert (= (and b!211200 (not res!177358)) b!211199))

(assert (= (and b!211199 (not res!177356)) b!211206))

(assert (= (and b!211206 (not res!177357)) b!211209))

(assert (= (and b!211209 res!177363) b!211211))

(assert (= (and b!211209 res!177364) b!211197))

(assert (= (and b!211209 (not res!177367)) b!211203))

(assert (= (and b!211203 res!177368) b!211204))

(assert (= start!44320 b!211214))

(declare-fun m!325347 () Bool)

(assert (=> b!211199 m!325347))

(declare-fun m!325349 () Bool)

(assert (=> b!211209 m!325349))

(declare-fun m!325351 () Bool)

(assert (=> b!211209 m!325351))

(declare-fun m!325353 () Bool)

(assert (=> b!211209 m!325353))

(declare-fun m!325355 () Bool)

(assert (=> b!211209 m!325355))

(declare-fun m!325357 () Bool)

(assert (=> b!211209 m!325357))

(declare-fun m!325359 () Bool)

(assert (=> b!211209 m!325359))

(declare-fun m!325361 () Bool)

(assert (=> b!211209 m!325361))

(declare-fun m!325363 () Bool)

(assert (=> b!211209 m!325363))

(declare-fun m!325365 () Bool)

(assert (=> b!211209 m!325365))

(declare-fun m!325367 () Bool)

(assert (=> b!211209 m!325367))

(declare-fun m!325369 () Bool)

(assert (=> b!211209 m!325369))

(declare-fun m!325371 () Bool)

(assert (=> b!211209 m!325371))

(declare-fun m!325373 () Bool)

(assert (=> b!211209 m!325373))

(declare-fun m!325375 () Bool)

(assert (=> b!211209 m!325375))

(declare-fun m!325377 () Bool)

(assert (=> b!211209 m!325377))

(declare-fun m!325379 () Bool)

(assert (=> b!211209 m!325379))

(declare-fun m!325381 () Bool)

(assert (=> b!211201 m!325381))

(declare-fun m!325383 () Bool)

(assert (=> b!211201 m!325383))

(declare-fun m!325385 () Bool)

(assert (=> b!211201 m!325385))

(declare-fun m!325387 () Bool)

(assert (=> b!211207 m!325387))

(assert (=> b!211207 m!325387))

(declare-fun m!325389 () Bool)

(assert (=> b!211207 m!325389))

(declare-fun m!325391 () Bool)

(assert (=> b!211213 m!325391))

(declare-fun m!325393 () Bool)

(assert (=> b!211203 m!325393))

(declare-fun m!325395 () Bool)

(assert (=> b!211203 m!325395))

(declare-fun m!325397 () Bool)

(assert (=> b!211203 m!325397))

(assert (=> b!211203 m!325397))

(declare-fun m!325399 () Bool)

(assert (=> b!211203 m!325399))

(declare-fun m!325401 () Bool)

(assert (=> b!211210 m!325401))

(declare-fun m!325403 () Bool)

(assert (=> b!211211 m!325403))

(assert (=> b!211212 m!325381))

(assert (=> b!211212 m!325383))

(declare-fun m!325405 () Bool)

(assert (=> b!211215 m!325405))

(declare-fun m!325407 () Bool)

(assert (=> start!44320 m!325407))

(declare-fun m!325409 () Bool)

(assert (=> b!211206 m!325409))

(declare-fun m!325411 () Bool)

(assert (=> b!211204 m!325411))

(declare-fun m!325413 () Bool)

(assert (=> b!211214 m!325413))

(declare-fun m!325415 () Bool)

(assert (=> b!211205 m!325415))

(declare-fun m!325417 () Bool)

(assert (=> b!211198 m!325417))

(declare-fun m!325419 () Bool)

(assert (=> b!211198 m!325419))

(declare-fun m!325421 () Bool)

(assert (=> b!211198 m!325421))

(declare-fun m!325423 () Bool)

(assert (=> b!211198 m!325423))

(assert (=> b!211202 m!325409))

(push 1)

(assert (not b!211203))

(assert (not b!211198))

(assert (not b!211206))

(assert (not b!211213))

(assert (not b!211211))

(assert (not b!211205))

(assert (not b!211209))

(assert (not b!211207))

(assert (not start!44320))

(assert (not b!211204))

(assert (not b!211210))

(assert (not b!211199))

(assert (not b!211215))

(assert (not b!211214))

(assert (not b!211212))

(assert (not b!211201))

(assert (not b!211202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71487 () Bool)

(declare-fun e!144045 () Bool)

(assert (=> d!71487 e!144045))

(declare-fun res!177373 () Bool)

(assert (=> d!71487 (=> (not res!177373) (not e!144045))))

(declare-fun lt!332187 () (_ BitVec 64))

(declare-fun lt!332192 () (_ BitVec 64))

(declare-fun lt!332189 () (_ BitVec 64))

(assert (=> d!71487 (= res!177373 (= lt!332187 (bvsub lt!332192 lt!332189)))))

(assert (=> d!71487 (or (= (bvand lt!332192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332192 lt!332189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71487 (= lt!332189 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332152)))) ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332152))) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332152)))))))

(declare-fun lt!332191 () (_ BitVec 64))

(declare-fun lt!332188 () (_ BitVec 64))

(assert (=> d!71487 (= lt!332192 (bvmul lt!332191 lt!332188))))

(assert (=> d!71487 (or (= lt!332191 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332188 (bvsdiv (bvmul lt!332191 lt!332188) lt!332191)))))

(assert (=> d!71487 (= lt!332188 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71487 (= lt!332191 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332152)))))))

(assert (=> d!71487 (= lt!332187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332152))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332152)))))))

(assert (=> d!71487 (invariant!0 (currentBit!9686 (_1!9700 lt!332152)) (currentByte!9691 (_1!9700 lt!332152)) (size!4614 (buf!5137 (_1!9700 lt!332152))))))

(assert (=> d!71487 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332152))) (currentByte!9691 (_1!9700 lt!332152)) (currentBit!9686 (_1!9700 lt!332152))) lt!332187)))

(declare-fun b!211220 () Bool)

(declare-fun res!177374 () Bool)

(assert (=> b!211220 (=> (not res!177374) (not e!144045))))

(assert (=> b!211220 (= res!177374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332187))))

(declare-fun b!211221 () Bool)

(declare-fun lt!332190 () (_ BitVec 64))

(assert (=> b!211221 (= e!144045 (bvsle lt!332187 (bvmul lt!332190 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211221 (or (= lt!332190 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332190 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332190)))))

(assert (=> b!211221 (= lt!332190 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332152)))))))

(assert (= (and d!71487 res!177373) b!211220))

(assert (= (and b!211220 res!177374) b!211221))

(declare-fun m!325425 () Bool)

(assert (=> d!71487 m!325425))

(declare-fun m!325427 () Bool)

(assert (=> d!71487 m!325427))

(assert (=> b!211215 d!71487))

(declare-fun d!71489 () Bool)

(assert (=> d!71489 (= (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204))) (and (bvsge (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9686 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9691 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204))) (and (= (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204)))))))))

(assert (=> b!211205 d!71489))

(declare-fun d!71491 () Bool)

(assert (=> d!71491 (= (array_inv!4355 (buf!5137 thiss!1204)) (bvsge (size!4614 (buf!5137 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211214 d!71491))

(declare-fun d!71493 () Bool)

(declare-fun e!144048 () Bool)

(assert (=> d!71493 e!144048))

(declare-fun res!177377 () Bool)

(assert (=> d!71493 (=> (not res!177377) (not e!144048))))

(declare-fun lt!332197 () BitStream!8336)

(declare-fun lt!332198 () (_ BitVec 64))

(assert (=> d!71493 (= res!177377 (= (bvadd lt!332198 (bvsub lt!332165 lt!332158)) (bitIndex!0 (size!4614 (buf!5137 lt!332197)) (currentByte!9691 lt!332197) (currentBit!9686 lt!332197))))))

(assert (=> d!71493 (or (not (= (bvand lt!332198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332165 lt!332158) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332198 (bvsub lt!332165 lt!332158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71493 (= lt!332198 (bitIndex!0 (size!4614 (buf!5137 (_2!9702 lt!332157))) (currentByte!9691 (_2!9702 lt!332157)) (currentBit!9686 (_2!9702 lt!332157))))))

(declare-fun moveBitIndex!0 (BitStream!8336 (_ BitVec 64)) tuple2!18092)

(assert (=> d!71493 (= lt!332197 (_2!9701 (moveBitIndex!0 (_2!9702 lt!332157) (bvsub lt!332165 lt!332158))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8336 (_ BitVec 64)) Bool)

(assert (=> d!71493 (moveBitIndexPrecond!0 (_2!9702 lt!332157) (bvsub lt!332165 lt!332158))))

(assert (=> d!71493 (= (withMovedBitIndex!0 (_2!9702 lt!332157) (bvsub lt!332165 lt!332158)) lt!332197)))

(declare-fun b!211224 () Bool)

(assert (=> b!211224 (= e!144048 (= (size!4614 (buf!5137 (_2!9702 lt!332157))) (size!4614 (buf!5137 lt!332197))))))

(assert (= (and d!71493 res!177377) b!211224))

(declare-fun m!325429 () Bool)

(assert (=> d!71493 m!325429))

(declare-fun m!325431 () Bool)

(assert (=> d!71493 m!325431))

(declare-fun m!325433 () Bool)

(assert (=> d!71493 m!325433))

(declare-fun m!325435 () Bool)

(assert (=> d!71493 m!325435))

(assert (=> b!211203 d!71493))

(declare-fun d!71495 () Bool)

(declare-fun lt!332213 () tuple2!18096)

(declare-fun lt!332216 () tuple2!18096)

(assert (=> d!71495 (and (= (_2!9703 lt!332213) (_2!9703 lt!332216)) (= (_1!9703 lt!332213) (_1!9703 lt!332216)))))

(declare-fun lt!332215 () Bool)

(declare-fun lt!332212 () Unit!15056)

(declare-fun lt!332211 () BitStream!8336)

(declare-fun lt!332214 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18096 tuple2!18096 BitStream!8336 (_ BitVec 64) Bool BitStream!8336 (_ BitVec 64) tuple2!18096 tuple2!18096 BitStream!8336 (_ BitVec 64)) Unit!15056)

(assert (=> d!71495 (= lt!332212 (choose!56 (_1!9702 lt!332173) nBits!348 i!590 lt!332161 lt!332213 (tuple2!18097 (_1!9703 lt!332213) (_2!9703 lt!332213)) (_1!9703 lt!332213) (_2!9703 lt!332213) lt!332215 lt!332211 lt!332214 lt!332216 (tuple2!18097 (_1!9703 lt!332216) (_2!9703 lt!332216)) (_1!9703 lt!332216) (_2!9703 lt!332216)))))

(assert (=> d!71495 (= lt!332216 (readNBitsLSBFirstsLoopPure!0 lt!332211 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!332214))))

(assert (=> d!71495 (= lt!332214 (bvor lt!332161 (ite lt!332215 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71495 (= lt!332211 (withMovedBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71495 (= lt!332215 (_2!9700 (readBitPure!0 (_1!9702 lt!332173))))))

(assert (=> d!71495 (= lt!332213 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161))))

(assert (=> d!71495 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161) lt!332212)))

(declare-fun bs!17551 () Bool)

(assert (= bs!17551 d!71495))

(declare-fun m!325437 () Bool)

(assert (=> bs!17551 m!325437))

(assert (=> bs!17551 m!325375))

(assert (=> bs!17551 m!325361))

(declare-fun m!325439 () Bool)

(assert (=> bs!17551 m!325439))

(assert (=> bs!17551 m!325397))

(assert (=> b!211203 d!71495))

(declare-fun d!71497 () Bool)

(declare-datatypes ((tuple2!18098 0))(
  ( (tuple2!18099 (_1!9704 (_ BitVec 64)) (_2!9704 BitStream!8336)) )
))
(declare-fun lt!332219 () tuple2!18098)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18098)

(assert (=> d!71497 (= lt!332219 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150))))

(assert (=> d!71497 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150) (tuple2!18097 (_2!9704 lt!332219) (_1!9704 lt!332219)))))

(declare-fun bs!17552 () Bool)

(assert (= bs!17552 d!71497))

(assert (=> bs!17552 m!325397))

(declare-fun m!325441 () Bool)

(assert (=> bs!17552 m!325441))

(assert (=> b!211203 d!71497))

(declare-fun d!71499 () Bool)

(declare-fun e!144049 () Bool)

(assert (=> d!71499 e!144049))

(declare-fun res!177378 () Bool)

(assert (=> d!71499 (=> (not res!177378) (not e!144049))))

(declare-fun lt!332221 () (_ BitVec 64))

(declare-fun lt!332220 () BitStream!8336)

(assert (=> d!71499 (= res!177378 (= (bvadd lt!332221 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4614 (buf!5137 lt!332220)) (currentByte!9691 lt!332220) (currentBit!9686 lt!332220))))))

(assert (=> d!71499 (or (not (= (bvand lt!332221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332221 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71499 (= lt!332221 (bitIndex!0 (size!4614 (buf!5137 (_1!9702 lt!332173))) (currentByte!9691 (_1!9702 lt!332173)) (currentBit!9686 (_1!9702 lt!332173))))))

(assert (=> d!71499 (= lt!332220 (_2!9701 (moveBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71499 (moveBitIndexPrecond!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71499 (= (withMovedBitIndex!0 (_1!9702 lt!332173) #b0000000000000000000000000000000000000000000000000000000000000001) lt!332220)))

(declare-fun b!211225 () Bool)

(assert (=> b!211225 (= e!144049 (= (size!4614 (buf!5137 (_1!9702 lt!332173))) (size!4614 (buf!5137 lt!332220))))))

(assert (= (and d!71499 res!177378) b!211225))

(declare-fun m!325443 () Bool)

(assert (=> d!71499 m!325443))

(declare-fun m!325445 () Bool)

(assert (=> d!71499 m!325445))

(declare-fun m!325447 () Bool)

(assert (=> d!71499 m!325447))

(declare-fun m!325449 () Bool)

(assert (=> d!71499 m!325449))

(assert (=> b!211203 d!71499))

(declare-fun d!71501 () Bool)

(declare-fun e!144050 () Bool)

(assert (=> d!71501 e!144050))

(declare-fun res!177379 () Bool)

(assert (=> d!71501 (=> (not res!177379) (not e!144050))))

(declare-fun lt!332223 () (_ BitVec 64))

(declare-fun lt!332222 () BitStream!8336)

(assert (=> d!71501 (= res!177379 (= (bvadd lt!332223 (bvsub lt!332148 lt!332158)) (bitIndex!0 (size!4614 (buf!5137 lt!332222)) (currentByte!9691 lt!332222) (currentBit!9686 lt!332222))))))

(assert (=> d!71501 (or (not (= (bvand lt!332223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332148 lt!332158) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332223 (bvsub lt!332148 lt!332158)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71501 (= lt!332223 (bitIndex!0 (size!4614 (buf!5137 (_2!9702 lt!332173))) (currentByte!9691 (_2!9702 lt!332173)) (currentBit!9686 (_2!9702 lt!332173))))))

(assert (=> d!71501 (= lt!332222 (_2!9701 (moveBitIndex!0 (_2!9702 lt!332173) (bvsub lt!332148 lt!332158))))))

(assert (=> d!71501 (moveBitIndexPrecond!0 (_2!9702 lt!332173) (bvsub lt!332148 lt!332158))))

(assert (=> d!71501 (= (withMovedBitIndex!0 (_2!9702 lt!332173) (bvsub lt!332148 lt!332158)) lt!332222)))

(declare-fun b!211226 () Bool)

(assert (=> b!211226 (= e!144050 (= (size!4614 (buf!5137 (_2!9702 lt!332173))) (size!4614 (buf!5137 lt!332222))))))

(assert (= (and d!71501 res!177379) b!211226))

(declare-fun m!325451 () Bool)

(assert (=> d!71501 m!325451))

(declare-fun m!325453 () Bool)

(assert (=> d!71501 m!325453))

(declare-fun m!325455 () Bool)

(assert (=> d!71501 m!325455))

(declare-fun m!325457 () Bool)

(assert (=> d!71501 m!325457))

(assert (=> b!211204 d!71501))

(declare-fun d!71503 () Bool)

(declare-fun res!177386 () Bool)

(declare-fun e!144056 () Bool)

(assert (=> d!71503 (=> (not res!177386) (not e!144056))))

(assert (=> d!71503 (= res!177386 (= (size!4614 (buf!5137 thiss!1204)) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (=> d!71503 (= (isPrefixOf!0 thiss!1204 (_2!9701 lt!332149)) e!144056)))

(declare-fun b!211233 () Bool)

(declare-fun res!177387 () Bool)

(assert (=> b!211233 (=> (not res!177387) (not e!144056))))

(assert (=> b!211233 (= res!177387 (bvsle (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149)))))))

(declare-fun b!211234 () Bool)

(declare-fun e!144055 () Bool)

(assert (=> b!211234 (= e!144056 e!144055)))

(declare-fun res!177388 () Bool)

(assert (=> b!211234 (=> res!177388 e!144055)))

(assert (=> b!211234 (= res!177388 (= (size!4614 (buf!5137 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211235 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10503 array!10503 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211235 (= e!144055 (arrayBitRangesEq!0 (buf!5137 thiss!1204) (buf!5137 (_2!9701 lt!332149)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))))))

(assert (= (and d!71503 res!177386) b!211233))

(assert (= (and b!211233 res!177387) b!211234))

(assert (= (and b!211234 (not res!177388)) b!211235))

(assert (=> b!211233 m!325383))

(assert (=> b!211233 m!325381))

(assert (=> b!211235 m!325383))

(assert (=> b!211235 m!325383))

(declare-fun m!325459 () Bool)

(assert (=> b!211235 m!325459))

(assert (=> b!211202 d!71503))

(declare-fun d!71505 () Bool)

(assert (=> d!71505 (= (invariant!0 (currentBit!9686 (_2!9701 lt!332168)) (currentByte!9691 (_2!9701 lt!332168)) (size!4614 (buf!5137 (_2!9701 lt!332168)))) (and (bvsge (currentBit!9686 (_2!9701 lt!332168)) #b00000000000000000000000000000000) (bvslt (currentBit!9686 (_2!9701 lt!332168)) #b00000000000000000000000000001000) (bvsge (currentByte!9691 (_2!9701 lt!332168)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9691 (_2!9701 lt!332168)) (size!4614 (buf!5137 (_2!9701 lt!332168)))) (and (= (currentBit!9686 (_2!9701 lt!332168)) #b00000000000000000000000000000000) (= (currentByte!9691 (_2!9701 lt!332168)) (size!4614 (buf!5137 (_2!9701 lt!332168))))))))))

(assert (=> b!211213 d!71505))

(declare-fun d!71507 () Bool)

(assert (=> d!71507 (= (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332168)))) (and (bvsge (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9686 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9691 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332168)))) (and (= (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332168))))))))))

(assert (=> b!211211 d!71507))

(declare-fun d!71509 () Bool)

(declare-fun e!144057 () Bool)

(assert (=> d!71509 e!144057))

(declare-fun res!177389 () Bool)

(assert (=> d!71509 (=> (not res!177389) (not e!144057))))

(declare-fun lt!332229 () (_ BitVec 64))

(declare-fun lt!332226 () (_ BitVec 64))

(declare-fun lt!332224 () (_ BitVec 64))

(assert (=> d!71509 (= res!177389 (= lt!332224 (bvsub lt!332229 lt!332226)))))

(assert (=> d!71509 (or (= (bvand lt!332229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332229 lt!332226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71509 (= lt!332226 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332149)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149)))))))

(declare-fun lt!332228 () (_ BitVec 64))

(declare-fun lt!332225 () (_ BitVec 64))

(assert (=> d!71509 (= lt!332229 (bvmul lt!332228 lt!332225))))

(assert (=> d!71509 (or (= lt!332228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332225 (bvsdiv (bvmul lt!332228 lt!332225) lt!332228)))))

(assert (=> d!71509 (= lt!332225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71509 (= lt!332228 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (=> d!71509 (= lt!332224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149)))))))

(assert (=> d!71509 (invariant!0 (currentBit!9686 (_2!9701 lt!332149)) (currentByte!9691 (_2!9701 lt!332149)) (size!4614 (buf!5137 (_2!9701 lt!332149))))))

(assert (=> d!71509 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) lt!332224)))

(declare-fun b!211236 () Bool)

(declare-fun res!177390 () Bool)

(assert (=> b!211236 (=> (not res!177390) (not e!144057))))

(assert (=> b!211236 (= res!177390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332224))))

(declare-fun b!211237 () Bool)

(declare-fun lt!332227 () (_ BitVec 64))

(assert (=> b!211237 (= e!144057 (bvsle lt!332224 (bvmul lt!332227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211237 (or (= lt!332227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332227)))))

(assert (=> b!211237 (= lt!332227 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (= (and d!71509 res!177389) b!211236))

(assert (= (and b!211236 res!177390) b!211237))

(declare-fun m!325461 () Bool)

(assert (=> d!71509 m!325461))

(declare-fun m!325463 () Bool)

(assert (=> d!71509 m!325463))

(assert (=> b!211212 d!71509))

(declare-fun d!71511 () Bool)

(declare-fun e!144058 () Bool)

(assert (=> d!71511 e!144058))

(declare-fun res!177391 () Bool)

(assert (=> d!71511 (=> (not res!177391) (not e!144058))))

(declare-fun lt!332230 () (_ BitVec 64))

(declare-fun lt!332232 () (_ BitVec 64))

(declare-fun lt!332235 () (_ BitVec 64))

(assert (=> d!71511 (= res!177391 (= lt!332230 (bvsub lt!332235 lt!332232)))))

(assert (=> d!71511 (or (= (bvand lt!332235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332235 lt!332232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71511 (= lt!332232 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204))))))

(declare-fun lt!332234 () (_ BitVec 64))

(declare-fun lt!332231 () (_ BitVec 64))

(assert (=> d!71511 (= lt!332235 (bvmul lt!332234 lt!332231))))

(assert (=> d!71511 (or (= lt!332234 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332231 (bvsdiv (bvmul lt!332234 lt!332231) lt!332234)))))

(assert (=> d!71511 (= lt!332231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71511 (= lt!332234 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))))))

(assert (=> d!71511 (= lt!332230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 thiss!1204))))))

(assert (=> d!71511 (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204)))))

(assert (=> d!71511 (= (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)) lt!332230)))

(declare-fun b!211238 () Bool)

(declare-fun res!177392 () Bool)

(assert (=> b!211238 (=> (not res!177392) (not e!144058))))

(assert (=> b!211238 (= res!177392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332230))))

(declare-fun b!211239 () Bool)

(declare-fun lt!332233 () (_ BitVec 64))

(assert (=> b!211239 (= e!144058 (bvsle lt!332230 (bvmul lt!332233 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211239 (or (= lt!332233 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332233 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332233)))))

(assert (=> b!211239 (= lt!332233 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))))))

(assert (= (and d!71511 res!177391) b!211238))

(assert (= (and b!211238 res!177392) b!211239))

(declare-fun m!325465 () Bool)

(assert (=> d!71511 m!325465))

(assert (=> d!71511 m!325415))

(assert (=> b!211212 d!71511))

(assert (=> b!211201 d!71509))

(assert (=> b!211201 d!71511))

(declare-fun b!211250 () Bool)

(declare-fun res!177401 () Bool)

(declare-fun e!144063 () Bool)

(assert (=> b!211250 (=> (not res!177401) (not e!144063))))

(declare-fun lt!332244 () tuple2!18092)

(assert (=> b!211250 (= res!177401 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332244)))))

(declare-fun d!71513 () Bool)

(assert (=> d!71513 e!144063))

(declare-fun res!177403 () Bool)

(assert (=> d!71513 (=> (not res!177403) (not e!144063))))

(assert (=> d!71513 (= res!177403 (= (size!4614 (buf!5137 thiss!1204)) (size!4614 (buf!5137 (_2!9701 lt!332244)))))))

(declare-fun choose!16 (BitStream!8336 Bool) tuple2!18092)

(assert (=> d!71513 (= lt!332244 (choose!16 thiss!1204 lt!332153))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71513 (validate_offset_bit!0 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)))))

(assert (=> d!71513 (= (appendBit!0 thiss!1204 lt!332153) lt!332244)))

(declare-fun b!211251 () Bool)

(declare-fun e!144064 () Bool)

(assert (=> b!211251 (= e!144063 e!144064)))

(declare-fun res!177404 () Bool)

(assert (=> b!211251 (=> (not res!177404) (not e!144064))))

(declare-fun lt!332245 () tuple2!18090)

(assert (=> b!211251 (= res!177404 (and (= (_2!9700 lt!332245) lt!332153) (= (_1!9700 lt!332245) (_2!9701 lt!332244))))))

(assert (=> b!211251 (= lt!332245 (readBitPure!0 (readerFrom!0 (_2!9701 lt!332244) (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204))))))

(declare-fun b!211249 () Bool)

(declare-fun res!177402 () Bool)

(assert (=> b!211249 (=> (not res!177402) (not e!144063))))

(declare-fun lt!332247 () (_ BitVec 64))

(declare-fun lt!332246 () (_ BitVec 64))

(assert (=> b!211249 (= res!177402 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332244))) (currentByte!9691 (_2!9701 lt!332244)) (currentBit!9686 (_2!9701 lt!332244))) (bvadd lt!332246 lt!332247)))))

(assert (=> b!211249 (or (not (= (bvand lt!332246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332247 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332246 lt!332247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211249 (= lt!332247 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211249 (= lt!332246 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun b!211252 () Bool)

(assert (=> b!211252 (= e!144064 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332245))) (currentByte!9691 (_1!9700 lt!332245)) (currentBit!9686 (_1!9700 lt!332245))) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332244))) (currentByte!9691 (_2!9701 lt!332244)) (currentBit!9686 (_2!9701 lt!332244)))))))

(assert (= (and d!71513 res!177403) b!211249))

(assert (= (and b!211249 res!177402) b!211250))

(assert (= (and b!211250 res!177401) b!211251))

(assert (= (and b!211251 res!177404) b!211252))

(declare-fun m!325467 () Bool)

(assert (=> b!211250 m!325467))

(declare-fun m!325469 () Bool)

(assert (=> b!211251 m!325469))

(assert (=> b!211251 m!325469))

(declare-fun m!325471 () Bool)

(assert (=> b!211251 m!325471))

(declare-fun m!325473 () Bool)

(assert (=> d!71513 m!325473))

(declare-fun m!325475 () Bool)

(assert (=> d!71513 m!325475))

(declare-fun m!325477 () Bool)

(assert (=> b!211249 m!325477))

(assert (=> b!211249 m!325383))

(declare-fun m!325479 () Bool)

(assert (=> b!211252 m!325479))

(assert (=> b!211252 m!325477))

(assert (=> b!211201 d!71513))

(declare-fun d!71515 () Bool)

(assert (=> d!71515 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)) lt!332155) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 thiss!1204))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204))) lt!332155))))

(declare-fun bs!17553 () Bool)

(assert (= bs!17553 d!71515))

(assert (=> bs!17553 m!325465))

(assert (=> b!211210 d!71515))

(declare-fun d!71517 () Bool)

(declare-fun res!177405 () Bool)

(declare-fun e!144066 () Bool)

(assert (=> d!71517 (=> (not res!177405) (not e!144066))))

(assert (=> d!71517 (= res!177405 (= (size!4614 (buf!5137 (_2!9701 lt!332149))) (size!4614 (buf!5137 (_2!9701 lt!332168)))))))

(assert (=> d!71517 (= (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332168)) e!144066)))

(declare-fun b!211253 () Bool)

(declare-fun res!177406 () Bool)

(assert (=> b!211253 (=> (not res!177406) (not e!144066))))

(assert (=> b!211253 (= res!177406 (bvsle (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168)))))))

(declare-fun b!211254 () Bool)

(declare-fun e!144065 () Bool)

(assert (=> b!211254 (= e!144066 e!144065)))

(declare-fun res!177407 () Bool)

(assert (=> b!211254 (=> res!177407 e!144065)))

(assert (=> b!211254 (= res!177407 (= (size!4614 (buf!5137 (_2!9701 lt!332149))) #b00000000000000000000000000000000))))

(declare-fun b!211255 () Bool)

(assert (=> b!211255 (= e!144065 (arrayBitRangesEq!0 (buf!5137 (_2!9701 lt!332149)) (buf!5137 (_2!9701 lt!332168)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149)))))))

(assert (= (and d!71517 res!177405) b!211253))

(assert (= (and b!211253 res!177406) b!211254))

(assert (= (and b!211254 (not res!177407)) b!211255))

(assert (=> b!211253 m!325381))

(assert (=> b!211253 m!325417))

(assert (=> b!211255 m!325381))

(assert (=> b!211255 m!325381))

(declare-fun m!325481 () Bool)

(assert (=> b!211255 m!325481))

(assert (=> b!211199 d!71517))

(declare-fun d!71519 () Bool)

(declare-fun e!144067 () Bool)

(assert (=> d!71519 e!144067))

(declare-fun res!177408 () Bool)

(assert (=> d!71519 (=> (not res!177408) (not e!144067))))

(declare-fun lt!332253 () (_ BitVec 64))

(declare-fun lt!332248 () (_ BitVec 64))

(declare-fun lt!332250 () (_ BitVec 64))

(assert (=> d!71519 (= res!177408 (= lt!332248 (bvsub lt!332253 lt!332250)))))

(assert (=> d!71519 (or (= (bvand lt!332253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332253 lt!332250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71519 (= lt!332250 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332168))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332168)))))))

(declare-fun lt!332252 () (_ BitVec 64))

(declare-fun lt!332249 () (_ BitVec 64))

(assert (=> d!71519 (= lt!332253 (bvmul lt!332252 lt!332249))))

(assert (=> d!71519 (or (= lt!332252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332249 (bvsdiv (bvmul lt!332252 lt!332249) lt!332252)))))

(assert (=> d!71519 (= lt!332249 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71519 (= lt!332252 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))))))

(assert (=> d!71519 (= lt!332248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332168))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332168)))))))

(assert (=> d!71519 (invariant!0 (currentBit!9686 (_2!9701 lt!332168)) (currentByte!9691 (_2!9701 lt!332168)) (size!4614 (buf!5137 (_2!9701 lt!332168))))))

(assert (=> d!71519 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168))) lt!332248)))

(declare-fun b!211256 () Bool)

(declare-fun res!177409 () Bool)

(assert (=> b!211256 (=> (not res!177409) (not e!144067))))

(assert (=> b!211256 (= res!177409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332248))))

(declare-fun b!211257 () Bool)

(declare-fun lt!332251 () (_ BitVec 64))

(assert (=> b!211257 (= e!144067 (bvsle lt!332248 (bvmul lt!332251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211257 (or (= lt!332251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332251)))))

(assert (=> b!211257 (= lt!332251 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))))))

(assert (= (and d!71519 res!177408) b!211256))

(assert (= (and b!211256 res!177409) b!211257))

(declare-fun m!325483 () Bool)

(assert (=> d!71519 m!325483))

(assert (=> d!71519 m!325391))

(assert (=> b!211198 d!71519))

(declare-fun d!71521 () Bool)

(declare-fun res!177410 () Bool)

(declare-fun e!144069 () Bool)

(assert (=> d!71521 (=> (not res!177410) (not e!144069))))

(assert (=> d!71521 (= res!177410 (= (size!4614 (buf!5137 thiss!1204)) (size!4614 (buf!5137 (_2!9701 lt!332168)))))))

(assert (=> d!71521 (= (isPrefixOf!0 thiss!1204 (_2!9701 lt!332168)) e!144069)))

(declare-fun b!211258 () Bool)

(declare-fun res!177411 () Bool)

(assert (=> b!211258 (=> (not res!177411) (not e!144069))))

(assert (=> b!211258 (= res!177411 (bvsle (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168)))))))

(declare-fun b!211259 () Bool)

(declare-fun e!144068 () Bool)

(assert (=> b!211259 (= e!144069 e!144068)))

(declare-fun res!177412 () Bool)

(assert (=> b!211259 (=> res!177412 e!144068)))

(assert (=> b!211259 (= res!177412 (= (size!4614 (buf!5137 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211260 () Bool)

(assert (=> b!211260 (= e!144068 (arrayBitRangesEq!0 (buf!5137 thiss!1204) (buf!5137 (_2!9701 lt!332168)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))))))

(assert (= (and d!71521 res!177410) b!211258))

(assert (= (and b!211258 res!177411) b!211259))

(assert (= (and b!211259 (not res!177412)) b!211260))

(assert (=> b!211258 m!325383))

(assert (=> b!211258 m!325417))

(assert (=> b!211260 m!325383))

(assert (=> b!211260 m!325383))

(declare-fun m!325485 () Bool)

(assert (=> b!211260 m!325485))

(assert (=> b!211198 d!71521))

(declare-fun d!71523 () Bool)

(assert (=> d!71523 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332168))))

(declare-fun lt!332256 () Unit!15056)

(declare-fun choose!30 (BitStream!8336 BitStream!8336 BitStream!8336) Unit!15056)

(assert (=> d!71523 (= lt!332256 (choose!30 thiss!1204 (_2!9701 lt!332149) (_2!9701 lt!332168)))))

(assert (=> d!71523 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332149))))

(assert (=> d!71523 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9701 lt!332149) (_2!9701 lt!332168)) lt!332256)))

(declare-fun bs!17554 () Bool)

(assert (= bs!17554 d!71523))

(assert (=> bs!17554 m!325419))

(declare-fun m!325487 () Bool)

(assert (=> bs!17554 m!325487))

(assert (=> bs!17554 m!325409))

(assert (=> b!211198 d!71523))

(declare-fun b!211407 () Bool)

(declare-fun res!177538 () Bool)

(declare-fun e!144159 () Bool)

(assert (=> b!211407 (=> (not res!177538) (not e!144159))))

(declare-fun lt!332750 () (_ BitVec 64))

(declare-fun lt!332715 () (_ BitVec 64))

(declare-fun lt!332711 () tuple2!18092)

(assert (=> b!211407 (= res!177538 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332711))) (currentByte!9691 (_2!9701 lt!332711)) (currentBit!9686 (_2!9701 lt!332711))) (bvsub lt!332750 lt!332715)))))

(assert (=> b!211407 (or (= (bvand lt!332750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332715 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332750 lt!332715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211407 (= lt!332715 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!332704 () (_ BitVec 64))

(declare-fun lt!332738 () (_ BitVec 64))

(assert (=> b!211407 (= lt!332750 (bvadd lt!332704 lt!332738))))

(assert (=> b!211407 (or (not (= (bvand lt!332704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332738 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!332704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!332704 lt!332738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211407 (= lt!332738 ((_ sign_extend 32) nBits!348))))

(assert (=> b!211407 (= lt!332704 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(declare-fun b!211408 () Bool)

(declare-fun lt!332752 () tuple2!18090)

(declare-fun lt!332736 () tuple2!18092)

(assert (=> b!211408 (= lt!332752 (readBitPure!0 (readerFrom!0 (_2!9701 lt!332736) (currentBit!9686 (_2!9701 lt!332149)) (currentByte!9691 (_2!9701 lt!332149)))))))

(declare-fun lt!332718 () Bool)

(declare-fun res!177544 () Bool)

(assert (=> b!211408 (= res!177544 (and (= (_2!9700 lt!332752) lt!332718) (= (_1!9700 lt!332752) (_2!9701 lt!332736))))))

(declare-fun e!144160 () Bool)

(assert (=> b!211408 (=> (not res!177544) (not e!144160))))

(declare-fun e!144161 () Bool)

(assert (=> b!211408 (= e!144161 e!144160)))

(declare-fun b!211409 () Bool)

(declare-fun res!177546 () Bool)

(assert (=> b!211409 (=> (not res!177546) (not e!144159))))

(assert (=> b!211409 (= res!177546 (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332711)))))

(declare-fun b!211410 () Bool)

(declare-fun res!177540 () Bool)

(assert (=> b!211410 (=> (not res!177540) (not e!144159))))

(assert (=> b!211410 (= res!177540 (= (size!4614 (buf!5137 (_2!9701 lt!332149))) (size!4614 (buf!5137 (_2!9701 lt!332711)))))))

(declare-fun b!211411 () Bool)

(declare-fun e!144158 () Bool)

(declare-fun lt!332745 () tuple2!18090)

(declare-fun lt!332712 () tuple2!18090)

(assert (=> b!211411 (= e!144158 (= (_2!9700 lt!332745) (_2!9700 lt!332712)))))

(declare-fun b!211412 () Bool)

(declare-fun res!177539 () Bool)

(declare-fun call!3327 () Bool)

(assert (=> b!211412 (= res!177539 call!3327)))

(assert (=> b!211412 (=> (not res!177539) (not e!144161))))

(declare-fun b!211413 () Bool)

(declare-fun e!144156 () tuple2!18092)

(declare-fun lt!332744 () tuple2!18092)

(assert (=> b!211413 (= e!144156 (tuple2!18093 (_1!9701 lt!332744) (_2!9701 lt!332744)))))

(assert (=> b!211413 (= lt!332718 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211413 (= lt!332736 (appendBit!0 (_2!9701 lt!332149) lt!332718))))

(declare-fun res!177548 () Bool)

(assert (=> b!211413 (= res!177548 (= (size!4614 (buf!5137 (_2!9701 lt!332149))) (size!4614 (buf!5137 (_2!9701 lt!332736)))))))

(assert (=> b!211413 (=> (not res!177548) (not e!144161))))

(assert (=> b!211413 e!144161))

(declare-fun lt!332755 () tuple2!18092)

(assert (=> b!211413 (= lt!332755 lt!332736)))

(assert (=> b!211413 (= lt!332744 (appendBitsLSBFirstLoopTR!0 (_2!9701 lt!332755) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!332743 () Unit!15056)

(assert (=> b!211413 (= lt!332743 (lemmaIsPrefixTransitive!0 (_2!9701 lt!332149) (_2!9701 lt!332755) (_2!9701 lt!332744)))))

(assert (=> b!211413 (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332744))))

(declare-fun lt!332724 () Unit!15056)

(assert (=> b!211413 (= lt!332724 lt!332743)))

(assert (=> b!211413 (invariant!0 (currentBit!9686 (_2!9701 lt!332149)) (currentByte!9691 (_2!9701 lt!332149)) (size!4614 (buf!5137 (_2!9701 lt!332755))))))

(declare-fun lt!332757 () BitStream!8336)

(assert (=> b!211413 (= lt!332757 (BitStream!8337 (buf!5137 (_2!9701 lt!332755)) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(assert (=> b!211413 (invariant!0 (currentBit!9686 lt!332757) (currentByte!9691 lt!332757) (size!4614 (buf!5137 (_2!9701 lt!332744))))))

(declare-fun lt!332710 () BitStream!8336)

(assert (=> b!211413 (= lt!332710 (BitStream!8337 (buf!5137 (_2!9701 lt!332744)) (currentByte!9691 lt!332757) (currentBit!9686 lt!332757)))))

(assert (=> b!211413 (= lt!332745 (readBitPure!0 lt!332757))))

(assert (=> b!211413 (= lt!332712 (readBitPure!0 lt!332710))))

(declare-fun lt!332719 () Unit!15056)

(assert (=> b!211413 (= lt!332719 (readBitPrefixLemma!0 lt!332757 (_2!9701 lt!332744)))))

(declare-fun res!177541 () Bool)

(assert (=> b!211413 (= res!177541 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332745))) (currentByte!9691 (_1!9700 lt!332745)) (currentBit!9686 (_1!9700 lt!332745))) (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332712))) (currentByte!9691 (_1!9700 lt!332712)) (currentBit!9686 (_1!9700 lt!332712)))))))

(assert (=> b!211413 (=> (not res!177541) (not e!144158))))

(assert (=> b!211413 e!144158))

(declare-fun lt!332753 () Unit!15056)

(assert (=> b!211413 (= lt!332753 lt!332719)))

(declare-fun lt!332717 () tuple2!18094)

(assert (=> b!211413 (= lt!332717 (reader!0 (_2!9701 lt!332149) (_2!9701 lt!332744)))))

(declare-fun lt!332746 () tuple2!18094)

(assert (=> b!211413 (= lt!332746 (reader!0 (_2!9701 lt!332755) (_2!9701 lt!332744)))))

(declare-fun lt!332720 () tuple2!18090)

(assert (=> b!211413 (= lt!332720 (readBitPure!0 (_1!9702 lt!332717)))))

(assert (=> b!211413 (= (_2!9700 lt!332720) lt!332718)))

(declare-fun lt!332709 () Unit!15056)

(declare-fun Unit!15058 () Unit!15056)

(assert (=> b!211413 (= lt!332709 Unit!15058)))

(declare-fun lt!332747 () (_ BitVec 64))

(assert (=> b!211413 (= lt!332747 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!332759 () (_ BitVec 64))

(assert (=> b!211413 (= lt!332759 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!332737 () Unit!15056)

(assert (=> b!211413 (= lt!332737 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332744)) lt!332759))))

(assert (=> b!211413 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332744)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332759)))

(declare-fun lt!332729 () Unit!15056)

(assert (=> b!211413 (= lt!332729 lt!332737)))

(declare-fun lt!332708 () tuple2!18096)

(assert (=> b!211413 (= lt!332708 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332717) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332747))))

(declare-fun lt!332754 () (_ BitVec 64))

(assert (=> b!211413 (= lt!332754 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!332732 () Unit!15056)

(assert (=> b!211413 (= lt!332732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332755) (buf!5137 (_2!9701 lt!332744)) lt!332754))))

(assert (=> b!211413 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332744)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332755))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332755))) lt!332754)))

(declare-fun lt!332735 () Unit!15056)

(assert (=> b!211413 (= lt!332735 lt!332732)))

(declare-fun lt!332730 () tuple2!18096)

(assert (=> b!211413 (= lt!332730 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332746) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!332747 (ite (_2!9700 lt!332720) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!332723 () tuple2!18096)

(assert (=> b!211413 (= lt!332723 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332717) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332747))))

(declare-fun c!10401 () Bool)

(assert (=> b!211413 (= c!10401 (_2!9700 (readBitPure!0 (_1!9702 lt!332717))))))

(declare-fun lt!332716 () tuple2!18096)

(declare-fun e!144157 () (_ BitVec 64))

(assert (=> b!211413 (= lt!332716 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9702 lt!332717) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!332747 e!144157)))))

(declare-fun lt!332742 () Unit!15056)

(assert (=> b!211413 (= lt!332742 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9702 lt!332717) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332747))))

(assert (=> b!211413 (and (= (_2!9703 lt!332723) (_2!9703 lt!332716)) (= (_1!9703 lt!332723) (_1!9703 lt!332716)))))

(declare-fun lt!332741 () Unit!15056)

(assert (=> b!211413 (= lt!332741 lt!332742)))

(assert (=> b!211413 (= (_1!9702 lt!332717) (withMovedBitIndex!0 (_2!9702 lt!332717) (bvsub (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332744))) (currentByte!9691 (_2!9701 lt!332744)) (currentBit!9686 (_2!9701 lt!332744))))))))

(declare-fun lt!332725 () Unit!15056)

(declare-fun Unit!15059 () Unit!15056)

(assert (=> b!211413 (= lt!332725 Unit!15059)))

(assert (=> b!211413 (= (_1!9702 lt!332746) (withMovedBitIndex!0 (_2!9702 lt!332746) (bvsub (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332755))) (currentByte!9691 (_2!9701 lt!332755)) (currentBit!9686 (_2!9701 lt!332755))) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332744))) (currentByte!9691 (_2!9701 lt!332744)) (currentBit!9686 (_2!9701 lt!332744))))))))

(declare-fun lt!332739 () Unit!15056)

(declare-fun Unit!15060 () Unit!15056)

(assert (=> b!211413 (= lt!332739 Unit!15060)))

(assert (=> b!211413 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) (bvsub (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332755))) (currentByte!9691 (_2!9701 lt!332755)) (currentBit!9686 (_2!9701 lt!332755))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!332728 () Unit!15056)

(declare-fun Unit!15061 () Unit!15056)

(assert (=> b!211413 (= lt!332728 Unit!15061)))

(assert (=> b!211413 (= (_2!9703 lt!332708) (_2!9703 lt!332730))))

(declare-fun lt!332705 () Unit!15056)

(declare-fun Unit!15062 () Unit!15056)

(assert (=> b!211413 (= lt!332705 Unit!15062)))

(assert (=> b!211413 (invariant!0 (currentBit!9686 (_2!9701 lt!332744)) (currentByte!9691 (_2!9701 lt!332744)) (size!4614 (buf!5137 (_2!9701 lt!332744))))))

(declare-fun lt!332734 () Unit!15056)

(declare-fun Unit!15063 () Unit!15056)

(assert (=> b!211413 (= lt!332734 Unit!15063)))

(assert (=> b!211413 (= (size!4614 (buf!5137 (_2!9701 lt!332149))) (size!4614 (buf!5137 (_2!9701 lt!332744))))))

(declare-fun lt!332721 () Unit!15056)

(declare-fun Unit!15064 () Unit!15056)

(assert (=> b!211413 (= lt!332721 Unit!15064)))

(assert (=> b!211413 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332744))) (currentByte!9691 (_2!9701 lt!332744)) (currentBit!9686 (_2!9701 lt!332744))) (bvsub (bvadd (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!332748 () Unit!15056)

(declare-fun Unit!15065 () Unit!15056)

(assert (=> b!211413 (= lt!332748 Unit!15065)))

(declare-fun lt!332749 () Unit!15056)

(declare-fun Unit!15066 () Unit!15056)

(assert (=> b!211413 (= lt!332749 Unit!15066)))

(declare-fun lt!332713 () tuple2!18094)

(assert (=> b!211413 (= lt!332713 (reader!0 (_2!9701 lt!332149) (_2!9701 lt!332744)))))

(declare-fun lt!332706 () (_ BitVec 64))

(assert (=> b!211413 (= lt!332706 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!332731 () Unit!15056)

(assert (=> b!211413 (= lt!332731 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332744)) lt!332706))))

(assert (=> b!211413 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332744)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332706)))

(declare-fun lt!332740 () Unit!15056)

(assert (=> b!211413 (= lt!332740 lt!332731)))

(declare-fun lt!332726 () tuple2!18096)

(assert (=> b!211413 (= lt!332726 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332713) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177537 () Bool)

(assert (=> b!211413 (= res!177537 (= (_2!9703 lt!332726) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!144163 () Bool)

(assert (=> b!211413 (=> (not res!177537) (not e!144163))))

(assert (=> b!211413 e!144163))

(declare-fun lt!332707 () Unit!15056)

(declare-fun Unit!15067 () Unit!15056)

(assert (=> b!211413 (= lt!332707 Unit!15067)))

(declare-fun b!211414 () Bool)

(declare-fun res!177542 () Bool)

(assert (=> b!211414 (= res!177542 (= (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332736))) (currentByte!9691 (_2!9701 lt!332736)) (currentBit!9686 (_2!9701 lt!332736))) (bvadd (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!211414 (=> (not res!177542) (not e!144161))))

(declare-fun b!211415 () Bool)

(assert (=> b!211415 (= e!144160 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332752))) (currentByte!9691 (_1!9700 lt!332752)) (currentBit!9686 (_1!9700 lt!332752))) (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332736))) (currentByte!9691 (_2!9701 lt!332736)) (currentBit!9686 (_2!9701 lt!332736)))))))

(declare-fun d!71525 () Bool)

(assert (=> d!71525 e!144159))

(declare-fun res!177547 () Bool)

(assert (=> d!71525 (=> (not res!177547) (not e!144159))))

(assert (=> d!71525 (= res!177547 (invariant!0 (currentBit!9686 (_2!9701 lt!332711)) (currentByte!9691 (_2!9701 lt!332711)) (size!4614 (buf!5137 (_2!9701 lt!332711)))))))

(assert (=> d!71525 (= lt!332711 e!144156)))

(declare-fun c!10402 () Bool)

(assert (=> d!71525 (= c!10402 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71525 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71525 (= (appendBitsLSBFirstLoopTR!0 (_2!9701 lt!332149) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!332711)))

(declare-fun b!211416 () Bool)

(declare-fun e!144155 () Bool)

(declare-fun lt!332756 () tuple2!18096)

(declare-fun lt!332714 () tuple2!18094)

(assert (=> b!211416 (= e!144155 (= (_1!9703 lt!332756) (_2!9702 lt!332714)))))

(declare-fun b!211417 () Bool)

(declare-fun e!144162 () Bool)

(declare-fun lt!332733 () (_ BitVec 64))

(assert (=> b!211417 (= e!144162 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332149)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332733))))

(declare-fun b!211418 () Bool)

(assert (=> b!211418 (= e!144159 e!144155)))

(declare-fun res!177545 () Bool)

(assert (=> b!211418 (=> (not res!177545) (not e!144155))))

(assert (=> b!211418 (= res!177545 (= (_2!9703 lt!332756) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!211418 (= lt!332756 (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332714) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!332758 () Unit!15056)

(declare-fun lt!332751 () Unit!15056)

(assert (=> b!211418 (= lt!332758 lt!332751)))

(assert (=> b!211418 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332711)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332733)))

(assert (=> b!211418 (= lt!332751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332711)) lt!332733))))

(assert (=> b!211418 e!144162))

(declare-fun res!177543 () Bool)

(assert (=> b!211418 (=> (not res!177543) (not e!144162))))

(assert (=> b!211418 (= res!177543 (and (= (size!4614 (buf!5137 (_2!9701 lt!332149))) (size!4614 (buf!5137 (_2!9701 lt!332711)))) (bvsge lt!332733 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211418 (= lt!332733 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!211418 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!211418 (= lt!332714 (reader!0 (_2!9701 lt!332149) (_2!9701 lt!332711)))))

(declare-fun b!211419 () Bool)

(assert (=> b!211419 (= e!144157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!3324 () Bool)

(assert (=> bm!3324 (= call!3327 (isPrefixOf!0 (_2!9701 lt!332149) (ite c!10402 (_2!9701 lt!332149) (_2!9701 lt!332736))))))

(declare-fun b!211420 () Bool)

(assert (=> b!211420 (= e!144157 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!211421 () Bool)

(assert (=> b!211421 (= e!144163 (= (_1!9703 lt!332726) (_2!9702 lt!332713)))))

(declare-fun b!211422 () Bool)

(declare-fun Unit!15068 () Unit!15056)

(assert (=> b!211422 (= e!144156 (tuple2!18093 Unit!15068 (_2!9701 lt!332149)))))

(declare-fun lt!332727 () Unit!15056)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8336) Unit!15056)

(assert (=> b!211422 (= lt!332727 (lemmaIsPrefixRefl!0 (_2!9701 lt!332149)))))

(assert (=> b!211422 call!3327))

(declare-fun lt!332722 () Unit!15056)

(assert (=> b!211422 (= lt!332722 lt!332727)))

(assert (= (and d!71525 c!10402) b!211422))

(assert (= (and d!71525 (not c!10402)) b!211413))

(assert (= (and b!211413 res!177548) b!211414))

(assert (= (and b!211414 res!177542) b!211412))

(assert (= (and b!211412 res!177539) b!211408))

(assert (= (and b!211408 res!177544) b!211415))

(assert (= (and b!211413 res!177541) b!211411))

(assert (= (and b!211413 c!10401) b!211420))

(assert (= (and b!211413 (not c!10401)) b!211419))

(assert (= (and b!211413 res!177537) b!211421))

(assert (= (or b!211422 b!211412) bm!3324))

(assert (= (and d!71525 res!177547) b!211410))

(assert (= (and b!211410 res!177540) b!211407))

(assert (= (and b!211407 res!177538) b!211409))

(assert (= (and b!211409 res!177546) b!211418))

(assert (= (and b!211418 res!177543) b!211417))

(assert (= (and b!211418 res!177545) b!211416))

(declare-fun m!325741 () Bool)

(assert (=> b!211417 m!325741))

(declare-fun m!325743 () Bool)

(assert (=> b!211408 m!325743))

(assert (=> b!211408 m!325743))

(declare-fun m!325745 () Bool)

(assert (=> b!211408 m!325745))

(declare-fun m!325747 () Bool)

(assert (=> bm!3324 m!325747))

(declare-fun m!325749 () Bool)

(assert (=> b!211409 m!325749))

(declare-fun m!325751 () Bool)

(assert (=> b!211407 m!325751))

(assert (=> b!211407 m!325381))

(declare-fun m!325753 () Bool)

(assert (=> d!71525 m!325753))

(declare-fun m!325755 () Bool)

(assert (=> b!211418 m!325755))

(declare-fun m!325757 () Bool)

(assert (=> b!211418 m!325757))

(declare-fun m!325759 () Bool)

(assert (=> b!211418 m!325759))

(declare-fun m!325761 () Bool)

(assert (=> b!211418 m!325761))

(declare-fun m!325763 () Bool)

(assert (=> b!211418 m!325763))

(declare-fun m!325765 () Bool)

(assert (=> b!211418 m!325765))

(declare-fun m!325767 () Bool)

(assert (=> b!211415 m!325767))

(declare-fun m!325769 () Bool)

(assert (=> b!211415 m!325769))

(assert (=> b!211414 m!325769))

(assert (=> b!211414 m!325381))

(declare-fun m!325771 () Bool)

(assert (=> b!211422 m!325771))

(declare-fun m!325773 () Bool)

(assert (=> b!211413 m!325773))

(declare-fun m!325775 () Bool)

(assert (=> b!211413 m!325775))

(declare-fun m!325777 () Bool)

(assert (=> b!211413 m!325777))

(declare-fun m!325779 () Bool)

(assert (=> b!211413 m!325779))

(declare-fun m!325781 () Bool)

(assert (=> b!211413 m!325781))

(declare-fun m!325783 () Bool)

(assert (=> b!211413 m!325783))

(declare-fun m!325785 () Bool)

(assert (=> b!211413 m!325785))

(declare-fun m!325787 () Bool)

(assert (=> b!211413 m!325787))

(declare-fun m!325789 () Bool)

(assert (=> b!211413 m!325789))

(declare-fun m!325791 () Bool)

(assert (=> b!211413 m!325791))

(declare-fun m!325793 () Bool)

(assert (=> b!211413 m!325793))

(declare-fun m!325795 () Bool)

(assert (=> b!211413 m!325795))

(declare-fun m!325797 () Bool)

(assert (=> b!211413 m!325797))

(declare-fun m!325799 () Bool)

(assert (=> b!211413 m!325799))

(assert (=> b!211413 m!325381))

(declare-fun m!325801 () Bool)

(assert (=> b!211413 m!325801))

(declare-fun m!325803 () Bool)

(assert (=> b!211413 m!325803))

(declare-fun m!325805 () Bool)

(assert (=> b!211413 m!325805))

(declare-fun m!325807 () Bool)

(assert (=> b!211413 m!325807))

(declare-fun m!325809 () Bool)

(assert (=> b!211413 m!325809))

(declare-fun m!325811 () Bool)

(assert (=> b!211413 m!325811))

(declare-fun m!325813 () Bool)

(assert (=> b!211413 m!325813))

(declare-fun m!325815 () Bool)

(assert (=> b!211413 m!325815))

(declare-fun m!325817 () Bool)

(assert (=> b!211413 m!325817))

(assert (=> b!211413 m!325777))

(declare-fun m!325819 () Bool)

(assert (=> b!211413 m!325819))

(declare-fun m!325821 () Bool)

(assert (=> b!211413 m!325821))

(declare-fun m!325823 () Bool)

(assert (=> b!211413 m!325823))

(declare-fun m!325825 () Bool)

(assert (=> b!211413 m!325825))

(declare-fun m!325827 () Bool)

(assert (=> b!211413 m!325827))

(declare-fun m!325829 () Bool)

(assert (=> b!211413 m!325829))

(declare-fun m!325831 () Bool)

(assert (=> b!211413 m!325831))

(declare-fun m!325833 () Bool)

(assert (=> b!211413 m!325833))

(assert (=> b!211413 m!325763))

(assert (=> b!211413 m!325765))

(assert (=> b!211198 d!71525))

(declare-fun d!71645 () Bool)

(declare-datatypes ((tuple2!18100 0))(
  ( (tuple2!18101 (_1!9705 Bool) (_2!9705 BitStream!8336)) )
))
(declare-fun lt!332762 () tuple2!18100)

(declare-fun readBit!0 (BitStream!8336) tuple2!18100)

(assert (=> d!71645 (= lt!332762 (readBit!0 (_1!9702 lt!332173)))))

(assert (=> d!71645 (= (readBitPure!0 (_1!9702 lt!332173)) (tuple2!18091 (_2!9705 lt!332762) (_1!9705 lt!332762)))))

(declare-fun bs!17582 () Bool)

(assert (= bs!17582 d!71645))

(declare-fun m!325835 () Bool)

(assert (=> bs!17582 m!325835))

(assert (=> b!211209 d!71645))

(declare-fun d!71647 () Bool)

(assert (=> d!71647 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211209 d!71647))

(declare-fun d!71649 () Bool)

(assert (=> d!71649 (= (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332149)))) (and (bvsge (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9686 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9691 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332149)))) (and (= (currentBit!9686 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332149))))))))))

(assert (=> b!211209 d!71649))

(declare-fun d!71651 () Bool)

(declare-fun lt!332763 () tuple2!18098)

(assert (=> d!71651 (= lt!332763 (readNBitsLSBFirstsLoop!0 (_1!9702 lt!332157) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150))))

(assert (=> d!71651 (= (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332157) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!332150) (tuple2!18097 (_2!9704 lt!332763) (_1!9704 lt!332763)))))

(declare-fun bs!17583 () Bool)

(assert (= bs!17583 d!71651))

(declare-fun m!325837 () Bool)

(assert (=> bs!17583 m!325837))

(assert (=> b!211209 d!71651))

(declare-fun d!71653 () Bool)

(declare-fun e!144166 () Bool)

(assert (=> d!71653 e!144166))

(declare-fun res!177551 () Bool)

(assert (=> d!71653 (=> (not res!177551) (not e!144166))))

(declare-fun lt!332774 () tuple2!18090)

(declare-fun lt!332775 () tuple2!18090)

(assert (=> d!71653 (= res!177551 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332774))) (currentByte!9691 (_1!9700 lt!332774)) (currentBit!9686 (_1!9700 lt!332774))) (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332775))) (currentByte!9691 (_1!9700 lt!332775)) (currentBit!9686 (_1!9700 lt!332775)))))))

(declare-fun lt!332772 () Unit!15056)

(declare-fun lt!332773 () BitStream!8336)

(declare-fun choose!50 (BitStream!8336 BitStream!8336 BitStream!8336 tuple2!18090 tuple2!18090 BitStream!8336 Bool tuple2!18090 tuple2!18090 BitStream!8336 Bool) Unit!15056)

(assert (=> d!71653 (= lt!332772 (choose!50 lt!332167 (_2!9701 lt!332168) lt!332773 lt!332774 (tuple2!18091 (_1!9700 lt!332774) (_2!9700 lt!332774)) (_1!9700 lt!332774) (_2!9700 lt!332774) lt!332775 (tuple2!18091 (_1!9700 lt!332775) (_2!9700 lt!332775)) (_1!9700 lt!332775) (_2!9700 lt!332775)))))

(assert (=> d!71653 (= lt!332775 (readBitPure!0 lt!332773))))

(assert (=> d!71653 (= lt!332774 (readBitPure!0 lt!332167))))

(assert (=> d!71653 (= lt!332773 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 lt!332167) (currentBit!9686 lt!332167)))))

(assert (=> d!71653 (invariant!0 (currentBit!9686 lt!332167) (currentByte!9691 lt!332167) (size!4614 (buf!5137 (_2!9701 lt!332168))))))

(assert (=> d!71653 (= (readBitPrefixLemma!0 lt!332167 (_2!9701 lt!332168)) lt!332772)))

(declare-fun b!211425 () Bool)

(assert (=> b!211425 (= e!144166 (= (_2!9700 lt!332774) (_2!9700 lt!332775)))))

(assert (= (and d!71653 res!177551) b!211425))

(declare-fun m!325839 () Bool)

(assert (=> d!71653 m!325839))

(declare-fun m!325841 () Bool)

(assert (=> d!71653 m!325841))

(declare-fun m!325843 () Bool)

(assert (=> d!71653 m!325843))

(assert (=> d!71653 m!325359))

(declare-fun m!325845 () Bool)

(assert (=> d!71653 m!325845))

(declare-fun m!325847 () Bool)

(assert (=> d!71653 m!325847))

(assert (=> b!211209 d!71653))

(declare-fun d!71655 () Bool)

(declare-fun lt!332776 () tuple2!18100)

(assert (=> d!71655 (= lt!332776 (readBit!0 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))))))

(assert (=> d!71655 (= (readBitPure!0 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))) (tuple2!18091 (_2!9705 lt!332776) (_1!9705 lt!332776)))))

(declare-fun bs!17584 () Bool)

(assert (= bs!17584 d!71655))

(declare-fun m!325849 () Bool)

(assert (=> bs!17584 m!325849))

(assert (=> b!211209 d!71655))

(declare-fun d!71657 () Bool)

(declare-fun lt!332777 () tuple2!18098)

(assert (=> d!71657 (= lt!332777 (readNBitsLSBFirstsLoop!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161))))

(assert (=> d!71657 (= (readNBitsLSBFirstsLoopPure!0 (_1!9702 lt!332173) nBits!348 i!590 lt!332161) (tuple2!18097 (_2!9704 lt!332777) (_1!9704 lt!332777)))))

(declare-fun bs!17585 () Bool)

(assert (= bs!17585 d!71657))

(declare-fun m!325851 () Bool)

(assert (=> bs!17585 m!325851))

(assert (=> b!211209 d!71657))

(declare-fun b!211436 () Bool)

(declare-fun res!177558 () Bool)

(declare-fun e!144171 () Bool)

(assert (=> b!211436 (=> (not res!177558) (not e!144171))))

(declare-fun lt!332832 () tuple2!18094)

(assert (=> b!211436 (= res!177558 (isPrefixOf!0 (_2!9702 lt!332832) (_2!9701 lt!332168)))))

(declare-fun d!71659 () Bool)

(assert (=> d!71659 e!144171))

(declare-fun res!177560 () Bool)

(assert (=> d!71659 (=> (not res!177560) (not e!144171))))

(assert (=> d!71659 (= res!177560 (isPrefixOf!0 (_1!9702 lt!332832) (_2!9702 lt!332832)))))

(declare-fun lt!332834 () BitStream!8336)

(assert (=> d!71659 (= lt!332832 (tuple2!18095 lt!332834 (_2!9701 lt!332168)))))

(declare-fun lt!332819 () Unit!15056)

(declare-fun lt!332820 () Unit!15056)

(assert (=> d!71659 (= lt!332819 lt!332820)))

(assert (=> d!71659 (isPrefixOf!0 lt!332834 (_2!9701 lt!332168))))

(assert (=> d!71659 (= lt!332820 (lemmaIsPrefixTransitive!0 lt!332834 (_2!9701 lt!332168) (_2!9701 lt!332168)))))

(declare-fun lt!332835 () Unit!15056)

(declare-fun lt!332830 () Unit!15056)

(assert (=> d!71659 (= lt!332835 lt!332830)))

(assert (=> d!71659 (isPrefixOf!0 lt!332834 (_2!9701 lt!332168))))

(assert (=> d!71659 (= lt!332830 (lemmaIsPrefixTransitive!0 lt!332834 thiss!1204 (_2!9701 lt!332168)))))

(declare-fun lt!332829 () Unit!15056)

(declare-fun e!144172 () Unit!15056)

(assert (=> d!71659 (= lt!332829 e!144172)))

(declare-fun c!10405 () Bool)

(assert (=> d!71659 (= c!10405 (not (= (size!4614 (buf!5137 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!332827 () Unit!15056)

(declare-fun lt!332836 () Unit!15056)

(assert (=> d!71659 (= lt!332827 lt!332836)))

(assert (=> d!71659 (isPrefixOf!0 (_2!9701 lt!332168) (_2!9701 lt!332168))))

(assert (=> d!71659 (= lt!332836 (lemmaIsPrefixRefl!0 (_2!9701 lt!332168)))))

(declare-fun lt!332828 () Unit!15056)

(declare-fun lt!332823 () Unit!15056)

(assert (=> d!71659 (= lt!332828 lt!332823)))

(assert (=> d!71659 (= lt!332823 (lemmaIsPrefixRefl!0 (_2!9701 lt!332168)))))

(declare-fun lt!332818 () Unit!15056)

(declare-fun lt!332837 () Unit!15056)

(assert (=> d!71659 (= lt!332818 lt!332837)))

(assert (=> d!71659 (isPrefixOf!0 lt!332834 lt!332834)))

(assert (=> d!71659 (= lt!332837 (lemmaIsPrefixRefl!0 lt!332834))))

(declare-fun lt!332824 () Unit!15056)

(declare-fun lt!332826 () Unit!15056)

(assert (=> d!71659 (= lt!332824 lt!332826)))

(assert (=> d!71659 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71659 (= lt!332826 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71659 (= lt!332834 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(assert (=> d!71659 (isPrefixOf!0 thiss!1204 (_2!9701 lt!332168))))

(assert (=> d!71659 (= (reader!0 thiss!1204 (_2!9701 lt!332168)) lt!332832)))

(declare-fun lt!332825 () (_ BitVec 64))

(declare-fun b!211437 () Bool)

(declare-fun lt!332833 () (_ BitVec 64))

(assert (=> b!211437 (= e!144171 (= (_1!9702 lt!332832) (withMovedBitIndex!0 (_2!9702 lt!332832) (bvsub lt!332825 lt!332833))))))

(assert (=> b!211437 (or (= (bvand lt!332825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332825 lt!332833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211437 (= lt!332833 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168))))))

(assert (=> b!211437 (= lt!332825 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun b!211438 () Bool)

(declare-fun lt!332821 () Unit!15056)

(assert (=> b!211438 (= e!144172 lt!332821)))

(declare-fun lt!332822 () (_ BitVec 64))

(assert (=> b!211438 (= lt!332822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332831 () (_ BitVec 64))

(assert (=> b!211438 (= lt!332831 (bitIndex!0 (size!4614 (buf!5137 thiss!1204)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10503 array!10503 (_ BitVec 64) (_ BitVec 64)) Unit!15056)

(assert (=> b!211438 (= lt!332821 (arrayBitRangesEqSymmetric!0 (buf!5137 thiss!1204) (buf!5137 (_2!9701 lt!332168)) lt!332822 lt!332831))))

(assert (=> b!211438 (arrayBitRangesEq!0 (buf!5137 (_2!9701 lt!332168)) (buf!5137 thiss!1204) lt!332822 lt!332831)))

(declare-fun b!211439 () Bool)

(declare-fun res!177559 () Bool)

(assert (=> b!211439 (=> (not res!177559) (not e!144171))))

(assert (=> b!211439 (= res!177559 (isPrefixOf!0 (_1!9702 lt!332832) thiss!1204))))

(declare-fun b!211440 () Bool)

(declare-fun Unit!15069 () Unit!15056)

(assert (=> b!211440 (= e!144172 Unit!15069)))

(assert (= (and d!71659 c!10405) b!211438))

(assert (= (and d!71659 (not c!10405)) b!211440))

(assert (= (and d!71659 res!177560) b!211439))

(assert (= (and b!211439 res!177559) b!211436))

(assert (= (and b!211436 res!177558) b!211437))

(declare-fun m!325853 () Bool)

(assert (=> d!71659 m!325853))

(declare-fun m!325855 () Bool)

(assert (=> d!71659 m!325855))

(assert (=> d!71659 m!325419))

(declare-fun m!325857 () Bool)

(assert (=> d!71659 m!325857))

(declare-fun m!325859 () Bool)

(assert (=> d!71659 m!325859))

(declare-fun m!325861 () Bool)

(assert (=> d!71659 m!325861))

(declare-fun m!325863 () Bool)

(assert (=> d!71659 m!325863))

(declare-fun m!325865 () Bool)

(assert (=> d!71659 m!325865))

(declare-fun m!325867 () Bool)

(assert (=> d!71659 m!325867))

(declare-fun m!325869 () Bool)

(assert (=> d!71659 m!325869))

(declare-fun m!325871 () Bool)

(assert (=> d!71659 m!325871))

(assert (=> b!211438 m!325383))

(declare-fun m!325873 () Bool)

(assert (=> b!211438 m!325873))

(declare-fun m!325875 () Bool)

(assert (=> b!211438 m!325875))

(declare-fun m!325877 () Bool)

(assert (=> b!211436 m!325877))

(declare-fun m!325879 () Bool)

(assert (=> b!211437 m!325879))

(assert (=> b!211437 m!325417))

(assert (=> b!211437 m!325383))

(declare-fun m!325881 () Bool)

(assert (=> b!211439 m!325881))

(assert (=> b!211209 d!71659))

(declare-fun d!71661 () Bool)

(declare-fun e!144173 () Bool)

(assert (=> d!71661 e!144173))

(declare-fun res!177561 () Bool)

(assert (=> d!71661 (=> (not res!177561) (not e!144173))))

(declare-fun lt!332843 () (_ BitVec 64))

(declare-fun lt!332838 () (_ BitVec 64))

(declare-fun lt!332840 () (_ BitVec 64))

(assert (=> d!71661 (= res!177561 (= lt!332838 (bvsub lt!332843 lt!332840)))))

(assert (=> d!71661 (or (= (bvand lt!332843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332843 lt!332840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71661 (= lt!332840 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332154)))) ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332154))) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332154)))))))

(declare-fun lt!332842 () (_ BitVec 64))

(declare-fun lt!332839 () (_ BitVec 64))

(assert (=> d!71661 (= lt!332843 (bvmul lt!332842 lt!332839))))

(assert (=> d!71661 (or (= lt!332842 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332839 (bvsdiv (bvmul lt!332842 lt!332839) lt!332842)))))

(assert (=> d!71661 (= lt!332839 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71661 (= lt!332842 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332154)))))))

(assert (=> d!71661 (= lt!332838 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332154))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332154)))))))

(assert (=> d!71661 (invariant!0 (currentBit!9686 (_1!9700 lt!332154)) (currentByte!9691 (_1!9700 lt!332154)) (size!4614 (buf!5137 (_1!9700 lt!332154))))))

(assert (=> d!71661 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332154))) (currentByte!9691 (_1!9700 lt!332154)) (currentBit!9686 (_1!9700 lt!332154))) lt!332838)))

(declare-fun b!211441 () Bool)

(declare-fun res!177562 () Bool)

(assert (=> b!211441 (=> (not res!177562) (not e!144173))))

(assert (=> b!211441 (= res!177562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332838))))

(declare-fun b!211442 () Bool)

(declare-fun lt!332841 () (_ BitVec 64))

(assert (=> b!211442 (= e!144173 (bvsle lt!332838 (bvmul lt!332841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211442 (or (= lt!332841 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332841 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332841)))))

(assert (=> b!211442 (= lt!332841 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332154)))))))

(assert (= (and d!71661 res!177561) b!211441))

(assert (= (and b!211441 res!177562) b!211442))

(declare-fun m!325883 () Bool)

(assert (=> d!71661 m!325883))

(declare-fun m!325885 () Bool)

(assert (=> d!71661 m!325885))

(assert (=> b!211209 d!71661))

(declare-fun d!71663 () Bool)

(declare-fun e!144174 () Bool)

(assert (=> d!71663 e!144174))

(declare-fun res!177563 () Bool)

(assert (=> d!71663 (=> (not res!177563) (not e!144174))))

(declare-fun lt!332846 () (_ BitVec 64))

(declare-fun lt!332849 () (_ BitVec 64))

(declare-fun lt!332844 () (_ BitVec 64))

(assert (=> d!71663 (= res!177563 (= lt!332844 (bvsub lt!332849 lt!332846)))))

(assert (=> d!71663 (or (= (bvand lt!332849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332849 lt!332846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71663 (= lt!332846 (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332163)))) ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332163))) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332163)))))))

(declare-fun lt!332848 () (_ BitVec 64))

(declare-fun lt!332845 () (_ BitVec 64))

(assert (=> d!71663 (= lt!332849 (bvmul lt!332848 lt!332845))))

(assert (=> d!71663 (or (= lt!332848 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!332845 (bvsdiv (bvmul lt!332848 lt!332845) lt!332848)))))

(assert (=> d!71663 (= lt!332845 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71663 (= lt!332848 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332163)))))))

(assert (=> d!71663 (= lt!332844 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9691 (_1!9700 lt!332163))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9686 (_1!9700 lt!332163)))))))

(assert (=> d!71663 (invariant!0 (currentBit!9686 (_1!9700 lt!332163)) (currentByte!9691 (_1!9700 lt!332163)) (size!4614 (buf!5137 (_1!9700 lt!332163))))))

(assert (=> d!71663 (= (bitIndex!0 (size!4614 (buf!5137 (_1!9700 lt!332163))) (currentByte!9691 (_1!9700 lt!332163)) (currentBit!9686 (_1!9700 lt!332163))) lt!332844)))

(declare-fun b!211443 () Bool)

(declare-fun res!177564 () Bool)

(assert (=> b!211443 (=> (not res!177564) (not e!144174))))

(assert (=> b!211443 (= res!177564 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!332844))))

(declare-fun b!211444 () Bool)

(declare-fun lt!332847 () (_ BitVec 64))

(assert (=> b!211444 (= e!144174 (bvsle lt!332844 (bvmul lt!332847 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211444 (or (= lt!332847 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!332847 #b0000000000000000000000000000000000000000000000000000000000001000) lt!332847)))))

(assert (=> b!211444 (= lt!332847 ((_ sign_extend 32) (size!4614 (buf!5137 (_1!9700 lt!332163)))))))

(assert (= (and d!71663 res!177563) b!211443))

(assert (= (and b!211443 res!177564) b!211444))

(declare-fun m!325887 () Bool)

(assert (=> d!71663 m!325887))

(declare-fun m!325889 () Bool)

(assert (=> d!71663 m!325889))

(assert (=> b!211209 d!71663))

(declare-fun d!71665 () Bool)

(assert (=> d!71665 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332169)))

(declare-fun lt!332852 () Unit!15056)

(declare-fun choose!9 (BitStream!8336 array!10503 (_ BitVec 64) BitStream!8336) Unit!15056)

(assert (=> d!71665 (= lt!332852 (choose!9 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332168)) lt!332169 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149)))))))

(assert (=> d!71665 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9701 lt!332149) (buf!5137 (_2!9701 lt!332168)) lt!332169) lt!332852)))

(declare-fun bs!17586 () Bool)

(assert (= bs!17586 d!71665))

(assert (=> bs!17586 m!325355))

(declare-fun m!325891 () Bool)

(assert (=> bs!17586 m!325891))

(assert (=> b!211209 d!71665))

(declare-fun b!211445 () Bool)

(declare-fun res!177565 () Bool)

(declare-fun e!144175 () Bool)

(assert (=> b!211445 (=> (not res!177565) (not e!144175))))

(declare-fun lt!332867 () tuple2!18094)

(assert (=> b!211445 (= res!177565 (isPrefixOf!0 (_2!9702 lt!332867) (_2!9701 lt!332168)))))

(declare-fun d!71667 () Bool)

(assert (=> d!71667 e!144175))

(declare-fun res!177567 () Bool)

(assert (=> d!71667 (=> (not res!177567) (not e!144175))))

(assert (=> d!71667 (= res!177567 (isPrefixOf!0 (_1!9702 lt!332867) (_2!9702 lt!332867)))))

(declare-fun lt!332869 () BitStream!8336)

(assert (=> d!71667 (= lt!332867 (tuple2!18095 lt!332869 (_2!9701 lt!332168)))))

(declare-fun lt!332854 () Unit!15056)

(declare-fun lt!332855 () Unit!15056)

(assert (=> d!71667 (= lt!332854 lt!332855)))

(assert (=> d!71667 (isPrefixOf!0 lt!332869 (_2!9701 lt!332168))))

(assert (=> d!71667 (= lt!332855 (lemmaIsPrefixTransitive!0 lt!332869 (_2!9701 lt!332168) (_2!9701 lt!332168)))))

(declare-fun lt!332870 () Unit!15056)

(declare-fun lt!332865 () Unit!15056)

(assert (=> d!71667 (= lt!332870 lt!332865)))

(assert (=> d!71667 (isPrefixOf!0 lt!332869 (_2!9701 lt!332168))))

(assert (=> d!71667 (= lt!332865 (lemmaIsPrefixTransitive!0 lt!332869 (_2!9701 lt!332149) (_2!9701 lt!332168)))))

(declare-fun lt!332864 () Unit!15056)

(declare-fun e!144176 () Unit!15056)

(assert (=> d!71667 (= lt!332864 e!144176)))

(declare-fun c!10406 () Bool)

(assert (=> d!71667 (= c!10406 (not (= (size!4614 (buf!5137 (_2!9701 lt!332149))) #b00000000000000000000000000000000)))))

(declare-fun lt!332862 () Unit!15056)

(declare-fun lt!332871 () Unit!15056)

(assert (=> d!71667 (= lt!332862 lt!332871)))

(assert (=> d!71667 (isPrefixOf!0 (_2!9701 lt!332168) (_2!9701 lt!332168))))

(assert (=> d!71667 (= lt!332871 (lemmaIsPrefixRefl!0 (_2!9701 lt!332168)))))

(declare-fun lt!332863 () Unit!15056)

(declare-fun lt!332858 () Unit!15056)

(assert (=> d!71667 (= lt!332863 lt!332858)))

(assert (=> d!71667 (= lt!332858 (lemmaIsPrefixRefl!0 (_2!9701 lt!332168)))))

(declare-fun lt!332853 () Unit!15056)

(declare-fun lt!332872 () Unit!15056)

(assert (=> d!71667 (= lt!332853 lt!332872)))

(assert (=> d!71667 (isPrefixOf!0 lt!332869 lt!332869)))

(assert (=> d!71667 (= lt!332872 (lemmaIsPrefixRefl!0 lt!332869))))

(declare-fun lt!332859 () Unit!15056)

(declare-fun lt!332861 () Unit!15056)

(assert (=> d!71667 (= lt!332859 lt!332861)))

(assert (=> d!71667 (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332149))))

(assert (=> d!71667 (= lt!332861 (lemmaIsPrefixRefl!0 (_2!9701 lt!332149)))))

(assert (=> d!71667 (= lt!332869 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(assert (=> d!71667 (isPrefixOf!0 (_2!9701 lt!332149) (_2!9701 lt!332168))))

(assert (=> d!71667 (= (reader!0 (_2!9701 lt!332149) (_2!9701 lt!332168)) lt!332867)))

(declare-fun lt!332868 () (_ BitVec 64))

(declare-fun b!211446 () Bool)

(declare-fun lt!332860 () (_ BitVec 64))

(assert (=> b!211446 (= e!144175 (= (_1!9702 lt!332867) (withMovedBitIndex!0 (_2!9702 lt!332867) (bvsub lt!332860 lt!332868))))))

(assert (=> b!211446 (or (= (bvand lt!332860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!332868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!332860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!332860 lt!332868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211446 (= lt!332868 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332168))) (currentByte!9691 (_2!9701 lt!332168)) (currentBit!9686 (_2!9701 lt!332168))))))

(assert (=> b!211446 (= lt!332860 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(declare-fun b!211447 () Bool)

(declare-fun lt!332856 () Unit!15056)

(assert (=> b!211447 (= e!144176 lt!332856)))

(declare-fun lt!332857 () (_ BitVec 64))

(assert (=> b!211447 (= lt!332857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332866 () (_ BitVec 64))

(assert (=> b!211447 (= lt!332866 (bitIndex!0 (size!4614 (buf!5137 (_2!9701 lt!332149))) (currentByte!9691 (_2!9701 lt!332149)) (currentBit!9686 (_2!9701 lt!332149))))))

(assert (=> b!211447 (= lt!332856 (arrayBitRangesEqSymmetric!0 (buf!5137 (_2!9701 lt!332149)) (buf!5137 (_2!9701 lt!332168)) lt!332857 lt!332866))))

(assert (=> b!211447 (arrayBitRangesEq!0 (buf!5137 (_2!9701 lt!332168)) (buf!5137 (_2!9701 lt!332149)) lt!332857 lt!332866)))

(declare-fun b!211448 () Bool)

(declare-fun res!177566 () Bool)

(assert (=> b!211448 (=> (not res!177566) (not e!144175))))

(assert (=> b!211448 (= res!177566 (isPrefixOf!0 (_1!9702 lt!332867) (_2!9701 lt!332149)))))

(declare-fun b!211449 () Bool)

(declare-fun Unit!15070 () Unit!15056)

(assert (=> b!211449 (= e!144176 Unit!15070)))

(assert (= (and d!71667 c!10406) b!211447))

(assert (= (and d!71667 (not c!10406)) b!211449))

(assert (= (and d!71667 res!177567) b!211448))

(assert (= (and b!211448 res!177566) b!211445))

(assert (= (and b!211445 res!177565) b!211446))

(declare-fun m!325893 () Bool)

(assert (=> d!71667 m!325893))

(declare-fun m!325895 () Bool)

(assert (=> d!71667 m!325895))

(assert (=> d!71667 m!325347))

(assert (=> d!71667 m!325771))

(declare-fun m!325897 () Bool)

(assert (=> d!71667 m!325897))

(assert (=> d!71667 m!325861))

(declare-fun m!325899 () Bool)

(assert (=> d!71667 m!325899))

(declare-fun m!325901 () Bool)

(assert (=> d!71667 m!325901))

(declare-fun m!325903 () Bool)

(assert (=> d!71667 m!325903))

(declare-fun m!325905 () Bool)

(assert (=> d!71667 m!325905))

(assert (=> d!71667 m!325871))

(assert (=> b!211447 m!325381))

(declare-fun m!325907 () Bool)

(assert (=> b!211447 m!325907))

(declare-fun m!325909 () Bool)

(assert (=> b!211447 m!325909))

(declare-fun m!325911 () Bool)

(assert (=> b!211445 m!325911))

(declare-fun m!325913 () Bool)

(assert (=> b!211446 m!325913))

(assert (=> b!211446 m!325417))

(assert (=> b!211446 m!325381))

(declare-fun m!325915 () Bool)

(assert (=> b!211448 m!325915))

(assert (=> b!211209 d!71667))

(declare-fun d!71669 () Bool)

(assert (=> d!71669 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)) lt!332155) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204))) lt!332155))))

(declare-fun bs!17587 () Bool)

(assert (= bs!17587 d!71669))

(declare-fun m!325917 () Bool)

(assert (=> bs!17587 m!325917))

(assert (=> b!211209 d!71669))

(declare-fun d!71671 () Bool)

(assert (=> d!71671 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149))) lt!332169) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 (_2!9701 lt!332149))) ((_ sign_extend 32) (currentBit!9686 (_2!9701 lt!332149)))) lt!332169))))

(declare-fun bs!17588 () Bool)

(assert (= bs!17588 d!71671))

(declare-fun m!325919 () Bool)

(assert (=> bs!17588 m!325919))

(assert (=> b!211209 d!71671))

(declare-fun d!71673 () Bool)

(assert (=> d!71673 (validate_offset_bits!1 ((_ sign_extend 32) (size!4614 (buf!5137 (_2!9701 lt!332168)))) ((_ sign_extend 32) (currentByte!9691 thiss!1204)) ((_ sign_extend 32) (currentBit!9686 thiss!1204)) lt!332155)))

(declare-fun lt!332873 () Unit!15056)

(assert (=> d!71673 (= lt!332873 (choose!9 thiss!1204 (buf!5137 (_2!9701 lt!332168)) lt!332155 (BitStream!8337 (buf!5137 (_2!9701 lt!332168)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204))))))

(assert (=> d!71673 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5137 (_2!9701 lt!332168)) lt!332155) lt!332873)))

(declare-fun bs!17589 () Bool)

(assert (= bs!17589 d!71673))

(assert (=> bs!17589 m!325373))

(declare-fun m!325921 () Bool)

(assert (=> bs!17589 m!325921))

(assert (=> b!211209 d!71673))

(declare-fun d!71675 () Bool)

(declare-fun lt!332874 () tuple2!18100)

(assert (=> d!71675 (= lt!332874 (readBit!0 lt!332167))))

(assert (=> d!71675 (= (readBitPure!0 lt!332167) (tuple2!18091 (_2!9705 lt!332874) (_1!9705 lt!332874)))))

(declare-fun bs!17590 () Bool)

(assert (= bs!17590 d!71675))

(declare-fun m!325923 () Bool)

(assert (=> bs!17590 m!325923))

(assert (=> b!211209 d!71675))

(declare-fun d!71677 () Bool)

(declare-fun lt!332875 () tuple2!18100)

(assert (=> d!71677 (= lt!332875 (readBit!0 (readerFrom!0 (_2!9701 lt!332149) (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204))))))

(assert (=> d!71677 (= (readBitPure!0 (readerFrom!0 (_2!9701 lt!332149) (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204))) (tuple2!18091 (_2!9705 lt!332875) (_1!9705 lt!332875)))))

(declare-fun bs!17591 () Bool)

(assert (= bs!17591 d!71677))

(assert (=> bs!17591 m!325387))

(declare-fun m!325925 () Bool)

(assert (=> bs!17591 m!325925))

(assert (=> b!211207 d!71677))

(declare-fun d!71679 () Bool)

(declare-fun e!144179 () Bool)

(assert (=> d!71679 e!144179))

(declare-fun res!177571 () Bool)

(assert (=> d!71679 (=> (not res!177571) (not e!144179))))

(assert (=> d!71679 (= res!177571 (invariant!0 (currentBit!9686 (_2!9701 lt!332149)) (currentByte!9691 (_2!9701 lt!332149)) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (=> d!71679 (= (readerFrom!0 (_2!9701 lt!332149) (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204)) (BitStream!8337 (buf!5137 (_2!9701 lt!332149)) (currentByte!9691 thiss!1204) (currentBit!9686 thiss!1204)))))

(declare-fun b!211452 () Bool)

(assert (=> b!211452 (= e!144179 (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 (_2!9701 lt!332149)))))))

(assert (= (and d!71679 res!177571) b!211452))

(assert (=> d!71679 m!325463))

(assert (=> b!211452 m!325379))

(assert (=> b!211207 d!71679))

(declare-fun d!71681 () Bool)

(assert (=> d!71681 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9686 thiss!1204) (currentByte!9691 thiss!1204) (size!4614 (buf!5137 thiss!1204))))))

(declare-fun bs!17592 () Bool)

(assert (= bs!17592 d!71681))

(assert (=> bs!17592 m!325415))

(assert (=> start!44320 d!71681))

(assert (=> b!211206 d!71503))

(push 1)

(assert (not d!71661))

(assert (not b!211252))

(assert (not b!211417))

(assert (not b!211251))

(assert (not d!71653))

(assert (not b!211452))

(assert (not d!71677))

(assert (not b!211407))

(assert (not d!71487))

(assert (not d!71659))

(assert (not b!211249))

(assert (not bm!3324))

(assert (not b!211436))

(assert (not d!71671))

(assert (not b!211255))

(assert (not d!71651))

(assert (not b!211422))

(assert (not b!211439))

(assert (not b!211233))

(assert (not d!71665))

(assert (not b!211445))

(assert (not d!71675))

(assert (not b!211260))

(assert (not b!211437))

(assert (not d!71669))

(assert (not d!71513))

(assert (not d!71499))

(assert (not b!211250))

(assert (not b!211448))

(assert (not d!71525))

(assert (not d!71681))

(assert (not d!71501))

(assert (not b!211446))

(assert (not b!211438))

(assert (not d!71511))

(assert (not d!71655))

(assert (not d!71519))

(assert (not b!211253))

(assert (not b!211447))

(assert (not d!71523))

(assert (not d!71657))

(assert (not d!71679))

(assert (not d!71493))

(assert (not b!211415))

(assert (not b!211413))

(assert (not d!71515))

(assert (not d!71667))

(assert (not b!211258))

(assert (not d!71495))

(assert (not d!71509))

(assert (not d!71645))

(assert (not b!211235))

(assert (not d!71663))

(assert (not b!211409))

(assert (not b!211418))

(assert (not d!71497))

(assert (not b!211414))

(assert (not d!71673))

(assert (not b!211408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

