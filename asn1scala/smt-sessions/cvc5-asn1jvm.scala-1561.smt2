; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43758 () Bool)

(assert start!43758)

(declare-fun b!208245 () Bool)

(declare-fun e!142293 () Bool)

(declare-datatypes ((array!10448 0))(
  ( (array!10449 (arr!5524 (Array (_ BitVec 32) (_ BitVec 8))) (size!4594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8296 0))(
  ( (BitStream!8297 (buf!5102 array!10448) (currentByte!9626 (_ BitVec 32)) (currentBit!9621 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8296)

(declare-datatypes ((Unit!14821 0))(
  ( (Unit!14822) )
))
(declare-datatypes ((tuple2!17870 0))(
  ( (tuple2!17871 (_1!9590 Unit!14821) (_2!9590 BitStream!8296)) )
))
(declare-fun lt!325315 () tuple2!17870)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208245 (= e!142293 (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325315)))))))

(declare-fun b!208246 () Bool)

(declare-fun res!174765 () Bool)

(declare-fun e!142295 () Bool)

(assert (=> b!208246 (=> res!174765 e!142295)))

(declare-fun lt!325310 () tuple2!17870)

(declare-fun isPrefixOf!0 (BitStream!8296 BitStream!8296) Bool)

(assert (=> b!208246 (= res!174765 (not (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!325315))))))

(declare-fun b!208247 () Bool)

(declare-fun res!174770 () Bool)

(assert (=> b!208247 (=> res!174770 e!142295)))

(assert (=> b!208247 (= res!174770 (not (invariant!0 (currentBit!9621 (_2!9590 lt!325315)) (currentByte!9626 (_2!9590 lt!325315)) (size!4594 (buf!5102 (_2!9590 lt!325315))))))))

(declare-fun b!208248 () Bool)

(declare-fun res!174769 () Bool)

(declare-fun e!142294 () Bool)

(assert (=> b!208248 (=> (not res!174769) (not e!142294))))

(assert (=> b!208248 (= res!174769 (isPrefixOf!0 thiss!1204 (_2!9590 lt!325310)))))

(declare-fun b!208249 () Bool)

(declare-fun e!142287 () Bool)

(declare-datatypes ((tuple2!17872 0))(
  ( (tuple2!17873 (_1!9591 BitStream!8296) (_2!9591 Bool)) )
))
(declare-fun lt!325314 () tuple2!17872)

(declare-fun lt!325302 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208249 (= e!142287 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325314))) (currentByte!9626 (_1!9591 lt!325314)) (currentBit!9621 (_1!9591 lt!325314))) lt!325302))))

(declare-fun b!208250 () Bool)

(declare-fun e!142288 () Bool)

(declare-fun array_inv!4335 (array!10448) Bool)

(assert (=> b!208250 (= e!142288 (array_inv!4335 (buf!5102 thiss!1204)))))

(declare-fun b!208251 () Bool)

(declare-fun res!174767 () Bool)

(declare-fun e!142290 () Bool)

(assert (=> b!208251 (=> (not res!174767) (not e!142290))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!208251 (= res!174767 (not (= i!590 nBits!348)))))

(declare-fun b!208253 () Bool)

(declare-fun res!174772 () Bool)

(declare-fun e!142291 () Bool)

(assert (=> b!208253 (=> res!174772 e!142291)))

(assert (=> b!208253 (= res!174772 (bvsge i!590 nBits!348))))

(declare-fun b!208254 () Bool)

(declare-datatypes ((tuple2!17874 0))(
  ( (tuple2!17875 (_1!9592 BitStream!8296) (_2!9592 BitStream!8296)) )
))
(declare-fun lt!325293 () tuple2!17874)

(declare-fun lt!325294 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208254 (= e!142291 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9592 lt!325293)))) ((_ sign_extend 32) (currentByte!9626 (_1!9592 lt!325293))) ((_ sign_extend 32) (currentBit!9621 (_1!9592 lt!325293))) lt!325294))))

(declare-fun b!208255 () Bool)

(declare-fun e!142292 () Bool)

(assert (=> b!208255 (= e!142292 e!142290)))

(declare-fun res!174759 () Bool)

(assert (=> b!208255 (=> (not res!174759) (not e!142290))))

(assert (=> b!208255 (= res!174759 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)) lt!325294))))

(assert (=> b!208255 (= lt!325294 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208256 () Bool)

(declare-fun e!142285 () Bool)

(assert (=> b!208256 (= e!142285 e!142295)))

(declare-fun res!174775 () Bool)

(assert (=> b!208256 (=> res!174775 e!142295)))

(declare-fun lt!325312 () (_ BitVec 64))

(declare-fun lt!325306 () (_ BitVec 64))

(assert (=> b!208256 (= res!174775 (not (= lt!325306 (bvsub (bvsub (bvadd lt!325312 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!208256 (= lt!325306 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315))))))

(assert (=> b!208256 (isPrefixOf!0 thiss!1204 (_2!9590 lt!325315))))

(declare-fun lt!325311 () Unit!14821)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8296 BitStream!8296 BitStream!8296) Unit!14821)

(assert (=> b!208256 (= lt!325311 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9590 lt!325310) (_2!9590 lt!325315)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8296 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17870)

(assert (=> b!208256 (= lt!325315 (appendBitsLSBFirstLoopTR!0 (_2!9590 lt!325310) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208257 () Bool)

(declare-fun res!174766 () Bool)

(assert (=> b!208257 (=> res!174766 e!142295)))

(declare-fun lt!325300 () (_ BitVec 64))

(assert (=> b!208257 (= res!174766 (or (not (= (size!4594 (buf!5102 (_2!9590 lt!325315))) (size!4594 (buf!5102 thiss!1204)))) (not (= lt!325306 (bvsub (bvadd lt!325300 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208258 () Bool)

(declare-fun res!174761 () Bool)

(assert (=> b!208258 (=> res!174761 e!142295)))

(assert (=> b!208258 (= res!174761 (not (isPrefixOf!0 thiss!1204 (_2!9590 lt!325310))))))

(declare-fun b!208259 () Bool)

(assert (=> b!208259 (= e!142290 (not e!142285))))

(declare-fun res!174776 () Bool)

(assert (=> b!208259 (=> res!174776 e!142285)))

(assert (=> b!208259 (= res!174776 (not (= lt!325312 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325300))))))

(assert (=> b!208259 (= lt!325312 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(assert (=> b!208259 (= lt!325300 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun e!142289 () Bool)

(assert (=> b!208259 e!142289))

(declare-fun res!174774 () Bool)

(assert (=> b!208259 (=> (not res!174774) (not e!142289))))

(assert (=> b!208259 (= res!174774 (= (size!4594 (buf!5102 thiss!1204)) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(declare-fun lt!325303 () Bool)

(declare-fun appendBit!0 (BitStream!8296 Bool) tuple2!17870)

(assert (=> b!208259 (= lt!325310 (appendBit!0 thiss!1204 lt!325303))))

(declare-fun lt!325313 () (_ BitVec 64))

(assert (=> b!208259 (= lt!325303 (not (= (bvand v!189 lt!325313) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208259 (= lt!325313 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208260 () Bool)

(assert (=> b!208260 (= e!142294 e!142287)))

(declare-fun res!174764 () Bool)

(assert (=> b!208260 (=> (not res!174764) (not e!142287))))

(assert (=> b!208260 (= res!174764 (and (= (_2!9591 lt!325314) lt!325303) (= (_1!9591 lt!325314) (_2!9590 lt!325310))))))

(declare-fun readBitPure!0 (BitStream!8296) tuple2!17872)

(declare-fun readerFrom!0 (BitStream!8296 (_ BitVec 32) (_ BitVec 32)) BitStream!8296)

(assert (=> b!208260 (= lt!325314 (readBitPure!0 (readerFrom!0 (_2!9590 lt!325310) (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204))))))

(declare-fun b!208261 () Bool)

(assert (=> b!208261 (= e!142289 e!142294)))

(declare-fun res!174760 () Bool)

(assert (=> b!208261 (=> (not res!174760) (not e!142294))))

(declare-fun lt!325309 () (_ BitVec 64))

(assert (=> b!208261 (= res!174760 (= lt!325302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325309)))))

(assert (=> b!208261 (= lt!325302 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(assert (=> b!208261 (= lt!325309 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun res!174768 () Bool)

(assert (=> start!43758 (=> (not res!174768) (not e!142292))))

(assert (=> start!43758 (= res!174768 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43758 e!142292))

(assert (=> start!43758 true))

(declare-fun inv!12 (BitStream!8296) Bool)

(assert (=> start!43758 (and (inv!12 thiss!1204) e!142288)))

(declare-fun b!208252 () Bool)

(assert (=> b!208252 (= e!142295 e!142291)))

(declare-fun res!174773 () Bool)

(assert (=> b!208252 (=> res!174773 e!142291)))

(declare-fun lt!325304 () tuple2!17872)

(declare-fun lt!325298 () tuple2!17874)

(declare-fun lt!325299 () (_ BitVec 64))

(declare-datatypes ((tuple2!17876 0))(
  ( (tuple2!17877 (_1!9593 BitStream!8296) (_2!9593 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17876)

(assert (=> b!208252 (= res!174773 (not (= (_1!9593 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!325298) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325299 (ite (_2!9591 lt!325304) lt!325313 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9592 lt!325298))))))

(declare-fun lt!325296 () (_ BitVec 64))

(assert (=> b!208252 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!325296)))

(declare-fun lt!325307 () Unit!14821)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8296 array!10448 (_ BitVec 64)) Unit!14821)

(assert (=> b!208252 (= lt!325307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!325315)) lt!325296))))

(assert (=> b!208252 (= lt!325296 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325316 () tuple2!17876)

(assert (=> b!208252 (= lt!325316 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!325293) nBits!348 i!590 lt!325299))))

(assert (=> b!208252 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)) lt!325294)))

(declare-fun lt!325301 () Unit!14821)

(assert (=> b!208252 (= lt!325301 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5102 (_2!9590 lt!325315)) lt!325294))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208252 (= lt!325299 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208252 (= (_2!9591 lt!325304) lt!325303)))

(assert (=> b!208252 (= lt!325304 (readBitPure!0 (_1!9592 lt!325293)))))

(declare-fun reader!0 (BitStream!8296 BitStream!8296) tuple2!17874)

(assert (=> b!208252 (= lt!325298 (reader!0 (_2!9590 lt!325310) (_2!9590 lt!325315)))))

(assert (=> b!208252 (= lt!325293 (reader!0 thiss!1204 (_2!9590 lt!325315)))))

(declare-fun e!142286 () Bool)

(assert (=> b!208252 e!142286))

(declare-fun res!174771 () Bool)

(assert (=> b!208252 (=> (not res!174771) (not e!142286))))

(declare-fun lt!325295 () tuple2!17872)

(declare-fun lt!325305 () tuple2!17872)

(assert (=> b!208252 (= res!174771 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325295))) (currentByte!9626 (_1!9591 lt!325295)) (currentBit!9621 (_1!9591 lt!325295))) (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325305))) (currentByte!9626 (_1!9591 lt!325305)) (currentBit!9621 (_1!9591 lt!325305)))))))

(declare-fun lt!325308 () Unit!14821)

(declare-fun lt!325297 () BitStream!8296)

(declare-fun readBitPrefixLemma!0 (BitStream!8296 BitStream!8296) Unit!14821)

(assert (=> b!208252 (= lt!325308 (readBitPrefixLemma!0 lt!325297 (_2!9590 lt!325315)))))

(assert (=> b!208252 (= lt!325305 (readBitPure!0 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))))))

(assert (=> b!208252 (= lt!325295 (readBitPure!0 lt!325297))))

(assert (=> b!208252 e!142293))

(declare-fun res!174763 () Bool)

(assert (=> b!208252 (=> (not res!174763) (not e!142293))))

(assert (=> b!208252 (= res!174763 (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (=> b!208252 (= lt!325297 (BitStream!8297 (buf!5102 (_2!9590 lt!325310)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun b!208262 () Bool)

(assert (=> b!208262 (= e!142286 (= (_2!9591 lt!325295) (_2!9591 lt!325305)))))

(declare-fun b!208263 () Bool)

(declare-fun res!174762 () Bool)

(assert (=> b!208263 (=> (not res!174762) (not e!142290))))

(assert (=> b!208263 (= res!174762 (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204))))))

(assert (= (and start!43758 res!174768) b!208255))

(assert (= (and b!208255 res!174759) b!208263))

(assert (= (and b!208263 res!174762) b!208251))

(assert (= (and b!208251 res!174767) b!208259))

(assert (= (and b!208259 res!174774) b!208261))

(assert (= (and b!208261 res!174760) b!208248))

(assert (= (and b!208248 res!174769) b!208260))

(assert (= (and b!208260 res!174764) b!208249))

(assert (= (and b!208259 (not res!174776)) b!208256))

(assert (= (and b!208256 (not res!174775)) b!208247))

(assert (= (and b!208247 (not res!174770)) b!208257))

(assert (= (and b!208257 (not res!174766)) b!208246))

(assert (= (and b!208246 (not res!174765)) b!208258))

(assert (= (and b!208258 (not res!174761)) b!208252))

(assert (= (and b!208252 res!174763) b!208245))

(assert (= (and b!208252 res!174771) b!208262))

(assert (= (and b!208252 (not res!174773)) b!208253))

(assert (= (and b!208253 (not res!174772)) b!208254))

(assert (= start!43758 b!208250))

(declare-fun m!320385 () Bool)

(assert (=> b!208255 m!320385))

(declare-fun m!320387 () Bool)

(assert (=> b!208246 m!320387))

(declare-fun m!320389 () Bool)

(assert (=> b!208263 m!320389))

(declare-fun m!320391 () Bool)

(assert (=> b!208259 m!320391))

(declare-fun m!320393 () Bool)

(assert (=> b!208259 m!320393))

(declare-fun m!320395 () Bool)

(assert (=> b!208259 m!320395))

(declare-fun m!320397 () Bool)

(assert (=> b!208260 m!320397))

(assert (=> b!208260 m!320397))

(declare-fun m!320399 () Bool)

(assert (=> b!208260 m!320399))

(declare-fun m!320401 () Bool)

(assert (=> b!208247 m!320401))

(declare-fun m!320403 () Bool)

(assert (=> start!43758 m!320403))

(declare-fun m!320405 () Bool)

(assert (=> b!208248 m!320405))

(declare-fun m!320407 () Bool)

(assert (=> b!208252 m!320407))

(declare-fun m!320409 () Bool)

(assert (=> b!208252 m!320409))

(declare-fun m!320411 () Bool)

(assert (=> b!208252 m!320411))

(declare-fun m!320413 () Bool)

(assert (=> b!208252 m!320413))

(declare-fun m!320415 () Bool)

(assert (=> b!208252 m!320415))

(declare-fun m!320417 () Bool)

(assert (=> b!208252 m!320417))

(declare-fun m!320419 () Bool)

(assert (=> b!208252 m!320419))

(declare-fun m!320421 () Bool)

(assert (=> b!208252 m!320421))

(declare-fun m!320423 () Bool)

(assert (=> b!208252 m!320423))

(declare-fun m!320425 () Bool)

(assert (=> b!208252 m!320425))

(declare-fun m!320427 () Bool)

(assert (=> b!208252 m!320427))

(declare-fun m!320429 () Bool)

(assert (=> b!208252 m!320429))

(declare-fun m!320431 () Bool)

(assert (=> b!208252 m!320431))

(declare-fun m!320433 () Bool)

(assert (=> b!208252 m!320433))

(declare-fun m!320435 () Bool)

(assert (=> b!208252 m!320435))

(declare-fun m!320437 () Bool)

(assert (=> b!208252 m!320437))

(declare-fun m!320439 () Bool)

(assert (=> b!208245 m!320439))

(assert (=> b!208261 m!320391))

(assert (=> b!208261 m!320393))

(declare-fun m!320441 () Bool)

(assert (=> b!208254 m!320441))

(declare-fun m!320443 () Bool)

(assert (=> b!208250 m!320443))

(declare-fun m!320445 () Bool)

(assert (=> b!208256 m!320445))

(declare-fun m!320447 () Bool)

(assert (=> b!208256 m!320447))

(declare-fun m!320449 () Bool)

(assert (=> b!208256 m!320449))

(declare-fun m!320451 () Bool)

(assert (=> b!208256 m!320451))

(declare-fun m!320453 () Bool)

(assert (=> b!208249 m!320453))

(assert (=> b!208258 m!320405))

(push 1)

(assert (not b!208259))

(assert (not b!208245))

(assert (not b!208256))

(assert (not b!208252))

(assert (not b!208258))

(assert (not b!208255))

(assert (not b!208263))

(assert (not b!208260))

(assert (not b!208247))

(assert (not b!208248))

(assert (not start!43758))

(assert (not b!208261))

(assert (not b!208249))

(assert (not b!208250))

(assert (not b!208254))

(assert (not b!208246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70433 () Bool)

(assert (=> d!70433 (= (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204))) (and (bvsge (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9621 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9626 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204))) (and (= (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204)))))))))

(assert (=> b!208263 d!70433))

(declare-fun d!70435 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70435 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9592 lt!325293)))) ((_ sign_extend 32) (currentByte!9626 (_1!9592 lt!325293))) ((_ sign_extend 32) (currentBit!9621 (_1!9592 lt!325293))) lt!325294) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9592 lt!325293)))) ((_ sign_extend 32) (currentByte!9626 (_1!9592 lt!325293))) ((_ sign_extend 32) (currentBit!9621 (_1!9592 lt!325293)))) lt!325294))))

(declare-fun bs!17315 () Bool)

(assert (= bs!17315 d!70435))

(declare-fun m!320727 () Bool)

(assert (=> bs!17315 m!320727))

(assert (=> b!208254 d!70435))

(declare-fun d!70437 () Bool)

(declare-fun e!142415 () Bool)

(assert (=> d!70437 e!142415))

(declare-fun res!174962 () Bool)

(assert (=> d!70437 (=> (not res!174962) (not e!142415))))

(declare-fun lt!325667 () (_ BitVec 64))

(declare-fun lt!325666 () (_ BitVec 64))

(declare-fun lt!325665 () (_ BitVec 64))

(assert (=> d!70437 (= res!174962 (= lt!325665 (bvsub lt!325666 lt!325667)))))

(assert (=> d!70437 (or (= (bvand lt!325666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!325667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!325666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!325666 lt!325667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70437 (= lt!325667 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325315))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325315)))))))

(declare-fun lt!325663 () (_ BitVec 64))

(declare-fun lt!325664 () (_ BitVec 64))

(assert (=> d!70437 (= lt!325666 (bvmul lt!325663 lt!325664))))

(assert (=> d!70437 (or (= lt!325663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!325664 (bvsdiv (bvmul lt!325663 lt!325664) lt!325663)))))

(assert (=> d!70437 (= lt!325664 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70437 (= lt!325663 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))))))

