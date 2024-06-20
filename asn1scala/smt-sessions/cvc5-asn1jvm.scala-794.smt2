; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22982 () Bool)

(assert start!22982)

(declare-fun b!116414 () Bool)

(declare-fun e!76299 () Bool)

(declare-datatypes ((array!5246 0))(
  ( (array!5247 (arr!2973 (Array (_ BitVec 32) (_ BitVec 8))) (size!2380 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4234 0))(
  ( (BitStream!4235 (buf!2790 array!5246) (currentByte!5427 (_ BitVec 32)) (currentBit!5422 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9640 0))(
  ( (tuple2!9641 (_1!5085 BitStream!4234) (_2!5085 Bool)) )
))
(declare-fun lt!177916 () tuple2!9640)

(declare-fun lt!177921 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116414 (= e!76299 (= (bitIndex!0 (size!2380 (buf!2790 (_1!5085 lt!177916))) (currentByte!5427 (_1!5085 lt!177916)) (currentBit!5422 (_1!5085 lt!177916))) lt!177921))))

(declare-fun b!116415 () Bool)

(declare-fun e!76301 () Bool)

(declare-fun e!76303 () Bool)

(assert (=> b!116415 (= e!76301 e!76303)))

(declare-fun res!96256 () Bool)

(assert (=> b!116415 (=> (not res!96256) (not e!76303))))

(declare-fun thiss!1305 () BitStream!4234)

(declare-fun lt!177920 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116415 (= res!96256 (validate_offset_bits!1 ((_ sign_extend 32) (size!2380 (buf!2790 thiss!1305))) ((_ sign_extend 32) (currentByte!5427 thiss!1305)) ((_ sign_extend 32) (currentBit!5422 thiss!1305)) lt!177920))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116415 (= lt!177920 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116416 () Bool)

(declare-fun lt!177911 () tuple2!9640)

(declare-fun lt!177918 () (_ BitVec 64))

(assert (=> b!116416 (= e!76303 (not (or (not (_2!5085 lt!177911)) (and (bvsge lt!177918 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!177918 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9642 0))(
  ( (tuple2!9643 (_1!5086 BitStream!4234) (_2!5086 BitStream!4234)) )
))
(declare-fun lt!177904 () tuple2!9642)

(declare-datatypes ((tuple2!9644 0))(
  ( (tuple2!9645 (_1!5087 BitStream!4234) (_2!5087 (_ BitVec 64))) )
))
(declare-fun lt!177914 () tuple2!9644)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9644)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116416 (= lt!177914 (readNLeastSignificantBitsLoopPure!0 (_1!5086 lt!177904) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-datatypes ((Unit!7165 0))(
  ( (Unit!7166) )
))
(declare-datatypes ((tuple2!9646 0))(
  ( (tuple2!9647 (_1!5088 Unit!7165) (_2!5088 BitStream!4234)) )
))
(declare-fun lt!177906 () tuple2!9646)

(assert (=> b!116416 (validate_offset_bits!1 ((_ sign_extend 32) (size!2380 (buf!2790 (_2!5088 lt!177906)))) ((_ sign_extend 32) (currentByte!5427 thiss!1305)) ((_ sign_extend 32) (currentBit!5422 thiss!1305)) lt!177920)))

(declare-fun lt!177909 () Unit!7165)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4234 array!5246 (_ BitVec 64)) Unit!7165)

(assert (=> b!116416 (= lt!177909 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2790 (_2!5088 lt!177906)) lt!177920))))

(declare-fun lt!177908 () Bool)

(assert (=> b!116416 (= (_2!5085 lt!177911) lt!177908)))

(declare-fun readBitPure!0 (BitStream!4234) tuple2!9640)

(assert (=> b!116416 (= lt!177911 (readBitPure!0 (_1!5086 lt!177904)))))

(declare-fun lt!177907 () tuple2!9642)

(declare-fun lt!177917 () tuple2!9646)

(declare-fun reader!0 (BitStream!4234 BitStream!4234) tuple2!9642)

(assert (=> b!116416 (= lt!177907 (reader!0 (_2!5088 lt!177917) (_2!5088 lt!177906)))))

(assert (=> b!116416 (= lt!177904 (reader!0 thiss!1305 (_2!5088 lt!177906)))))

(declare-fun e!76298 () Bool)

(assert (=> b!116416 e!76298))

(declare-fun res!96257 () Bool)

(assert (=> b!116416 (=> (not res!96257) (not e!76298))))

(declare-fun lt!177910 () tuple2!9640)

(declare-fun lt!177913 () tuple2!9640)

(assert (=> b!116416 (= res!96257 (= (bitIndex!0 (size!2380 (buf!2790 (_1!5085 lt!177910))) (currentByte!5427 (_1!5085 lt!177910)) (currentBit!5422 (_1!5085 lt!177910))) (bitIndex!0 (size!2380 (buf!2790 (_1!5085 lt!177913))) (currentByte!5427 (_1!5085 lt!177913)) (currentBit!5422 (_1!5085 lt!177913)))))))

(declare-fun lt!177905 () Unit!7165)

(declare-fun lt!177912 () BitStream!4234)

(declare-fun readBitPrefixLemma!0 (BitStream!4234 BitStream!4234) Unit!7165)

(assert (=> b!116416 (= lt!177905 (readBitPrefixLemma!0 lt!177912 (_2!5088 lt!177906)))))

(assert (=> b!116416 (= lt!177913 (readBitPure!0 (BitStream!4235 (buf!2790 (_2!5088 lt!177906)) (currentByte!5427 thiss!1305) (currentBit!5422 thiss!1305))))))

(assert (=> b!116416 (= lt!177910 (readBitPure!0 lt!177912))))

(assert (=> b!116416 (= lt!177912 (BitStream!4235 (buf!2790 (_2!5088 lt!177917)) (currentByte!5427 thiss!1305) (currentBit!5422 thiss!1305)))))

(declare-fun e!76297 () Bool)

(assert (=> b!116416 e!76297))

(declare-fun res!96250 () Bool)

(assert (=> b!116416 (=> (not res!96250) (not e!76297))))

(declare-fun isPrefixOf!0 (BitStream!4234 BitStream!4234) Bool)

(assert (=> b!116416 (= res!96250 (isPrefixOf!0 thiss!1305 (_2!5088 lt!177906)))))

(declare-fun lt!177919 () Unit!7165)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4234 BitStream!4234 BitStream!4234) Unit!7165)

(assert (=> b!116416 (= lt!177919 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5088 lt!177917) (_2!5088 lt!177906)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4234 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9646)

(assert (=> b!116416 (= lt!177906 (appendNLeastSignificantBitsLoop!0 (_2!5088 lt!177917) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76302 () Bool)

(assert (=> b!116416 e!76302))

(declare-fun res!96254 () Bool)

(assert (=> b!116416 (=> (not res!96254) (not e!76302))))

(assert (=> b!116416 (= res!96254 (= (size!2380 (buf!2790 thiss!1305)) (size!2380 (buf!2790 (_2!5088 lt!177917)))))))

(declare-fun appendBit!0 (BitStream!4234 Bool) tuple2!9646)

(assert (=> b!116416 (= lt!177917 (appendBit!0 thiss!1305 lt!177908))))

(assert (=> b!116416 (= lt!177908 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 lt!177918)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116416 (= lt!177918 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))))

(declare-fun b!116417 () Bool)

(declare-fun e!76305 () Bool)

(assert (=> b!116417 (= e!76302 e!76305)))

(declare-fun res!96255 () Bool)

(assert (=> b!116417 (=> (not res!96255) (not e!76305))))

(declare-fun lt!177915 () (_ BitVec 64))

(assert (=> b!116417 (= res!96255 (= lt!177921 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177915)))))

(assert (=> b!116417 (= lt!177921 (bitIndex!0 (size!2380 (buf!2790 (_2!5088 lt!177917))) (currentByte!5427 (_2!5088 lt!177917)) (currentBit!5422 (_2!5088 lt!177917))))))

(assert (=> b!116417 (= lt!177915 (bitIndex!0 (size!2380 (buf!2790 thiss!1305)) (currentByte!5427 thiss!1305) (currentBit!5422 thiss!1305)))))

(declare-fun b!116418 () Bool)

(declare-fun res!96248 () Bool)

(assert (=> b!116418 (=> (not res!96248) (not e!76303))))

(assert (=> b!116418 (= res!96248 (bvslt i!615 nBits!396))))

(declare-fun b!116419 () Bool)

(declare-fun res!96253 () Bool)

(assert (=> b!116419 (=> (not res!96253) (not e!76305))))

(assert (=> b!116419 (= res!96253 (isPrefixOf!0 thiss!1305 (_2!5088 lt!177917)))))

(declare-fun b!116420 () Bool)

(assert (=> b!116420 (= e!76305 e!76299)))

(declare-fun res!96249 () Bool)

(assert (=> b!116420 (=> (not res!96249) (not e!76299))))

(assert (=> b!116420 (= res!96249 (and (= (_2!5085 lt!177916) lt!177908) (= (_1!5085 lt!177916) (_2!5088 lt!177917))))))

(declare-fun readerFrom!0 (BitStream!4234 (_ BitVec 32) (_ BitVec 32)) BitStream!4234)

(assert (=> b!116420 (= lt!177916 (readBitPure!0 (readerFrom!0 (_2!5088 lt!177917) (currentBit!5422 thiss!1305) (currentByte!5427 thiss!1305))))))

(declare-fun b!116421 () Bool)

(declare-fun res!96258 () Bool)

(assert (=> b!116421 (=> (not res!96258) (not e!76303))))

(assert (=> b!116421 (= res!96258 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!96251 () Bool)

(assert (=> start!22982 (=> (not res!96251) (not e!76301))))

(assert (=> start!22982 (= res!96251 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22982 e!76301))

(assert (=> start!22982 true))

(declare-fun e!76304 () Bool)

(declare-fun inv!12 (BitStream!4234) Bool)

(assert (=> start!22982 (and (inv!12 thiss!1305) e!76304)))

(declare-fun b!116422 () Bool)

(declare-fun res!96252 () Bool)

(assert (=> b!116422 (=> (not res!96252) (not e!76297))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116422 (= res!96252 (invariant!0 (currentBit!5422 thiss!1305) (currentByte!5427 thiss!1305) (size!2380 (buf!2790 (_2!5088 lt!177917)))))))

(declare-fun b!116423 () Bool)

(assert (=> b!116423 (= e!76298 (= (_2!5085 lt!177910) (_2!5085 lt!177913)))))

(declare-fun b!116424 () Bool)

(declare-fun array_inv!2182 (array!5246) Bool)

(assert (=> b!116424 (= e!76304 (array_inv!2182 (buf!2790 thiss!1305)))))

(declare-fun b!116425 () Bool)

(assert (=> b!116425 (= e!76297 (invariant!0 (currentBit!5422 thiss!1305) (currentByte!5427 thiss!1305) (size!2380 (buf!2790 (_2!5088 lt!177906)))))))

(assert (= (and start!22982 res!96251) b!116415))

(assert (= (and b!116415 res!96256) b!116421))

(assert (= (and b!116421 res!96258) b!116418))

(assert (= (and b!116418 res!96248) b!116416))

(assert (= (and b!116416 res!96254) b!116417))

(assert (= (and b!116417 res!96255) b!116419))

(assert (= (and b!116419 res!96253) b!116420))

(assert (= (and b!116420 res!96249) b!116414))

(assert (= (and b!116416 res!96250) b!116422))

(assert (= (and b!116422 res!96252) b!116425))

(assert (= (and b!116416 res!96257) b!116423))

(assert (= start!22982 b!116424))

(declare-fun m!174323 () Bool)

(assert (=> b!116417 m!174323))

(declare-fun m!174325 () Bool)

(assert (=> b!116417 m!174325))

(declare-fun m!174327 () Bool)

(assert (=> b!116419 m!174327))

(declare-fun m!174329 () Bool)

(assert (=> b!116414 m!174329))

(declare-fun m!174331 () Bool)

(assert (=> b!116422 m!174331))

(declare-fun m!174333 () Bool)

(assert (=> b!116421 m!174333))

(declare-fun m!174335 () Bool)

(assert (=> b!116420 m!174335))

(assert (=> b!116420 m!174335))

(declare-fun m!174337 () Bool)

(assert (=> b!116420 m!174337))

(declare-fun m!174339 () Bool)

(assert (=> start!22982 m!174339))

(declare-fun m!174341 () Bool)

(assert (=> b!116415 m!174341))

(declare-fun m!174343 () Bool)

(assert (=> b!116425 m!174343))

(declare-fun m!174345 () Bool)

(assert (=> b!116424 m!174345))

(declare-fun m!174347 () Bool)

(assert (=> b!116416 m!174347))

(declare-fun m!174349 () Bool)

(assert (=> b!116416 m!174349))

(declare-fun m!174351 () Bool)

(assert (=> b!116416 m!174351))

(declare-fun m!174353 () Bool)

(assert (=> b!116416 m!174353))

(declare-fun m!174355 () Bool)

(assert (=> b!116416 m!174355))

(declare-fun m!174357 () Bool)

(assert (=> b!116416 m!174357))

(declare-fun m!174359 () Bool)

(assert (=> b!116416 m!174359))

(declare-fun m!174361 () Bool)

(assert (=> b!116416 m!174361))

(declare-fun m!174363 () Bool)

(assert (=> b!116416 m!174363))

(declare-fun m!174365 () Bool)

(assert (=> b!116416 m!174365))

(declare-fun m!174367 () Bool)

(assert (=> b!116416 m!174367))

(declare-fun m!174369 () Bool)

(assert (=> b!116416 m!174369))

(declare-fun m!174371 () Bool)

(assert (=> b!116416 m!174371))

(declare-fun m!174373 () Bool)

(assert (=> b!116416 m!174373))

(declare-fun m!174375 () Bool)

(assert (=> b!116416 m!174375))

(declare-fun m!174377 () Bool)

(assert (=> b!116416 m!174377))

(push 1)

(assert (not b!116422))

(assert (not start!22982))

(assert (not b!116424))

(assert (not b!116414))

(assert (not b!116425))

(assert (not b!116415))

(assert (not b!116416))

(assert (not b!116419))

(assert (not b!116421))

(assert (not b!116417))

(assert (not b!116420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