(assert (=> d!70437 (= lt!325665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325315))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325315)))))))

(assert (=> d!70437 (invariant!0 (currentBit!9621 (_2!9590 lt!325315)) (currentByte!9626 (_2!9590 lt!325315)) (size!4594 (buf!5102 (_2!9590 lt!325315))))))

(assert (=> d!70437 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315))) lt!325665)))

(declare-fun b!208464 () Bool)

(declare-fun res!174963 () Bool)

(assert (=> b!208464 (=> (not res!174963) (not e!142415))))

(assert (=> b!208464 (= res!174963 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!325665))))

(declare-fun b!208465 () Bool)

(declare-fun lt!325662 () (_ BitVec 64))

(assert (=> b!208465 (= e!142415 (bvsle lt!325665 (bvmul lt!325662 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208465 (or (= lt!325662 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325662 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325662)))))

(assert (=> b!208465 (= lt!325662 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))))))

(assert (= (and d!70437 res!174962) b!208464))

(assert (= (and b!208464 res!174963) b!208465))

(declare-fun m!320729 () Bool)

(assert (=> d!70437 m!320729))

(assert (=> d!70437 m!320401))

(assert (=> b!208256 d!70437))

(declare-fun d!70439 () Bool)

(declare-fun res!174970 () Bool)

(declare-fun e!142420 () Bool)

(assert (=> d!70439 (=> (not res!174970) (not e!142420))))

(assert (=> d!70439 (= res!174970 (= (size!4594 (buf!5102 thiss!1204)) (size!4594 (buf!5102 (_2!9590 lt!325315)))))))

(assert (=> d!70439 (= (isPrefixOf!0 thiss!1204 (_2!9590 lt!325315)) e!142420)))

(declare-fun b!208472 () Bool)

(declare-fun res!174971 () Bool)

(assert (=> b!208472 (=> (not res!174971) (not e!142420))))

(assert (=> b!208472 (= res!174971 (bvsle (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315)))))))

(declare-fun b!208473 () Bool)

(declare-fun e!142421 () Bool)

(assert (=> b!208473 (= e!142420 e!142421)))

(declare-fun res!174972 () Bool)

(assert (=> b!208473 (=> res!174972 e!142421)))

(assert (=> b!208473 (= res!174972 (= (size!4594 (buf!5102 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208474 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10448 array!10448 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208474 (= e!142421 (arrayBitRangesEq!0 (buf!5102 thiss!1204) (buf!5102 (_2!9590 lt!325315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))))))

(assert (= (and d!70439 res!174970) b!208472))

(assert (= (and b!208472 res!174971) b!208473))

(assert (= (and b!208473 (not res!174972)) b!208474))

(assert (=> b!208472 m!320393))

(assert (=> b!208472 m!320445))

(assert (=> b!208474 m!320393))

(assert (=> b!208474 m!320393))

(declare-fun m!320731 () Bool)

(assert (=> b!208474 m!320731))

(assert (=> b!208256 d!70439))

(declare-fun d!70441 () Bool)

(assert (=> d!70441 (isPrefixOf!0 thiss!1204 (_2!9590 lt!325315))))

(declare-fun lt!325670 () Unit!14821)

(declare-fun choose!30 (BitStream!8296 BitStream!8296 BitStream!8296) Unit!14821)

(assert (=> d!70441 (= lt!325670 (choose!30 thiss!1204 (_2!9590 lt!325310) (_2!9590 lt!325315)))))

(assert (=> d!70441 (isPrefixOf!0 thiss!1204 (_2!9590 lt!325310))))

(assert (=> d!70441 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9590 lt!325310) (_2!9590 lt!325315)) lt!325670)))

(declare-fun bs!17316 () Bool)

(assert (= bs!17316 d!70441))

(assert (=> bs!17316 m!320447))

(declare-fun m!320733 () Bool)

(assert (=> bs!17316 m!320733))

(assert (=> bs!17316 m!320405))

(assert (=> b!208256 d!70441))

(declare-fun b!208611 () Bool)

(declare-fun lt!326117 () tuple2!17872)

(declare-fun lt!326096 () tuple2!17870)

(assert (=> b!208611 (= lt!326117 (readBitPure!0 (readerFrom!0 (_2!9590 lt!326096) (currentBit!9621 (_2!9590 lt!325310)) (currentByte!9626 (_2!9590 lt!325310)))))))

(declare-fun lt!326090 () Bool)

(declare-fun res!175081 () Bool)

(assert (=> b!208611 (= res!175081 (and (= (_2!9591 lt!326117) lt!326090) (= (_1!9591 lt!326117) (_2!9590 lt!326096))))))

(declare-fun e!142505 () Bool)

(assert (=> b!208611 (=> (not res!175081) (not e!142505))))

(declare-fun e!142503 () Bool)

(assert (=> b!208611 (= e!142503 e!142505)))

(declare-fun b!208612 () Bool)

(declare-fun e!142498 () (_ BitVec 64))

(assert (=> b!208612 (= e!142498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!208613 () Bool)

(declare-fun e!142500 () Bool)

(declare-fun e!142506 () Bool)

(assert (=> b!208613 (= e!142500 e!142506)))

(declare-fun res!175088 () Bool)

(assert (=> b!208613 (=> (not res!175088) (not e!142506))))

(declare-fun lt!326115 () tuple2!17876)

(assert (=> b!208613 (= res!175088 (= (_2!9593 lt!326115) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!326131 () tuple2!17874)

(assert (=> b!208613 (= lt!326115 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!326131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!326113 () Unit!14821)

(declare-fun lt!326121 () Unit!14821)

(assert (=> b!208613 (= lt!326113 lt!326121)))

(declare-fun lt!326126 () tuple2!17870)

(declare-fun lt!326122 () (_ BitVec 64))

(assert (=> b!208613 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!326126)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!326122)))

(assert (=> b!208613 (= lt!326121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!326126)) lt!326122))))

(declare-fun e!142501 () Bool)

(assert (=> b!208613 e!142501))

(declare-fun res!175085 () Bool)

(assert (=> b!208613 (=> (not res!175085) (not e!142501))))

(assert (=> b!208613 (= res!175085 (and (= (size!4594 (buf!5102 (_2!9590 lt!325310))) (size!4594 (buf!5102 (_2!9590 lt!326126)))) (bvsge lt!326122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208613 (= lt!326122 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!208613 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!208613 (= lt!326131 (reader!0 (_2!9590 lt!325310) (_2!9590 lt!326126)))))

(declare-fun call!3287 () Bool)

(declare-fun c!10257 () Bool)

(declare-fun bm!3284 () Bool)

(assert (=> bm!3284 (= call!3287 (isPrefixOf!0 (_2!9590 lt!325310) (ite c!10257 (_2!9590 lt!325310) (_2!9590 lt!326096))))))

(declare-fun b!208614 () Bool)

(declare-fun res!175080 () Bool)

(assert (=> b!208614 (=> (not res!175080) (not e!142500))))

(declare-fun lt!326088 () (_ BitVec 64))

(declare-fun lt!326136 () (_ BitVec 64))

(assert (=> b!208614 (= res!175080 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326126))) (currentByte!9626 (_2!9590 lt!326126)) (currentBit!9621 (_2!9590 lt!326126))) (bvsub lt!326136 lt!326088)))))

(assert (=> b!208614 (or (= (bvand lt!326136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326136 lt!326088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208614 (= lt!326088 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!326100 () (_ BitVec 64))

(declare-fun lt!326140 () (_ BitVec 64))

(assert (=> b!208614 (= lt!326136 (bvadd lt!326100 lt!326140))))

(assert (=> b!208614 (or (not (= (bvand lt!326100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326140 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!326100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!326100 lt!326140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208614 (= lt!326140 ((_ sign_extend 32) nBits!348))))

(assert (=> b!208614 (= lt!326100 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(declare-fun b!208615 () Bool)

(declare-fun res!175089 () Bool)

(assert (=> b!208615 (=> (not res!175089) (not e!142500))))

(assert (=> b!208615 (= res!175089 (= (size!4594 (buf!5102 (_2!9590 lt!325310))) (size!4594 (buf!5102 (_2!9590 lt!326126)))))))

(declare-fun b!208616 () Bool)

(declare-fun e!142499 () Bool)

(declare-fun lt!326124 () tuple2!17876)

(declare-fun lt!326106 () tuple2!17874)

(assert (=> b!208616 (= e!142499 (= (_1!9593 lt!326124) (_2!9592 lt!326106)))))

(declare-fun b!208617 () Bool)

(assert (=> b!208617 (= e!142498 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!208610 () Bool)

(assert (=> b!208610 (= e!142501 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325310)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!326122))))

(declare-fun d!70443 () Bool)

(assert (=> d!70443 e!142500))

(declare-fun res!175083 () Bool)

(assert (=> d!70443 (=> (not res!175083) (not e!142500))))

(assert (=> d!70443 (= res!175083 (invariant!0 (currentBit!9621 (_2!9590 lt!326126)) (currentByte!9626 (_2!9590 lt!326126)) (size!4594 (buf!5102 (_2!9590 lt!326126)))))))

(declare-fun e!142502 () tuple2!17870)

(assert (=> d!70443 (= lt!326126 e!142502)))

(assert (=> d!70443 (= c!10257 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70443 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70443 (= (appendBitsLSBFirstLoopTR!0 (_2!9590 lt!325310) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!326126)))

(declare-fun b!208618 () Bool)

(declare-fun res!175087 () Bool)

(assert (=> b!208618 (=> (not res!175087) (not e!142500))))

(assert (=> b!208618 (= res!175087 (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!326126)))))

(declare-fun b!208619 () Bool)

(declare-fun Unit!14840 () Unit!14821)

(assert (=> b!208619 (= e!142502 (tuple2!17871 Unit!14840 (_2!9590 lt!325310)))))

(declare-fun lt!326093 () Unit!14821)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8296) Unit!14821)

(assert (=> b!208619 (= lt!326093 (lemmaIsPrefixRefl!0 (_2!9590 lt!325310)))))

(assert (=> b!208619 call!3287))

(declare-fun lt!326139 () Unit!14821)

(assert (=> b!208619 (= lt!326139 lt!326093)))

(declare-fun b!208620 () Bool)

(declare-fun lt!326097 () tuple2!17870)

(assert (=> b!208620 (= e!142502 (tuple2!17871 (_1!9590 lt!326097) (_2!9590 lt!326097)))))

(assert (=> b!208620 (= lt!326090 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208620 (= lt!326096 (appendBit!0 (_2!9590 lt!325310) lt!326090))))

(declare-fun res!175084 () Bool)

(assert (=> b!208620 (= res!175084 (= (size!4594 (buf!5102 (_2!9590 lt!325310))) (size!4594 (buf!5102 (_2!9590 lt!326096)))))))

(assert (=> b!208620 (=> (not res!175084) (not e!142503))))

(assert (=> b!208620 e!142503))

(declare-fun lt!326123 () tuple2!17870)

(assert (=> b!208620 (= lt!326123 lt!326096)))

(assert (=> b!208620 (= lt!326097 (appendBitsLSBFirstLoopTR!0 (_2!9590 lt!326123) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!326116 () Unit!14821)

(assert (=> b!208620 (= lt!326116 (lemmaIsPrefixTransitive!0 (_2!9590 lt!325310) (_2!9590 lt!326123) (_2!9590 lt!326097)))))

(assert (=> b!208620 (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!326097))))

(declare-fun lt!326103 () Unit!14821)

(assert (=> b!208620 (= lt!326103 lt!326116)))

(assert (=> b!208620 (invariant!0 (currentBit!9621 (_2!9590 lt!325310)) (currentByte!9626 (_2!9590 lt!325310)) (size!4594 (buf!5102 (_2!9590 lt!326123))))))

(declare-fun lt!326105 () BitStream!8296)

(assert (=> b!208620 (= lt!326105 (BitStream!8297 (buf!5102 (_2!9590 lt!326123)) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(assert (=> b!208620 (invariant!0 (currentBit!9621 lt!326105) (currentByte!9626 lt!326105) (size!4594 (buf!5102 (_2!9590 lt!326097))))))

(declare-fun lt!326091 () BitStream!8296)

(assert (=> b!208620 (= lt!326091 (BitStream!8297 (buf!5102 (_2!9590 lt!326097)) (currentByte!9626 lt!326105) (currentBit!9621 lt!326105)))))

(declare-fun lt!326142 () tuple2!17872)

(assert (=> b!208620 (= lt!326142 (readBitPure!0 lt!326105))))

(declare-fun lt!326099 () tuple2!17872)

(assert (=> b!208620 (= lt!326099 (readBitPure!0 lt!326091))))

(declare-fun lt!326114 () Unit!14821)

(assert (=> b!208620 (= lt!326114 (readBitPrefixLemma!0 lt!326105 (_2!9590 lt!326097)))))

(declare-fun res!175090 () Bool)

(assert (=> b!208620 (= res!175090 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326142))) (currentByte!9626 (_1!9591 lt!326142)) (currentBit!9621 (_1!9591 lt!326142))) (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326099))) (currentByte!9626 (_1!9591 lt!326099)) (currentBit!9621 (_1!9591 lt!326099)))))))

(declare-fun e!142504 () Bool)

(assert (=> b!208620 (=> (not res!175090) (not e!142504))))

(assert (=> b!208620 e!142504))

(declare-fun lt!326137 () Unit!14821)

(assert (=> b!208620 (= lt!326137 lt!326114)))

(declare-fun lt!326129 () tuple2!17874)

(assert (=> b!208620 (= lt!326129 (reader!0 (_2!9590 lt!325310) (_2!9590 lt!326097)))))

(declare-fun lt!326112 () tuple2!17874)

(assert (=> b!208620 (= lt!326112 (reader!0 (_2!9590 lt!326123) (_2!9590 lt!326097)))))

(declare-fun lt!326130 () tuple2!17872)

(assert (=> b!208620 (= lt!326130 (readBitPure!0 (_1!9592 lt!326129)))))

(assert (=> b!208620 (= (_2!9591 lt!326130) lt!326090)))

(declare-fun lt!326120 () Unit!14821)

(declare-fun Unit!14841 () Unit!14821)

(assert (=> b!208620 (= lt!326120 Unit!14841)))

(declare-fun lt!326098 () (_ BitVec 64))

(assert (=> b!208620 (= lt!326098 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326125 () (_ BitVec 64))

(assert (=> b!208620 (= lt!326125 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326141 () Unit!14821)

(assert (=> b!208620 (= lt!326141 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!326097)) lt!326125))))

(assert (=> b!208620 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!326097)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!326125)))

(declare-fun lt!326138 () Unit!14821)

(assert (=> b!208620 (= lt!326138 lt!326141)))

(declare-fun lt!326111 () tuple2!17876)

(assert (=> b!208620 (= lt!326111 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!326129) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326098))))

(declare-fun lt!326143 () (_ BitVec 64))

(assert (=> b!208620 (= lt!326143 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!326102 () Unit!14821)

(assert (=> b!208620 (= lt!326102 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!326123) (buf!5102 (_2!9590 lt!326097)) lt!326143))))

(assert (=> b!208620 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!326097)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!326123))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!326123))) lt!326143)))

(declare-fun lt!326118 () Unit!14821)

(assert (=> b!208620 (= lt!326118 lt!326102)))

(declare-fun lt!326127 () tuple2!17876)

(assert (=> b!208620 (= lt!326127 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!326112) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!326098 (ite (_2!9591 lt!326130) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!326110 () tuple2!17876)

(assert (=> b!208620 (= lt!326110 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!326129) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326098))))

(declare-fun c!10258 () Bool)

(assert (=> b!208620 (= c!10258 (_2!9591 (readBitPure!0 (_1!9592 lt!326129))))))

(declare-fun lt!326095 () tuple2!17876)

(declare-fun withMovedBitIndex!0 (BitStream!8296 (_ BitVec 64)) BitStream!8296)

(assert (=> b!208620 (= lt!326095 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9592 lt!326129) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!326098 e!142498)))))

(declare-fun lt!326119 () Unit!14821)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14821)

(assert (=> b!208620 (= lt!326119 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9592 lt!326129) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!326098))))

(assert (=> b!208620 (and (= (_2!9593 lt!326110) (_2!9593 lt!326095)) (= (_1!9593 lt!326110) (_1!9593 lt!326095)))))

(declare-fun lt!326094 () Unit!14821)

(assert (=> b!208620 (= lt!326094 lt!326119)))

(assert (=> b!208620 (= (_1!9592 lt!326129) (withMovedBitIndex!0 (_2!9592 lt!326129) (bvsub (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326097))) (currentByte!9626 (_2!9590 lt!326097)) (currentBit!9621 (_2!9590 lt!326097))))))))

(declare-fun lt!326134 () Unit!14821)

(declare-fun Unit!14842 () Unit!14821)

(assert (=> b!208620 (= lt!326134 Unit!14842)))

(assert (=> b!208620 (= (_1!9592 lt!326112) (withMovedBitIndex!0 (_2!9592 lt!326112) (bvsub (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326123))) (currentByte!9626 (_2!9590 lt!326123)) (currentBit!9621 (_2!9590 lt!326123))) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326097))) (currentByte!9626 (_2!9590 lt!326097)) (currentBit!9621 (_2!9590 lt!326097))))))))

(declare-fun lt!326135 () Unit!14821)

(declare-fun Unit!14843 () Unit!14821)

(assert (=> b!208620 (= lt!326135 Unit!14843)))

(assert (=> b!208620 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) (bvsub (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326123))) (currentByte!9626 (_2!9590 lt!326123)) (currentBit!9621 (_2!9590 lt!326123))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!326133 () Unit!14821)

(declare-fun Unit!14844 () Unit!14821)

(assert (=> b!208620 (= lt!326133 Unit!14844)))

(assert (=> b!208620 (= (_2!9593 lt!326111) (_2!9593 lt!326127))))

(declare-fun lt!326101 () Unit!14821)

(declare-fun Unit!14845 () Unit!14821)

(assert (=> b!208620 (= lt!326101 Unit!14845)))

(assert (=> b!208620 (invariant!0 (currentBit!9621 (_2!9590 lt!326097)) (currentByte!9626 (_2!9590 lt!326097)) (size!4594 (buf!5102 (_2!9590 lt!326097))))))

(declare-fun lt!326128 () Unit!14821)

(declare-fun Unit!14846 () Unit!14821)

(assert (=> b!208620 (= lt!326128 Unit!14846)))

(assert (=> b!208620 (= (size!4594 (buf!5102 (_2!9590 lt!325310))) (size!4594 (buf!5102 (_2!9590 lt!326097))))))

(declare-fun lt!326132 () Unit!14821)

(declare-fun Unit!14847 () Unit!14821)

(assert (=> b!208620 (= lt!326132 Unit!14847)))

(assert (=> b!208620 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326097))) (currentByte!9626 (_2!9590 lt!326097)) (currentBit!9621 (_2!9590 lt!326097))) (bvsub (bvadd (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326108 () Unit!14821)

(declare-fun Unit!14848 () Unit!14821)

(assert (=> b!208620 (= lt!326108 Unit!14848)))

(declare-fun lt!326092 () Unit!14821)

(declare-fun Unit!14849 () Unit!14821)

(assert (=> b!208620 (= lt!326092 Unit!14849)))

(assert (=> b!208620 (= lt!326106 (reader!0 (_2!9590 lt!325310) (_2!9590 lt!326097)))))

(declare-fun lt!326104 () (_ BitVec 64))

(assert (=> b!208620 (= lt!326104 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!326089 () Unit!14821)

(assert (=> b!208620 (= lt!326089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!326097)) lt!326104))))

(assert (=> b!208620 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!326097)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!326104)))

(declare-fun lt!326109 () Unit!14821)

(assert (=> b!208620 (= lt!326109 lt!326089)))

(assert (=> b!208620 (= lt!326124 (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!326106) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175082 () Bool)

(assert (=> b!208620 (= res!175082 (= (_2!9593 lt!326124) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!208620 (=> (not res!175082) (not e!142499))))

(assert (=> b!208620 e!142499))

(declare-fun lt!326107 () Unit!14821)

(declare-fun Unit!14851 () Unit!14821)

(assert (=> b!208620 (= lt!326107 Unit!14851)))

(declare-fun b!208621 () Bool)

(assert (=> b!208621 (= e!142505 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326117))) (currentByte!9626 (_1!9591 lt!326117)) (currentBit!9621 (_1!9591 lt!326117))) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326096))) (currentByte!9626 (_2!9590 lt!326096)) (currentBit!9621 (_2!9590 lt!326096)))))))

(declare-fun b!208622 () Bool)

(assert (=> b!208622 (= e!142506 (= (_1!9593 lt!326115) (_2!9592 lt!326131)))))

(declare-fun b!208623 () Bool)

(assert (=> b!208623 (= e!142504 (= (_2!9591 lt!326142) (_2!9591 lt!326099)))))

(declare-fun b!208624 () Bool)

(declare-fun res!175086 () Bool)

(assert (=> b!208624 (= res!175086 call!3287)))

(assert (=> b!208624 (=> (not res!175086) (not e!142503))))

(declare-fun b!208625 () Bool)

(declare-fun res!175091 () Bool)

(assert (=> b!208625 (= res!175091 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326096))) (currentByte!9626 (_2!9590 lt!326096)) (currentBit!9621 (_2!9590 lt!326096))) (bvadd (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!208625 (=> (not res!175091) (not e!142503))))

(assert (= (and d!70443 c!10257) b!208619))

(assert (= (and d!70443 (not c!10257)) b!208620))

(assert (= (and b!208620 res!175084) b!208625))

(assert (= (and b!208625 res!175091) b!208624))

(assert (= (and b!208624 res!175086) b!208611))

(assert (= (and b!208611 res!175081) b!208621))

(assert (= (and b!208620 res!175090) b!208623))

(assert (= (and b!208620 c!10258) b!208617))

(assert (= (and b!208620 (not c!10258)) b!208612))

(assert (= (and b!208620 res!175082) b!208616))

(assert (= (or b!208619 b!208624) bm!3284))

(assert (= (and d!70443 res!175083) b!208615))

(assert (= (and b!208615 res!175089) b!208614))

(assert (= (and b!208614 res!175080) b!208618))

(assert (= (and b!208618 res!175087) b!208613))

(assert (= (and b!208613 res!175085) b!208610))

(assert (= (and b!208613 res!175088) b!208622))

(declare-fun m!320853 () Bool)

(assert (=> b!208614 m!320853))

(assert (=> b!208614 m!320391))

(declare-fun m!320855 () Bool)

(assert (=> b!208621 m!320855))

(declare-fun m!320857 () Bool)

(assert (=> b!208621 m!320857))

(declare-fun m!320859 () Bool)

(assert (=> b!208619 m!320859))

(declare-fun m!320861 () Bool)

(assert (=> b!208611 m!320861))

(assert (=> b!208611 m!320861))

(declare-fun m!320863 () Bool)

(assert (=> b!208611 m!320863))

(declare-fun m!320865 () Bool)

(assert (=> b!208610 m!320865))

(declare-fun m!320867 () Bool)

(assert (=> b!208620 m!320867))

(declare-fun m!320869 () Bool)

(assert (=> b!208620 m!320869))

(declare-fun m!320871 () Bool)

(assert (=> b!208620 m!320871))

(assert (=> b!208620 m!320391))

(declare-fun m!320873 () Bool)

(assert (=> b!208620 m!320873))

(declare-fun m!320875 () Bool)

(assert (=> b!208620 m!320875))

(declare-fun m!320877 () Bool)

(assert (=> b!208620 m!320877))

(declare-fun m!320879 () Bool)

(assert (=> b!208620 m!320879))

(declare-fun m!320881 () Bool)

(assert (=> b!208620 m!320881))

(declare-fun m!320883 () Bool)

(assert (=> b!208620 m!320883))

(declare-fun m!320885 () Bool)

(assert (=> b!208620 m!320885))

(declare-fun m!320887 () Bool)

(assert (=> b!208620 m!320887))

(declare-fun m!320889 () Bool)

(assert (=> b!208620 m!320889))

(declare-fun m!320891 () Bool)

(assert (=> b!208620 m!320891))

(declare-fun m!320893 () Bool)

(assert (=> b!208620 m!320893))

(declare-fun m!320895 () Bool)

(assert (=> b!208620 m!320895))

(declare-fun m!320897 () Bool)

(assert (=> b!208620 m!320897))

(declare-fun m!320899 () Bool)

(assert (=> b!208620 m!320899))

(declare-fun m!320901 () Bool)

(assert (=> b!208620 m!320901))

(declare-fun m!320903 () Bool)

(assert (=> b!208620 m!320903))

(declare-fun m!320905 () Bool)

(assert (=> b!208620 m!320905))

(declare-fun m!320907 () Bool)

(assert (=> b!208620 m!320907))

(declare-fun m!320909 () Bool)

(assert (=> b!208620 m!320909))

(declare-fun m!320911 () Bool)

(assert (=> b!208620 m!320911))

(declare-fun m!320913 () Bool)

(assert (=> b!208620 m!320913))

(declare-fun m!320915 () Bool)

(assert (=> b!208620 m!320915))

(declare-fun m!320917 () Bool)

(assert (=> b!208620 m!320917))

(declare-fun m!320919 () Bool)

(assert (=> b!208620 m!320919))

(declare-fun m!320921 () Bool)

(assert (=> b!208620 m!320921))

(declare-fun m!320923 () Bool)

(assert (=> b!208620 m!320923))

(assert (=> b!208620 m!320883))

(declare-fun m!320925 () Bool)

(assert (=> b!208620 m!320925))

(declare-fun m!320927 () Bool)

(assert (=> b!208620 m!320927))

(declare-fun m!320929 () Bool)

(assert (=> b!208620 m!320929))

(declare-fun m!320931 () Bool)

(assert (=> b!208620 m!320931))

(declare-fun m!320933 () Bool)

(assert (=> d!70443 m!320933))

(declare-fun m!320935 () Bool)

(assert (=> bm!3284 m!320935))

(assert (=> b!208625 m!320857))

(assert (=> b!208625 m!320391))

(declare-fun m!320937 () Bool)

(assert (=> b!208618 m!320937))

(declare-fun m!320939 () Bool)

(assert (=> b!208613 m!320939))

(assert (=> b!208613 m!320871))

(declare-fun m!320941 () Bool)

(assert (=> b!208613 m!320941))

(declare-fun m!320943 () Bool)

(assert (=> b!208613 m!320943))

(assert (=> b!208613 m!320907))

(declare-fun m!320945 () Bool)

(assert (=> b!208613 m!320945))

(assert (=> b!208256 d!70443))

(declare-fun d!70471 () Bool)

(assert (=> d!70471 (= (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325315)))) (and (bvsge (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9621 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9626 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325315)))) (and (= (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325315))))))))))

(assert (=> b!208245 d!70471))

(declare-fun d!70473 () Bool)

(assert (=> d!70473 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)) lt!325294) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204))) lt!325294))))

(declare-fun bs!17321 () Bool)

(assert (= bs!17321 d!70473))

(declare-fun m!320947 () Bool)

(assert (=> bs!17321 m!320947))

(assert (=> b!208255 d!70473))

(declare-fun d!70475 () Bool)

(assert (=> d!70475 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204))))))

(declare-fun bs!17322 () Bool)

(assert (= bs!17322 d!70475))

(assert (=> bs!17322 m!320389))

(assert (=> start!43758 d!70475))

(declare-fun d!70477 () Bool)

(declare-fun res!175092 () Bool)

(declare-fun e!142507 () Bool)

(assert (=> d!70477 (=> (not res!175092) (not e!142507))))

(assert (=> d!70477 (= res!175092 (= (size!4594 (buf!5102 (_2!9590 lt!325310))) (size!4594 (buf!5102 (_2!9590 lt!325315)))))))

(assert (=> d!70477 (= (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!325315)) e!142507)))

(declare-fun b!208626 () Bool)

(declare-fun res!175093 () Bool)

(assert (=> b!208626 (=> (not res!175093) (not e!142507))))

(assert (=> b!208626 (= res!175093 (bvsle (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315)))))))

(declare-fun b!208627 () Bool)

(declare-fun e!142508 () Bool)

(assert (=> b!208627 (= e!142507 e!142508)))

(declare-fun res!175094 () Bool)

(assert (=> b!208627 (=> res!175094 e!142508)))

(assert (=> b!208627 (= res!175094 (= (size!4594 (buf!5102 (_2!9590 lt!325310))) #b00000000000000000000000000000000))))

(declare-fun b!208628 () Bool)

(assert (=> b!208628 (= e!142508 (arrayBitRangesEq!0 (buf!5102 (_2!9590 lt!325310)) (buf!5102 (_2!9590 lt!325315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310)))))))

(assert (= (and d!70477 res!175092) b!208626))

(assert (= (and b!208626 res!175093) b!208627))

(assert (= (and b!208627 (not res!175094)) b!208628))

(assert (=> b!208626 m!320391))

(assert (=> b!208626 m!320445))

(assert (=> b!208628 m!320391))

(assert (=> b!208628 m!320391))

(declare-fun m!320949 () Bool)

(assert (=> b!208628 m!320949))

(assert (=> b!208246 d!70477))

(declare-fun d!70479 () Bool)

(declare-fun res!175107 () Bool)

(declare-fun e!142518 () Bool)

(assert (=> d!70479 (=> (not res!175107) (not e!142518))))

(assert (=> d!70479 (= res!175107 (= (size!4594 (buf!5102 thiss!1204)) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (=> d!70479 (= (isPrefixOf!0 thiss!1204 (_2!9590 lt!325310)) e!142518)))

(declare-fun b!208645 () Bool)

(declare-fun res!175108 () Bool)

(assert (=> b!208645 (=> (not res!175108) (not e!142518))))

(assert (=> b!208645 (= res!175108 (bvsle (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310)))))))

(declare-fun b!208646 () Bool)

(declare-fun e!142519 () Bool)

(assert (=> b!208646 (= e!142518 e!142519)))

(declare-fun res!175109 () Bool)

(assert (=> b!208646 (=> res!175109 e!142519)))

(assert (=> b!208646 (= res!175109 (= (size!4594 (buf!5102 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!208647 () Bool)

(assert (=> b!208647 (= e!142519 (arrayBitRangesEq!0 (buf!5102 thiss!1204) (buf!5102 (_2!9590 lt!325310)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))))))

(assert (= (and d!70479 res!175107) b!208645))

(assert (= (and b!208645 res!175108) b!208646))

(assert (= (and b!208646 (not res!175109)) b!208647))

(assert (=> b!208645 m!320393))

(assert (=> b!208645 m!320391))

(assert (=> b!208647 m!320393))

(assert (=> b!208647 m!320393))

(declare-fun m!320951 () Bool)

(assert (=> b!208647 m!320951))

(assert (=> b!208248 d!70479))

(assert (=> b!208258 d!70479))

(declare-fun d!70481 () Bool)

(assert (=> d!70481 (= (invariant!0 (currentBit!9621 (_2!9590 lt!325315)) (currentByte!9626 (_2!9590 lt!325315)) (size!4594 (buf!5102 (_2!9590 lt!325315)))) (and (bvsge (currentBit!9621 (_2!9590 lt!325315)) #b00000000000000000000000000000000) (bvslt (currentBit!9621 (_2!9590 lt!325315)) #b00000000000000000000000000001000) (bvsge (currentByte!9626 (_2!9590 lt!325315)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9626 (_2!9590 lt!325315)) (size!4594 (buf!5102 (_2!9590 lt!325315)))) (and (= (currentBit!9621 (_2!9590 lt!325315)) #b00000000000000000000000000000000) (= (currentByte!9626 (_2!9590 lt!325315)) (size!4594 (buf!5102 (_2!9590 lt!325315))))))))))

(assert (=> b!208247 d!70481))

(declare-fun d!70483 () Bool)

(declare-datatypes ((tuple2!17898 0))(
  ( (tuple2!17899 (_1!9604 Bool) (_2!9604 BitStream!8296)) )
))
(declare-fun lt!326202 () tuple2!17898)

(declare-fun readBit!0 (BitStream!8296) tuple2!17898)

(assert (=> d!70483 (= lt!326202 (readBit!0 (readerFrom!0 (_2!9590 lt!325310) (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204))))))

(assert (=> d!70483 (= (readBitPure!0 (readerFrom!0 (_2!9590 lt!325310) (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204))) (tuple2!17873 (_2!9604 lt!326202) (_1!9604 lt!326202)))))

(declare-fun bs!17323 () Bool)

(assert (= bs!17323 d!70483))

(assert (=> bs!17323 m!320397))

(declare-fun m!320953 () Bool)

(assert (=> bs!17323 m!320953))

(assert (=> b!208260 d!70483))

(declare-fun d!70485 () Bool)

(declare-fun e!142522 () Bool)

(assert (=> d!70485 e!142522))

(declare-fun res!175113 () Bool)

(assert (=> d!70485 (=> (not res!175113) (not e!142522))))

(assert (=> d!70485 (= res!175113 (invariant!0 (currentBit!9621 (_2!9590 lt!325310)) (currentByte!9626 (_2!9590 lt!325310)) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (=> d!70485 (= (readerFrom!0 (_2!9590 lt!325310) (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204)) (BitStream!8297 (buf!5102 (_2!9590 lt!325310)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun b!208650 () Bool)

(assert (=> b!208650 (= e!142522 (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (= (and d!70485 res!175113) b!208650))

(declare-fun m!321049 () Bool)

(assert (=> d!70485 m!321049))

(assert (=> b!208650 m!320417))

(assert (=> b!208260 d!70485))

(declare-fun d!70489 () Bool)

(declare-fun e!142523 () Bool)

(assert (=> d!70489 e!142523))

(declare-fun res!175114 () Bool)

(assert (=> d!70489 (=> (not res!175114) (not e!142523))))

(declare-fun lt!326207 () (_ BitVec 64))

(declare-fun lt!326208 () (_ BitVec 64))

(declare-fun lt!326206 () (_ BitVec 64))

(assert (=> d!70489 (= res!175114 (= lt!326206 (bvsub lt!326207 lt!326208)))))

(assert (=> d!70489 (or (= (bvand lt!326207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326207 lt!326208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70489 (= lt!326208 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325314)))) ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325314))) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325314)))))))

(declare-fun lt!326204 () (_ BitVec 64))

(declare-fun lt!326205 () (_ BitVec 64))

(assert (=> d!70489 (= lt!326207 (bvmul lt!326204 lt!326205))))

(assert (=> d!70489 (or (= lt!326204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326205 (bvsdiv (bvmul lt!326204 lt!326205) lt!326204)))))

(assert (=> d!70489 (= lt!326205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70489 (= lt!326204 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325314)))))))

(assert (=> d!70489 (= lt!326206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325314))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325314)))))))

(assert (=> d!70489 (invariant!0 (currentBit!9621 (_1!9591 lt!325314)) (currentByte!9626 (_1!9591 lt!325314)) (size!4594 (buf!5102 (_1!9591 lt!325314))))))

(assert (=> d!70489 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325314))) (currentByte!9626 (_1!9591 lt!325314)) (currentBit!9621 (_1!9591 lt!325314))) lt!326206)))

(declare-fun b!208651 () Bool)

(declare-fun res!175115 () Bool)

(assert (=> b!208651 (=> (not res!175115) (not e!142523))))

(assert (=> b!208651 (= res!175115 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326206))))

(declare-fun b!208652 () Bool)

(declare-fun lt!326203 () (_ BitVec 64))

(assert (=> b!208652 (= e!142523 (bvsle lt!326206 (bvmul lt!326203 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208652 (or (= lt!326203 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326203 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326203)))))

(assert (=> b!208652 (= lt!326203 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325314)))))))

(assert (= (and d!70489 res!175114) b!208651))

(assert (= (and b!208651 res!175115) b!208652))

(declare-fun m!321051 () Bool)

(assert (=> d!70489 m!321051))

(declare-fun m!321053 () Bool)

(assert (=> d!70489 m!321053))

(assert (=> b!208249 d!70489))

(declare-fun d!70491 () Bool)

(declare-fun e!142524 () Bool)

(assert (=> d!70491 e!142524))

(declare-fun res!175116 () Bool)

(assert (=> d!70491 (=> (not res!175116) (not e!142524))))

(declare-fun lt!326214 () (_ BitVec 64))

(declare-fun lt!326213 () (_ BitVec 64))

(declare-fun lt!326212 () (_ BitVec 64))

(assert (=> d!70491 (= res!175116 (= lt!326212 (bvsub lt!326213 lt!326214)))))

(assert (=> d!70491 (or (= (bvand lt!326213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326214 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326213 lt!326214) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70491 (= lt!326214 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325310)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310)))))))

(declare-fun lt!326210 () (_ BitVec 64))

(declare-fun lt!326211 () (_ BitVec 64))

(assert (=> d!70491 (= lt!326213 (bvmul lt!326210 lt!326211))))

(assert (=> d!70491 (or (= lt!326210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326211 (bvsdiv (bvmul lt!326210 lt!326211) lt!326210)))))

(assert (=> d!70491 (= lt!326211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70491 (= lt!326210 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (=> d!70491 (= lt!326212 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310)))))))

(assert (=> d!70491 (invariant!0 (currentBit!9621 (_2!9590 lt!325310)) (currentByte!9626 (_2!9590 lt!325310)) (size!4594 (buf!5102 (_2!9590 lt!325310))))))

(assert (=> d!70491 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))) lt!326212)))

(declare-fun b!208653 () Bool)

(declare-fun res!175117 () Bool)

(assert (=> b!208653 (=> (not res!175117) (not e!142524))))

(assert (=> b!208653 (= res!175117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326212))))

(declare-fun b!208654 () Bool)

(declare-fun lt!326209 () (_ BitVec 64))

(assert (=> b!208654 (= e!142524 (bvsle lt!326212 (bvmul lt!326209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208654 (or (= lt!326209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326209)))))

(assert (=> b!208654 (= lt!326209 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325310)))))))

(assert (= (and d!70491 res!175116) b!208653))

(assert (= (and b!208653 res!175117) b!208654))

(declare-fun m!321055 () Bool)

(assert (=> d!70491 m!321055))

(assert (=> d!70491 m!321049))

(assert (=> b!208259 d!70491))

(declare-fun d!70493 () Bool)

(declare-fun e!142525 () Bool)

(assert (=> d!70493 e!142525))

(declare-fun res!175118 () Bool)

(assert (=> d!70493 (=> (not res!175118) (not e!142525))))

(declare-fun lt!326219 () (_ BitVec 64))

(declare-fun lt!326220 () (_ BitVec 64))

(declare-fun lt!326218 () (_ BitVec 64))

(assert (=> d!70493 (= res!175118 (= lt!326218 (bvsub lt!326219 lt!326220)))))

(assert (=> d!70493 (or (= (bvand lt!326219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326219 lt!326220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70493 (= lt!326220 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204))))))

(declare-fun lt!326216 () (_ BitVec 64))

(declare-fun lt!326217 () (_ BitVec 64))

(assert (=> d!70493 (= lt!326219 (bvmul lt!326216 lt!326217))))

(assert (=> d!70493 (or (= lt!326216 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326217 (bvsdiv (bvmul lt!326216 lt!326217) lt!326216)))))

(assert (=> d!70493 (= lt!326217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70493 (= lt!326216 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))))))

(assert (=> d!70493 (= lt!326218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 thiss!1204))))))

(assert (=> d!70493 (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 thiss!1204)))))

(assert (=> d!70493 (= (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)) lt!326218)))

(declare-fun b!208655 () Bool)

(declare-fun res!175119 () Bool)

(assert (=> b!208655 (=> (not res!175119) (not e!142525))))

(assert (=> b!208655 (= res!175119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326218))))

(declare-fun b!208656 () Bool)

(declare-fun lt!326215 () (_ BitVec 64))

(assert (=> b!208656 (= e!142525 (bvsle lt!326218 (bvmul lt!326215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208656 (or (= lt!326215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326215)))))

(assert (=> b!208656 (= lt!326215 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))))))

(assert (= (and d!70493 res!175118) b!208655))

(assert (= (and b!208655 res!175119) b!208656))

(assert (=> d!70493 m!320947))

(assert (=> d!70493 m!320389))

(assert (=> b!208259 d!70493))

(declare-fun b!208673 () Bool)

(declare-fun e!142534 () Bool)

(declare-fun e!142535 () Bool)

(assert (=> b!208673 (= e!142534 e!142535)))

(declare-fun res!175134 () Bool)

(assert (=> b!208673 (=> (not res!175134) (not e!142535))))

(declare-fun lt!326249 () tuple2!17870)

(declare-fun lt!326248 () tuple2!17872)

(assert (=> b!208673 (= res!175134 (and (= (_2!9591 lt!326248) lt!325303) (= (_1!9591 lt!326248) (_2!9590 lt!326249))))))

(assert (=> b!208673 (= lt!326248 (readBitPure!0 (readerFrom!0 (_2!9590 lt!326249) (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204))))))

(declare-fun b!208672 () Bool)

(declare-fun res!175136 () Bool)

(assert (=> b!208672 (=> (not res!175136) (not e!142534))))

(assert (=> b!208672 (= res!175136 (isPrefixOf!0 thiss!1204 (_2!9590 lt!326249)))))

(declare-fun d!70495 () Bool)

(assert (=> d!70495 e!142534))

(declare-fun res!175135 () Bool)

(assert (=> d!70495 (=> (not res!175135) (not e!142534))))

(assert (=> d!70495 (= res!175135 (= (size!4594 (buf!5102 thiss!1204)) (size!4594 (buf!5102 (_2!9590 lt!326249)))))))

(declare-fun choose!16 (BitStream!8296 Bool) tuple2!17870)

(assert (=> d!70495 (= lt!326249 (choose!16 thiss!1204 lt!325303))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70495 (validate_offset_bit!0 ((_ sign_extend 32) (size!4594 (buf!5102 thiss!1204))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)))))

(assert (=> d!70495 (= (appendBit!0 thiss!1204 lt!325303) lt!326249)))

(declare-fun b!208671 () Bool)

(declare-fun res!175137 () Bool)

(assert (=> b!208671 (=> (not res!175137) (not e!142534))))

(declare-fun lt!326251 () (_ BitVec 64))

(declare-fun lt!326250 () (_ BitVec 64))

(assert (=> b!208671 (= res!175137 (= (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326249))) (currentByte!9626 (_2!9590 lt!326249)) (currentBit!9621 (_2!9590 lt!326249))) (bvadd lt!326251 lt!326250)))))

(assert (=> b!208671 (or (not (= (bvand lt!326251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326250 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!326251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!326251 lt!326250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208671 (= lt!326250 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!208671 (= lt!326251 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun b!208674 () Bool)

(assert (=> b!208674 (= e!142535 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326248))) (currentByte!9626 (_1!9591 lt!326248)) (currentBit!9621 (_1!9591 lt!326248))) (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!326249))) (currentByte!9626 (_2!9590 lt!326249)) (currentBit!9621 (_2!9590 lt!326249)))))))

(assert (= (and d!70495 res!175135) b!208671))

(assert (= (and b!208671 res!175137) b!208672))

(assert (= (and b!208672 res!175136) b!208673))

(assert (= (and b!208673 res!175134) b!208674))

(declare-fun m!321077 () Bool)

(assert (=> d!70495 m!321077))

(declare-fun m!321079 () Bool)

(assert (=> d!70495 m!321079))

(declare-fun m!321081 () Bool)

(assert (=> b!208671 m!321081))

(assert (=> b!208671 m!320393))

(declare-fun m!321083 () Bool)

(assert (=> b!208674 m!321083))

(assert (=> b!208674 m!321081))

(declare-fun m!321085 () Bool)

(assert (=> b!208672 m!321085))

(declare-fun m!321087 () Bool)

(assert (=> b!208673 m!321087))

(assert (=> b!208673 m!321087))

(declare-fun m!321089 () Bool)

(assert (=> b!208673 m!321089))

(assert (=> b!208259 d!70495))

(assert (=> b!208261 d!70491))

(assert (=> b!208261 d!70493))

(declare-fun d!70521 () Bool)

(assert (=> d!70521 (= (array_inv!4335 (buf!5102 thiss!1204)) (bvsge (size!4594 (buf!5102 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208250 d!70521))

(declare-fun d!70523 () Bool)

(assert (=> d!70523 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208252 d!70523))

(declare-fun d!70525 () Bool)

(declare-fun lt!326252 () tuple2!17898)

(assert (=> d!70525 (= lt!326252 (readBit!0 (_1!9592 lt!325293)))))

(assert (=> d!70525 (= (readBitPure!0 (_1!9592 lt!325293)) (tuple2!17873 (_2!9604 lt!326252) (_1!9604 lt!326252)))))

(declare-fun bs!17333 () Bool)

(assert (= bs!17333 d!70525))

(declare-fun m!321091 () Bool)

(assert (=> bs!17333 m!321091))

(assert (=> b!208252 d!70525))

(declare-fun d!70527 () Bool)

(declare-fun lt!326253 () tuple2!17898)

(assert (=> d!70527 (= lt!326253 (readBit!0 lt!325297))))

(assert (=> d!70527 (= (readBitPure!0 lt!325297) (tuple2!17873 (_2!9604 lt!326253) (_1!9604 lt!326253)))))

(declare-fun bs!17334 () Bool)

(assert (= bs!17334 d!70527))

(declare-fun m!321093 () Bool)

(assert (=> bs!17334 m!321093))

(assert (=> b!208252 d!70527))

(declare-fun d!70529 () Bool)

(assert (=> d!70529 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)) lt!325294) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204))) lt!325294))))

(declare-fun bs!17335 () Bool)

(assert (= bs!17335 d!70529))

(declare-fun m!321095 () Bool)

(assert (=> bs!17335 m!321095))

(assert (=> b!208252 d!70529))

(declare-fun d!70531 () Bool)

(assert (=> d!70531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!325296)))

(declare-fun lt!326264 () Unit!14821)

(declare-fun choose!9 (BitStream!8296 array!10448 (_ BitVec 64) BitStream!8296) Unit!14821)

(assert (=> d!70531 (= lt!326264 (choose!9 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!325315)) lt!325296 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310)))))))

(assert (=> d!70531 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9590 lt!325310) (buf!5102 (_2!9590 lt!325315)) lt!325296) lt!326264)))

(declare-fun bs!17336 () Bool)

(assert (= bs!17336 d!70531))

(assert (=> bs!17336 m!320421))

(declare-fun m!321097 () Bool)

(assert (=> bs!17336 m!321097))

(assert (=> b!208252 d!70531))

(declare-fun d!70533 () Bool)

(declare-fun e!142538 () Bool)

(assert (=> d!70533 e!142538))

(declare-fun res!175140 () Bool)

(assert (=> d!70533 (=> (not res!175140) (not e!142538))))

(declare-fun lt!326268 () (_ BitVec 64))

(declare-fun lt!326270 () (_ BitVec 64))

(declare-fun lt!326269 () (_ BitVec 64))

(assert (=> d!70533 (= res!175140 (= lt!326268 (bvsub lt!326269 lt!326270)))))

(assert (=> d!70533 (or (= (bvand lt!326269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326270 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326269 lt!326270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70533 (= lt!326270 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325305)))) ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325305))) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325305)))))))

(declare-fun lt!326266 () (_ BitVec 64))

(declare-fun lt!326267 () (_ BitVec 64))

(assert (=> d!70533 (= lt!326269 (bvmul lt!326266 lt!326267))))

(assert (=> d!70533 (or (= lt!326266 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326267 (bvsdiv (bvmul lt!326266 lt!326267) lt!326266)))))

(assert (=> d!70533 (= lt!326267 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70533 (= lt!326266 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325305)))))))

(assert (=> d!70533 (= lt!326268 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325305)))))))

(assert (=> d!70533 (invariant!0 (currentBit!9621 (_1!9591 lt!325305)) (currentByte!9626 (_1!9591 lt!325305)) (size!4594 (buf!5102 (_1!9591 lt!325305))))))

(assert (=> d!70533 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325305))) (currentByte!9626 (_1!9591 lt!325305)) (currentBit!9621 (_1!9591 lt!325305))) lt!326268)))

(declare-fun b!208677 () Bool)

(declare-fun res!175141 () Bool)

(assert (=> b!208677 (=> (not res!175141) (not e!142538))))

(assert (=> b!208677 (= res!175141 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326268))))

(declare-fun b!208678 () Bool)

(declare-fun lt!326265 () (_ BitVec 64))

(assert (=> b!208678 (= e!142538 (bvsle lt!326268 (bvmul lt!326265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208678 (or (= lt!326265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326265)))))

(assert (=> b!208678 (= lt!326265 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325305)))))))

(assert (= (and d!70533 res!175140) b!208677))

(assert (= (and b!208677 res!175141) b!208678))

(declare-fun m!321099 () Bool)

(assert (=> d!70533 m!321099))

(declare-fun m!321101 () Bool)

(assert (=> d!70533 m!321101))

(assert (=> b!208252 d!70533))

(declare-fun d!70535 () Bool)

(declare-datatypes ((tuple2!17900 0))(
  ( (tuple2!17901 (_1!9605 (_ BitVec 64)) (_2!9605 BitStream!8296)) )
))
(declare-fun lt!326283 () tuple2!17900)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17900)

(assert (=> d!70535 (= lt!326283 (readNBitsLSBFirstsLoop!0 (_1!9592 lt!325298) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325299 (ite (_2!9591 lt!325304) lt!325313 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70535 (= (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!325298) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325299 (ite (_2!9591 lt!325304) lt!325313 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17877 (_2!9605 lt!326283) (_1!9605 lt!326283)))))

(declare-fun bs!17337 () Bool)

(assert (= bs!17337 d!70535))

(declare-fun m!321117 () Bool)

(assert (=> bs!17337 m!321117))

(assert (=> b!208252 d!70535))

(declare-fun d!70541 () Bool)

(declare-fun e!142543 () Bool)

(assert (=> d!70541 e!142543))

(declare-fun res!175147 () Bool)

(assert (=> d!70541 (=> (not res!175147) (not e!142543))))

(declare-fun lt!326293 () tuple2!17872)

(declare-fun lt!326295 () tuple2!17872)

(assert (=> d!70541 (= res!175147 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326293))) (currentByte!9626 (_1!9591 lt!326293)) (currentBit!9621 (_1!9591 lt!326293))) (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!326295))) (currentByte!9626 (_1!9591 lt!326295)) (currentBit!9621 (_1!9591 lt!326295)))))))

(declare-fun lt!326292 () Unit!14821)

(declare-fun lt!326294 () BitStream!8296)

(declare-fun choose!50 (BitStream!8296 BitStream!8296 BitStream!8296 tuple2!17872 tuple2!17872 BitStream!8296 Bool tuple2!17872 tuple2!17872 BitStream!8296 Bool) Unit!14821)

(assert (=> d!70541 (= lt!326292 (choose!50 lt!325297 (_2!9590 lt!325315) lt!326294 lt!326293 (tuple2!17873 (_1!9591 lt!326293) (_2!9591 lt!326293)) (_1!9591 lt!326293) (_2!9591 lt!326293) lt!326295 (tuple2!17873 (_1!9591 lt!326295) (_2!9591 lt!326295)) (_1!9591 lt!326295) (_2!9591 lt!326295)))))

(assert (=> d!70541 (= lt!326295 (readBitPure!0 lt!326294))))

(assert (=> d!70541 (= lt!326293 (readBitPure!0 lt!325297))))

(assert (=> d!70541 (= lt!326294 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 lt!325297) (currentBit!9621 lt!325297)))))

(assert (=> d!70541 (invariant!0 (currentBit!9621 lt!325297) (currentByte!9626 lt!325297) (size!4594 (buf!5102 (_2!9590 lt!325315))))))

(assert (=> d!70541 (= (readBitPrefixLemma!0 lt!325297 (_2!9590 lt!325315)) lt!326292)))

(declare-fun b!208684 () Bool)

(assert (=> b!208684 (= e!142543 (= (_2!9591 lt!326293) (_2!9591 lt!326295)))))

(assert (= (and d!70541 res!175147) b!208684))

(declare-fun m!321119 () Bool)

(assert (=> d!70541 m!321119))

(declare-fun m!321121 () Bool)

(assert (=> d!70541 m!321121))

(declare-fun m!321123 () Bool)

(assert (=> d!70541 m!321123))

(assert (=> d!70541 m!320435))

(declare-fun m!321125 () Bool)

(assert (=> d!70541 m!321125))

(declare-fun m!321127 () Bool)

(assert (=> d!70541 m!321127))

(assert (=> b!208252 d!70541))

(declare-fun lt!326442 () (_ BitVec 64))

(declare-fun lt!326428 () tuple2!17874)

(declare-fun e!142559 () Bool)

(declare-fun b!208720 () Bool)

(declare-fun lt!326431 () (_ BitVec 64))

(assert (=> b!208720 (= e!142559 (= (_1!9592 lt!326428) (withMovedBitIndex!0 (_2!9592 lt!326428) (bvsub lt!326431 lt!326442))))))

(assert (=> b!208720 (or (= (bvand lt!326431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326431 lt!326442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208720 (= lt!326442 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315))))))

(assert (=> b!208720 (= lt!326431 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun b!208721 () Bool)

(declare-fun e!142560 () Unit!14821)

(declare-fun lt!326432 () Unit!14821)

(assert (=> b!208721 (= e!142560 lt!326432)))

(declare-fun lt!326423 () (_ BitVec 64))

(assert (=> b!208721 (= lt!326423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326434 () (_ BitVec 64))

(assert (=> b!208721 (= lt!326434 (bitIndex!0 (size!4594 (buf!5102 thiss!1204)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10448 array!10448 (_ BitVec 64) (_ BitVec 64)) Unit!14821)

(assert (=> b!208721 (= lt!326432 (arrayBitRangesEqSymmetric!0 (buf!5102 thiss!1204) (buf!5102 (_2!9590 lt!325315)) lt!326423 lt!326434))))

(assert (=> b!208721 (arrayBitRangesEq!0 (buf!5102 (_2!9590 lt!325315)) (buf!5102 thiss!1204) lt!326423 lt!326434)))

(declare-fun b!208722 () Bool)

(declare-fun Unit!14862 () Unit!14821)

(assert (=> b!208722 (= e!142560 Unit!14862)))

(declare-fun b!208723 () Bool)

(declare-fun res!175172 () Bool)

(assert (=> b!208723 (=> (not res!175172) (not e!142559))))

(assert (=> b!208723 (= res!175172 (isPrefixOf!0 (_2!9592 lt!326428) (_2!9590 lt!325315)))))

(declare-fun b!208724 () Bool)

(declare-fun res!175173 () Bool)

(assert (=> b!208724 (=> (not res!175173) (not e!142559))))

(assert (=> b!208724 (= res!175173 (isPrefixOf!0 (_1!9592 lt!326428) thiss!1204))))

(declare-fun d!70543 () Bool)

(assert (=> d!70543 e!142559))

(declare-fun res!175171 () Bool)

(assert (=> d!70543 (=> (not res!175171) (not e!142559))))

(assert (=> d!70543 (= res!175171 (isPrefixOf!0 (_1!9592 lt!326428) (_2!9592 lt!326428)))))

(declare-fun lt!326429 () BitStream!8296)

(assert (=> d!70543 (= lt!326428 (tuple2!17875 lt!326429 (_2!9590 lt!325315)))))

(declare-fun lt!326438 () Unit!14821)

(declare-fun lt!326424 () Unit!14821)

(assert (=> d!70543 (= lt!326438 lt!326424)))

(assert (=> d!70543 (isPrefixOf!0 lt!326429 (_2!9590 lt!325315))))

(assert (=> d!70543 (= lt!326424 (lemmaIsPrefixTransitive!0 lt!326429 (_2!9590 lt!325315) (_2!9590 lt!325315)))))

(declare-fun lt!326437 () Unit!14821)

(declare-fun lt!326425 () Unit!14821)

(assert (=> d!70543 (= lt!326437 lt!326425)))

(assert (=> d!70543 (isPrefixOf!0 lt!326429 (_2!9590 lt!325315))))

(assert (=> d!70543 (= lt!326425 (lemmaIsPrefixTransitive!0 lt!326429 thiss!1204 (_2!9590 lt!325315)))))

(declare-fun lt!326441 () Unit!14821)

(assert (=> d!70543 (= lt!326441 e!142560)))

(declare-fun c!10267 () Bool)

(assert (=> d!70543 (= c!10267 (not (= (size!4594 (buf!5102 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!326430 () Unit!14821)

(declare-fun lt!326427 () Unit!14821)

(assert (=> d!70543 (= lt!326430 lt!326427)))

(assert (=> d!70543 (isPrefixOf!0 (_2!9590 lt!325315) (_2!9590 lt!325315))))

(assert (=> d!70543 (= lt!326427 (lemmaIsPrefixRefl!0 (_2!9590 lt!325315)))))

(declare-fun lt!326440 () Unit!14821)

(declare-fun lt!326433 () Unit!14821)

(assert (=> d!70543 (= lt!326440 lt!326433)))

(assert (=> d!70543 (= lt!326433 (lemmaIsPrefixRefl!0 (_2!9590 lt!325315)))))

(declare-fun lt!326426 () Unit!14821)

(declare-fun lt!326435 () Unit!14821)

(assert (=> d!70543 (= lt!326426 lt!326435)))

(assert (=> d!70543 (isPrefixOf!0 lt!326429 lt!326429)))

(assert (=> d!70543 (= lt!326435 (lemmaIsPrefixRefl!0 lt!326429))))

(declare-fun lt!326439 () Unit!14821)

(declare-fun lt!326436 () Unit!14821)

(assert (=> d!70543 (= lt!326439 lt!326436)))

(assert (=> d!70543 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70543 (= lt!326436 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70543 (= lt!326429 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204)))))

(assert (=> d!70543 (isPrefixOf!0 thiss!1204 (_2!9590 lt!325315))))

(assert (=> d!70543 (= (reader!0 thiss!1204 (_2!9590 lt!325315)) lt!326428)))

(assert (= (and d!70543 c!10267) b!208721))

(assert (= (and d!70543 (not c!10267)) b!208722))

(assert (= (and d!70543 res!175171) b!208724))

(assert (= (and b!208724 res!175173) b!208723))

(assert (= (and b!208723 res!175172) b!208720))

(assert (=> d!70543 m!320447))

(declare-fun m!321195 () Bool)

(assert (=> d!70543 m!321195))

(declare-fun m!321197 () Bool)

(assert (=> d!70543 m!321197))

(declare-fun m!321199 () Bool)

(assert (=> d!70543 m!321199))

(declare-fun m!321201 () Bool)

(assert (=> d!70543 m!321201))

(declare-fun m!321203 () Bool)

(assert (=> d!70543 m!321203))

(declare-fun m!321205 () Bool)

(assert (=> d!70543 m!321205))

(declare-fun m!321207 () Bool)

(assert (=> d!70543 m!321207))

(declare-fun m!321209 () Bool)

(assert (=> d!70543 m!321209))

(declare-fun m!321211 () Bool)

(assert (=> d!70543 m!321211))

(declare-fun m!321213 () Bool)

(assert (=> d!70543 m!321213))

(declare-fun m!321215 () Bool)

(assert (=> b!208720 m!321215))

(assert (=> b!208720 m!320445))

(assert (=> b!208720 m!320393))

(declare-fun m!321217 () Bool)

(assert (=> b!208723 m!321217))

(assert (=> b!208721 m!320393))

(declare-fun m!321219 () Bool)

(assert (=> b!208721 m!321219))

(declare-fun m!321221 () Bool)

(assert (=> b!208721 m!321221))

(declare-fun m!321223 () Bool)

(assert (=> b!208724 m!321223))

(assert (=> b!208252 d!70543))

(declare-fun lt!326451 () (_ BitVec 64))

(declare-fun b!208725 () Bool)

(declare-fun e!142561 () Bool)

(declare-fun lt!326448 () tuple2!17874)

(declare-fun lt!326462 () (_ BitVec 64))

(assert (=> b!208725 (= e!142561 (= (_1!9592 lt!326448) (withMovedBitIndex!0 (_2!9592 lt!326448) (bvsub lt!326451 lt!326462))))))

(assert (=> b!208725 (or (= (bvand lt!326451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326462 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326451 lt!326462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208725 (= lt!326462 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325315))) (currentByte!9626 (_2!9590 lt!325315)) (currentBit!9621 (_2!9590 lt!325315))))))

(assert (=> b!208725 (= lt!326451 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(declare-fun b!208726 () Bool)

(declare-fun e!142562 () Unit!14821)

(declare-fun lt!326452 () Unit!14821)

(assert (=> b!208726 (= e!142562 lt!326452)))

(declare-fun lt!326443 () (_ BitVec 64))

(assert (=> b!208726 (= lt!326443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!326454 () (_ BitVec 64))

(assert (=> b!208726 (= lt!326454 (bitIndex!0 (size!4594 (buf!5102 (_2!9590 lt!325310))) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(assert (=> b!208726 (= lt!326452 (arrayBitRangesEqSymmetric!0 (buf!5102 (_2!9590 lt!325310)) (buf!5102 (_2!9590 lt!325315)) lt!326443 lt!326454))))

(assert (=> b!208726 (arrayBitRangesEq!0 (buf!5102 (_2!9590 lt!325315)) (buf!5102 (_2!9590 lt!325310)) lt!326443 lt!326454)))

(declare-fun b!208727 () Bool)

(declare-fun Unit!14863 () Unit!14821)

(assert (=> b!208727 (= e!142562 Unit!14863)))

(declare-fun b!208728 () Bool)

(declare-fun res!175175 () Bool)

(assert (=> b!208728 (=> (not res!175175) (not e!142561))))

(assert (=> b!208728 (= res!175175 (isPrefixOf!0 (_2!9592 lt!326448) (_2!9590 lt!325315)))))

(declare-fun b!208729 () Bool)

(declare-fun res!175176 () Bool)

(assert (=> b!208729 (=> (not res!175176) (not e!142561))))

(assert (=> b!208729 (= res!175176 (isPrefixOf!0 (_1!9592 lt!326448) (_2!9590 lt!325310)))))

(declare-fun d!70567 () Bool)

(assert (=> d!70567 e!142561))

(declare-fun res!175174 () Bool)

(assert (=> d!70567 (=> (not res!175174) (not e!142561))))

(assert (=> d!70567 (= res!175174 (isPrefixOf!0 (_1!9592 lt!326448) (_2!9592 lt!326448)))))

(declare-fun lt!326449 () BitStream!8296)

(assert (=> d!70567 (= lt!326448 (tuple2!17875 lt!326449 (_2!9590 lt!325315)))))

(declare-fun lt!326458 () Unit!14821)

(declare-fun lt!326444 () Unit!14821)

(assert (=> d!70567 (= lt!326458 lt!326444)))

(assert (=> d!70567 (isPrefixOf!0 lt!326449 (_2!9590 lt!325315))))

(assert (=> d!70567 (= lt!326444 (lemmaIsPrefixTransitive!0 lt!326449 (_2!9590 lt!325315) (_2!9590 lt!325315)))))

(declare-fun lt!326457 () Unit!14821)

(declare-fun lt!326445 () Unit!14821)

(assert (=> d!70567 (= lt!326457 lt!326445)))

(assert (=> d!70567 (isPrefixOf!0 lt!326449 (_2!9590 lt!325315))))

(assert (=> d!70567 (= lt!326445 (lemmaIsPrefixTransitive!0 lt!326449 (_2!9590 lt!325310) (_2!9590 lt!325315)))))

(declare-fun lt!326461 () Unit!14821)

(assert (=> d!70567 (= lt!326461 e!142562)))

(declare-fun c!10268 () Bool)

(assert (=> d!70567 (= c!10268 (not (= (size!4594 (buf!5102 (_2!9590 lt!325310))) #b00000000000000000000000000000000)))))

(declare-fun lt!326450 () Unit!14821)

(declare-fun lt!326447 () Unit!14821)

(assert (=> d!70567 (= lt!326450 lt!326447)))

(assert (=> d!70567 (isPrefixOf!0 (_2!9590 lt!325315) (_2!9590 lt!325315))))

(assert (=> d!70567 (= lt!326447 (lemmaIsPrefixRefl!0 (_2!9590 lt!325315)))))

(declare-fun lt!326460 () Unit!14821)

(declare-fun lt!326453 () Unit!14821)

(assert (=> d!70567 (= lt!326460 lt!326453)))

(assert (=> d!70567 (= lt!326453 (lemmaIsPrefixRefl!0 (_2!9590 lt!325315)))))

(declare-fun lt!326446 () Unit!14821)

(declare-fun lt!326455 () Unit!14821)

(assert (=> d!70567 (= lt!326446 lt!326455)))

(assert (=> d!70567 (isPrefixOf!0 lt!326449 lt!326449)))

(assert (=> d!70567 (= lt!326455 (lemmaIsPrefixRefl!0 lt!326449))))

(declare-fun lt!326459 () Unit!14821)

(declare-fun lt!326456 () Unit!14821)

(assert (=> d!70567 (= lt!326459 lt!326456)))

(assert (=> d!70567 (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!325310))))

(assert (=> d!70567 (= lt!326456 (lemmaIsPrefixRefl!0 (_2!9590 lt!325310)))))

(assert (=> d!70567 (= lt!326449 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 (_2!9590 lt!325310)) (currentBit!9621 (_2!9590 lt!325310))))))

(assert (=> d!70567 (isPrefixOf!0 (_2!9590 lt!325310) (_2!9590 lt!325315))))

(assert (=> d!70567 (= (reader!0 (_2!9590 lt!325310) (_2!9590 lt!325315)) lt!326448)))

(assert (= (and d!70567 c!10268) b!208726))

(assert (= (and d!70567 (not c!10268)) b!208727))

(assert (= (and d!70567 res!175174) b!208729))

(assert (= (and b!208729 res!175176) b!208728))

(assert (= (and b!208728 res!175175) b!208725))

(assert (=> d!70567 m!320387))

(declare-fun m!321225 () Bool)

(assert (=> d!70567 m!321225))

(declare-fun m!321227 () Bool)

(assert (=> d!70567 m!321227))

(assert (=> d!70567 m!320859))

(assert (=> d!70567 m!321201))

(declare-fun m!321229 () Bool)

(assert (=> d!70567 m!321229))

(declare-fun m!321231 () Bool)

(assert (=> d!70567 m!321231))

(declare-fun m!321233 () Bool)

(assert (=> d!70567 m!321233))

(declare-fun m!321235 () Bool)

(assert (=> d!70567 m!321235))

(assert (=> d!70567 m!321211))

(declare-fun m!321237 () Bool)

(assert (=> d!70567 m!321237))

(declare-fun m!321239 () Bool)

(assert (=> b!208725 m!321239))

(assert (=> b!208725 m!320445))

(assert (=> b!208725 m!320391))

(declare-fun m!321241 () Bool)

(assert (=> b!208728 m!321241))

(assert (=> b!208726 m!320391))

(declare-fun m!321243 () Bool)

(assert (=> b!208726 m!321243))

(declare-fun m!321245 () Bool)

(assert (=> b!208726 m!321245))

(declare-fun m!321247 () Bool)

(assert (=> b!208729 m!321247))

(assert (=> b!208252 d!70567))

(declare-fun d!70569 () Bool)

(assert (=> d!70569 (= (invariant!0 (currentBit!9621 thiss!1204) (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325310)))) (and (bvsge (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9621 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9626 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325310)))) (and (= (currentBit!9621 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9626 thiss!1204) (size!4594 (buf!5102 (_2!9590 lt!325310))))))))))

(assert (=> b!208252 d!70569))

(declare-fun d!70571 () Bool)

(declare-fun lt!326463 () tuple2!17898)

(assert (=> d!70571 (= lt!326463 (readBit!0 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))))))

(assert (=> d!70571 (= (readBitPure!0 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))) (tuple2!17873 (_2!9604 lt!326463) (_1!9604 lt!326463)))))

(declare-fun bs!17342 () Bool)

(assert (= bs!17342 d!70571))

(declare-fun m!321249 () Bool)

(assert (=> bs!17342 m!321249))

(assert (=> b!208252 d!70571))

(declare-fun d!70573 () Bool)

(assert (=> d!70573 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310))) lt!325296) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 (_2!9590 lt!325310))) ((_ sign_extend 32) (currentBit!9621 (_2!9590 lt!325310)))) lt!325296))))

(declare-fun bs!17343 () Bool)

(assert (= bs!17343 d!70573))

(declare-fun m!321251 () Bool)

(assert (=> bs!17343 m!321251))

(assert (=> b!208252 d!70573))

(declare-fun d!70575 () Bool)

(declare-fun lt!326464 () tuple2!17900)

(assert (=> d!70575 (= lt!326464 (readNBitsLSBFirstsLoop!0 (_1!9592 lt!325293) nBits!348 i!590 lt!325299))))

(assert (=> d!70575 (= (readNBitsLSBFirstsLoopPure!0 (_1!9592 lt!325293) nBits!348 i!590 lt!325299) (tuple2!17877 (_2!9605 lt!326464) (_1!9605 lt!326464)))))

(declare-fun bs!17344 () Bool)

(assert (= bs!17344 d!70575))

(declare-fun m!321253 () Bool)

(assert (=> bs!17344 m!321253))

(assert (=> b!208252 d!70575))

(declare-fun d!70577 () Bool)

(assert (=> d!70577 (validate_offset_bits!1 ((_ sign_extend 32) (size!4594 (buf!5102 (_2!9590 lt!325315)))) ((_ sign_extend 32) (currentByte!9626 thiss!1204)) ((_ sign_extend 32) (currentBit!9621 thiss!1204)) lt!325294)))

(declare-fun lt!326465 () Unit!14821)

(assert (=> d!70577 (= lt!326465 (choose!9 thiss!1204 (buf!5102 (_2!9590 lt!325315)) lt!325294 (BitStream!8297 (buf!5102 (_2!9590 lt!325315)) (currentByte!9626 thiss!1204) (currentBit!9621 thiss!1204))))))

(assert (=> d!70577 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5102 (_2!9590 lt!325315)) lt!325294) lt!326465)))

(declare-fun bs!17345 () Bool)

(assert (= bs!17345 d!70577))

(assert (=> bs!17345 m!320415))

(declare-fun m!321255 () Bool)

(assert (=> bs!17345 m!321255))

(assert (=> b!208252 d!70577))

(declare-fun d!70579 () Bool)

(declare-fun e!142563 () Bool)

(assert (=> d!70579 e!142563))

(declare-fun res!175177 () Bool)

(assert (=> d!70579 (=> (not res!175177) (not e!142563))))

(declare-fun lt!326469 () (_ BitVec 64))

(declare-fun lt!326470 () (_ BitVec 64))

(declare-fun lt!326471 () (_ BitVec 64))

(assert (=> d!70579 (= res!175177 (= lt!326469 (bvsub lt!326470 lt!326471)))))

(assert (=> d!70579 (or (= (bvand lt!326470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326470 lt!326471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70579 (= lt!326471 (remainingBits!0 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325295)))) ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325295))) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325295)))))))

(declare-fun lt!326467 () (_ BitVec 64))

(declare-fun lt!326468 () (_ BitVec 64))

(assert (=> d!70579 (= lt!326470 (bvmul lt!326467 lt!326468))))

(assert (=> d!70579 (or (= lt!326467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326468 (bvsdiv (bvmul lt!326467 lt!326468) lt!326467)))))

(assert (=> d!70579 (= lt!326468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70579 (= lt!326467 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325295)))))))

(assert (=> d!70579 (= lt!326469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9626 (_1!9591 lt!325295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9621 (_1!9591 lt!325295)))))))

(assert (=> d!70579 (invariant!0 (currentBit!9621 (_1!9591 lt!325295)) (currentByte!9626 (_1!9591 lt!325295)) (size!4594 (buf!5102 (_1!9591 lt!325295))))))

(assert (=> d!70579 (= (bitIndex!0 (size!4594 (buf!5102 (_1!9591 lt!325295))) (currentByte!9626 (_1!9591 lt!325295)) (currentBit!9621 (_1!9591 lt!325295))) lt!326469)))

(declare-fun b!208730 () Bool)

(declare-fun res!175178 () Bool)

(assert (=> b!208730 (=> (not res!175178) (not e!142563))))

(assert (=> b!208730 (= res!175178 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326469))))

(declare-fun b!208731 () Bool)

(declare-fun lt!326466 () (_ BitVec 64))

(assert (=> b!208731 (= e!142563 (bvsle lt!326469 (bvmul lt!326466 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!208731 (or (= lt!326466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326466 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326466)))))

(assert (=> b!208731 (= lt!326466 ((_ sign_extend 32) (size!4594 (buf!5102 (_1!9591 lt!325295)))))))

(assert (= (and d!70579 res!175177) b!208730))

(assert (= (and b!208730 res!175178) b!208731))

(declare-fun m!321257 () Bool)

(assert (=> d!70579 m!321257))

(declare-fun m!321259 () Bool)

(assert (=> d!70579 m!321259))

(assert (=> b!208252 d!70579))

(push 1)

(assert (not b!208729))

(assert (not b!208728))

(assert (not d!70531))

(assert (not b!208645))

(assert (not b!208620))

(assert (not d!70489))

(assert (not b!208650))

(assert (not d!70473))

(assert (not d!70575))

(assert (not b!208647))

(assert (not b!208610))

(assert (not b!208618))

(assert (not b!208726))

(assert (not d!70579))

(assert (not d!70533))

(assert (not b!208625))

(assert (not d!70443))

(assert (not d!70571))

(assert (not d!70543))

(assert (not b!208472))

(assert (not bm!3284))

(assert (not b!208614))

(assert (not d!70525))

(assert (not b!208673))

(assert (not d!70485))

(assert (not d!70441))

(assert (not b!208671))

(assert (not d!70437))

(assert (not d!70495))

(assert (not b!208672))

(assert (not b!208723))

(assert (not b!208621))

(assert (not b!208474))

(assert (not d!70483))

(assert (not d!70567))

(assert (not d!70577))

(assert (not d!70475))

(assert (not d!70573))

(assert (not d!70529))

(assert (not b!208611))

(assert (not b!208724))

(assert (not d!70541))

(assert (not d!70491))

(assert (not b!208626))

(assert (not b!208725))

(assert (not d!70435))

(assert (not b!208674))

(assert (not b!208613))

(assert (not b!208720))

(assert (not d!70527))

(assert (not d!70535))

(assert (not d!70493))

(assert (not b!208628))

(assert (not b!208619))

(assert (not b!208721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

