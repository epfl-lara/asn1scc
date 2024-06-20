; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20370 () Bool)

(assert start!20370)

(declare-fun b!102648 () Bool)

(declare-datatypes ((array!4814 0))(
  ( (array!4815 (arr!2791 (Array (_ BitVec 32) (_ BitVec 8))) (size!2198 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3870 0))(
  ( (BitStream!3871 (buf!2558 array!4814) (currentByte!5031 (_ BitVec 32)) (currentBit!5026 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8406 0))(
  ( (tuple2!8407 (_1!4458 BitStream!3870) (_2!4458 BitStream!3870)) )
))
(declare-fun lt!149300 () tuple2!8406)

(declare-fun e!67191 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102648 (= e!67191 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4458 lt!149300)))) ((_ sign_extend 32) (currentByte!5031 (_1!4458 lt!149300))) ((_ sign_extend 32) (currentBit!5026 (_1!4458 lt!149300))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102649 () Bool)

(declare-fun e!67197 () Bool)

(declare-datatypes ((tuple2!8408 0))(
  ( (tuple2!8409 (_1!4459 BitStream!3870) (_2!4459 Bool)) )
))
(declare-fun lt!149312 () tuple2!8408)

(declare-fun lt!149307 () tuple2!8408)

(assert (=> b!102649 (= e!67197 (= (_2!4459 lt!149312) (_2!4459 lt!149307)))))

(declare-fun b!102650 () Bool)

(declare-fun e!67192 () Bool)

(declare-fun e!67189 () Bool)

(assert (=> b!102650 (= e!67192 e!67189)))

(declare-fun res!84423 () Bool)

(assert (=> b!102650 (=> (not res!84423) (not e!67189))))

(declare-fun thiss!1305 () BitStream!3870)

(declare-fun lt!149314 () (_ BitVec 64))

(assert (=> b!102650 (= res!84423 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)) lt!149314))))

(assert (=> b!102650 (= lt!149314 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102651 () Bool)

(declare-fun res!84428 () Bool)

(declare-fun e!67196 () Bool)

(assert (=> b!102651 (=> (not res!84428) (not e!67196))))

(declare-datatypes ((Unit!6292 0))(
  ( (Unit!6293) )
))
(declare-datatypes ((tuple2!8410 0))(
  ( (tuple2!8411 (_1!4460 Unit!6292) (_2!4460 BitStream!3870)) )
))
(declare-fun lt!149299 () tuple2!8410)

(declare-fun isPrefixOf!0 (BitStream!3870 BitStream!3870) Bool)

(assert (=> b!102651 (= res!84428 (isPrefixOf!0 thiss!1305 (_2!4460 lt!149299)))))

(declare-fun b!102652 () Bool)

(declare-fun res!84431 () Bool)

(assert (=> b!102652 (=> (not res!84431) (not e!67189))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102652 (= res!84431 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102653 () Bool)

(assert (=> b!102653 (= e!67189 (not e!67191))))

(declare-fun res!84425 () Bool)

(assert (=> b!102653 (=> res!84425 e!67191)))

(assert (=> b!102653 (= res!84425 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!149306 () tuple2!8410)

(declare-fun lt!149301 () (_ BitVec 64))

(assert (=> b!102653 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149301)))

(declare-fun lt!149309 () Unit!6292)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3870 array!4814 (_ BitVec 64)) Unit!6292)

(assert (=> b!102653 (= lt!149309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4460 lt!149299) (buf!2558 (_2!4460 lt!149306)) lt!149301))))

(assert (=> b!102653 (= lt!149301 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8412 0))(
  ( (tuple2!8413 (_1!4461 BitStream!3870) (_2!4461 (_ BitVec 64))) )
))
(declare-fun lt!149313 () tuple2!8412)

(declare-fun lt!149302 () tuple2!8406)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8412)

(assert (=> b!102653 (= lt!149313 (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149302) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!102653 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)) lt!149314)))

(declare-fun lt!149311 () Unit!6292)

(assert (=> b!102653 (= lt!149311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2558 (_2!4460 lt!149306)) lt!149314))))

(declare-fun lt!149298 () Bool)

(declare-fun readBitPure!0 (BitStream!3870) tuple2!8408)

(assert (=> b!102653 (= (_2!4459 (readBitPure!0 (_1!4458 lt!149302))) lt!149298)))

(declare-fun reader!0 (BitStream!3870 BitStream!3870) tuple2!8406)

(assert (=> b!102653 (= lt!149300 (reader!0 (_2!4460 lt!149299) (_2!4460 lt!149306)))))

(assert (=> b!102653 (= lt!149302 (reader!0 thiss!1305 (_2!4460 lt!149306)))))

(assert (=> b!102653 e!67197))

(declare-fun res!84432 () Bool)

(assert (=> b!102653 (=> (not res!84432) (not e!67197))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102653 (= res!84432 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149312))) (currentByte!5031 (_1!4459 lt!149312)) (currentBit!5026 (_1!4459 lt!149312))) (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149307))) (currentByte!5031 (_1!4459 lt!149307)) (currentBit!5026 (_1!4459 lt!149307)))))))

(declare-fun lt!149304 () Unit!6292)

(declare-fun lt!149305 () BitStream!3870)

(declare-fun readBitPrefixLemma!0 (BitStream!3870 BitStream!3870) Unit!6292)

(assert (=> b!102653 (= lt!149304 (readBitPrefixLemma!0 lt!149305 (_2!4460 lt!149306)))))

(assert (=> b!102653 (= lt!149307 (readBitPure!0 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))))))

(assert (=> b!102653 (= lt!149312 (readBitPure!0 lt!149305))))

(assert (=> b!102653 (= lt!149305 (BitStream!3871 (buf!2558 (_2!4460 lt!149299)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun e!67188 () Bool)

(assert (=> b!102653 e!67188))

(declare-fun res!84433 () Bool)

(assert (=> b!102653 (=> (not res!84433) (not e!67188))))

(assert (=> b!102653 (= res!84433 (isPrefixOf!0 thiss!1305 (_2!4460 lt!149306)))))

(declare-fun lt!149308 () Unit!6292)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3870 BitStream!3870 BitStream!3870) Unit!6292)

(assert (=> b!102653 (= lt!149308 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4460 lt!149299) (_2!4460 lt!149306)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3870 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8410)

(assert (=> b!102653 (= lt!149306 (appendNLeastSignificantBitsLoop!0 (_2!4460 lt!149299) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67193 () Bool)

(assert (=> b!102653 e!67193))

(declare-fun res!84427 () Bool)

(assert (=> b!102653 (=> (not res!84427) (not e!67193))))

(assert (=> b!102653 (= res!84427 (= (size!2198 (buf!2558 thiss!1305)) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(declare-fun appendBit!0 (BitStream!3870 Bool) tuple2!8410)

(assert (=> b!102653 (= lt!149299 (appendBit!0 thiss!1305 lt!149298))))

(assert (=> b!102653 (= lt!149298 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102654 () Bool)

(declare-fun e!67195 () Bool)

(assert (=> b!102654 (= e!67196 e!67195)))

(declare-fun res!84429 () Bool)

(assert (=> b!102654 (=> (not res!84429) (not e!67195))))

(declare-fun lt!149303 () tuple2!8408)

(assert (=> b!102654 (= res!84429 (and (= (_2!4459 lt!149303) lt!149298) (= (_1!4459 lt!149303) (_2!4460 lt!149299))))))

(declare-fun readerFrom!0 (BitStream!3870 (_ BitVec 32) (_ BitVec 32)) BitStream!3870)

(assert (=> b!102654 (= lt!149303 (readBitPure!0 (readerFrom!0 (_2!4460 lt!149299) (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305))))))

(declare-fun b!102655 () Bool)

(assert (=> b!102655 (= e!67193 e!67196)))

(declare-fun res!84434 () Bool)

(assert (=> b!102655 (=> (not res!84434) (not e!67196))))

(declare-fun lt!149310 () (_ BitVec 64))

(declare-fun lt!149297 () (_ BitVec 64))

(assert (=> b!102655 (= res!84434 (= lt!149310 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149297)))))

(assert (=> b!102655 (= lt!149310 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(assert (=> b!102655 (= lt!149297 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun b!102656 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102656 (= e!67188 (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149306)))))))

(declare-fun b!102657 () Bool)

(declare-fun e!67190 () Bool)

(declare-fun array_inv!2000 (array!4814) Bool)

(assert (=> b!102657 (= e!67190 (array_inv!2000 (buf!2558 thiss!1305)))))

(declare-fun res!84426 () Bool)

(assert (=> start!20370 (=> (not res!84426) (not e!67192))))

(assert (=> start!20370 (= res!84426 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20370 e!67192))

(assert (=> start!20370 true))

(declare-fun inv!12 (BitStream!3870) Bool)

(assert (=> start!20370 (and (inv!12 thiss!1305) e!67190)))

(declare-fun b!102647 () Bool)

(declare-fun res!84424 () Bool)

(assert (=> b!102647 (=> (not res!84424) (not e!67188))))

(assert (=> b!102647 (= res!84424 (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(declare-fun b!102658 () Bool)

(declare-fun res!84430 () Bool)

(assert (=> b!102658 (=> (not res!84430) (not e!67189))))

(assert (=> b!102658 (= res!84430 (bvslt i!615 nBits!396))))

(declare-fun b!102659 () Bool)

(assert (=> b!102659 (= e!67195 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149303))) (currentByte!5031 (_1!4459 lt!149303)) (currentBit!5026 (_1!4459 lt!149303))) lt!149310))))

(assert (= (and start!20370 res!84426) b!102650))

(assert (= (and b!102650 res!84423) b!102652))

(assert (= (and b!102652 res!84431) b!102658))

(assert (= (and b!102658 res!84430) b!102653))

(assert (= (and b!102653 res!84427) b!102655))

(assert (= (and b!102655 res!84434) b!102651))

(assert (= (and b!102651 res!84428) b!102654))

(assert (= (and b!102654 res!84429) b!102659))

(assert (= (and b!102653 res!84433) b!102647))

(assert (= (and b!102647 res!84424) b!102656))

(assert (= (and b!102653 res!84432) b!102649))

(assert (= (and b!102653 (not res!84425)) b!102648))

(assert (= start!20370 b!102657))

(declare-fun m!149517 () Bool)

(assert (=> b!102652 m!149517))

(declare-fun m!149519 () Bool)

(assert (=> b!102657 m!149519))

(declare-fun m!149521 () Bool)

(assert (=> b!102659 m!149521))

(declare-fun m!149523 () Bool)

(assert (=> b!102648 m!149523))

(declare-fun m!149525 () Bool)

(assert (=> b!102656 m!149525))

(declare-fun m!149527 () Bool)

(assert (=> b!102653 m!149527))

(declare-fun m!149529 () Bool)

(assert (=> b!102653 m!149529))

(declare-fun m!149531 () Bool)

(assert (=> b!102653 m!149531))

(declare-fun m!149533 () Bool)

(assert (=> b!102653 m!149533))

(declare-fun m!149535 () Bool)

(assert (=> b!102653 m!149535))

(declare-fun m!149537 () Bool)

(assert (=> b!102653 m!149537))

(declare-fun m!149539 () Bool)

(assert (=> b!102653 m!149539))

(declare-fun m!149541 () Bool)

(assert (=> b!102653 m!149541))

(declare-fun m!149543 () Bool)

(assert (=> b!102653 m!149543))

(declare-fun m!149545 () Bool)

(assert (=> b!102653 m!149545))

(declare-fun m!149547 () Bool)

(assert (=> b!102653 m!149547))

(declare-fun m!149549 () Bool)

(assert (=> b!102653 m!149549))

(declare-fun m!149551 () Bool)

(assert (=> b!102653 m!149551))

(declare-fun m!149553 () Bool)

(assert (=> b!102653 m!149553))

(declare-fun m!149555 () Bool)

(assert (=> b!102653 m!149555))

(declare-fun m!149557 () Bool)

(assert (=> b!102653 m!149557))

(declare-fun m!149559 () Bool)

(assert (=> b!102653 m!149559))

(declare-fun m!149561 () Bool)

(assert (=> b!102653 m!149561))

(declare-fun m!149563 () Bool)

(assert (=> b!102654 m!149563))

(assert (=> b!102654 m!149563))

(declare-fun m!149565 () Bool)

(assert (=> b!102654 m!149565))

(declare-fun m!149567 () Bool)

(assert (=> start!20370 m!149567))

(declare-fun m!149569 () Bool)

(assert (=> b!102655 m!149569))

(declare-fun m!149571 () Bool)

(assert (=> b!102655 m!149571))

(declare-fun m!149573 () Bool)

(assert (=> b!102650 m!149573))

(declare-fun m!149575 () Bool)

(assert (=> b!102647 m!149575))

(declare-fun m!149577 () Bool)

(assert (=> b!102651 m!149577))

(check-sat (not b!102650) (not b!102652) (not b!102657) (not b!102656) (not b!102655) (not b!102654) (not b!102651) (not b!102659) (not b!102647) (not start!20370) (not b!102653) (not b!102648))
(check-sat)
(get-model)

(declare-fun d!31852 () Bool)

(declare-fun e!67230 () Bool)

(assert (=> d!31852 e!67230))

(declare-fun res!84475 () Bool)

(assert (=> d!31852 (=> (not res!84475) (not e!67230))))

(declare-fun lt!149383 () (_ BitVec 64))

(declare-fun lt!149385 () (_ BitVec 64))

(declare-fun lt!149382 () (_ BitVec 64))

(assert (=> d!31852 (= res!84475 (= lt!149385 (bvsub lt!149382 lt!149383)))))

(assert (=> d!31852 (or (= (bvand lt!149382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149382 lt!149383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31852 (= lt!149383 (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149303)))) ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149303))) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149303)))))))

(declare-fun lt!149381 () (_ BitVec 64))

(declare-fun lt!149386 () (_ BitVec 64))

(assert (=> d!31852 (= lt!149382 (bvmul lt!149381 lt!149386))))

(assert (=> d!31852 (or (= lt!149381 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!149386 (bvsdiv (bvmul lt!149381 lt!149386) lt!149381)))))

(assert (=> d!31852 (= lt!149386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31852 (= lt!149381 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149303)))))))

(assert (=> d!31852 (= lt!149385 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149303)))))))

(assert (=> d!31852 (invariant!0 (currentBit!5026 (_1!4459 lt!149303)) (currentByte!5031 (_1!4459 lt!149303)) (size!2198 (buf!2558 (_1!4459 lt!149303))))))

(assert (=> d!31852 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149303))) (currentByte!5031 (_1!4459 lt!149303)) (currentBit!5026 (_1!4459 lt!149303))) lt!149385)))

(declare-fun b!102703 () Bool)

(declare-fun res!84476 () Bool)

(assert (=> b!102703 (=> (not res!84476) (not e!67230))))

(assert (=> b!102703 (= res!84476 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!149385))))

(declare-fun b!102704 () Bool)

(declare-fun lt!149384 () (_ BitVec 64))

(assert (=> b!102704 (= e!67230 (bvsle lt!149385 (bvmul lt!149384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102704 (or (= lt!149384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!149384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!149384)))))

(assert (=> b!102704 (= lt!149384 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149303)))))))

(assert (= (and d!31852 res!84475) b!102703))

(assert (= (and b!102703 res!84476) b!102704))

(declare-fun m!149641 () Bool)

(assert (=> d!31852 m!149641))

(declare-fun m!149643 () Bool)

(assert (=> d!31852 m!149643))

(assert (=> b!102659 d!31852))

(declare-fun d!31854 () Bool)

(assert (=> d!31854 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 thiss!1305))))))

(declare-fun bs!7816 () Bool)

(assert (= bs!7816 d!31854))

(declare-fun m!149645 () Bool)

(assert (=> bs!7816 m!149645))

(assert (=> start!20370 d!31854))

(declare-fun d!31856 () Bool)

(assert (=> d!31856 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4458 lt!149300)))) ((_ sign_extend 32) (currentByte!5031 (_1!4458 lt!149300))) ((_ sign_extend 32) (currentBit!5026 (_1!4458 lt!149300))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4458 lt!149300)))) ((_ sign_extend 32) (currentByte!5031 (_1!4458 lt!149300))) ((_ sign_extend 32) (currentBit!5026 (_1!4458 lt!149300)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7817 () Bool)

(assert (= bs!7817 d!31856))

(declare-fun m!149647 () Bool)

(assert (=> bs!7817 m!149647))

(assert (=> b!102648 d!31856))

(declare-fun d!31858 () Bool)

(assert (=> d!31858 (= (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149306)))) (and (bvsge (currentBit!5026 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5026 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5031 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149306)))) (and (= (currentBit!5026 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149306))))))))))

(assert (=> b!102656 d!31858))

(declare-fun d!31860 () Bool)

(assert (=> d!31860 (= (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149299)))) (and (bvsge (currentBit!5026 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5026 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5031 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149299)))) (and (= (currentBit!5026 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149299))))))))))

(assert (=> b!102647 d!31860))

(declare-fun d!31862 () Bool)

(assert (=> d!31862 (= (array_inv!2000 (buf!2558 thiss!1305)) (bvsge (size!2198 (buf!2558 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!102657 d!31862))

(declare-fun d!31864 () Bool)

(declare-datatypes ((tuple2!8426 0))(
  ( (tuple2!8427 (_1!4468 (_ BitVec 64)) (_2!4468 BitStream!3870)) )
))
(declare-fun lt!149389 () tuple2!8426)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8426)

(assert (=> d!31864 (= lt!149389 (readNLeastSignificantBitsLoop!0 (_1!4458 lt!149302) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!31864 (= (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149302) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!8413 (_2!4468 lt!149389) (_1!4468 lt!149389)))))

(declare-fun bs!7818 () Bool)

(assert (= bs!7818 d!31864))

(declare-fun m!149649 () Bool)

(assert (=> bs!7818 m!149649))

(assert (=> b!102653 d!31864))

(declare-fun b!102715 () Bool)

(declare-fun e!67235 () Unit!6292)

(declare-fun lt!149449 () Unit!6292)

(assert (=> b!102715 (= e!67235 lt!149449)))

(declare-fun lt!149431 () (_ BitVec 64))

(assert (=> b!102715 (= lt!149431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!149446 () (_ BitVec 64))

(assert (=> b!102715 (= lt!149446 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4814 array!4814 (_ BitVec 64) (_ BitVec 64)) Unit!6292)

(assert (=> b!102715 (= lt!149449 (arrayBitRangesEqSymmetric!0 (buf!2558 thiss!1305) (buf!2558 (_2!4460 lt!149306)) lt!149431 lt!149446))))

(declare-fun arrayBitRangesEq!0 (array!4814 array!4814 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102715 (arrayBitRangesEq!0 (buf!2558 (_2!4460 lt!149306)) (buf!2558 thiss!1305) lt!149431 lt!149446)))

(declare-fun b!102716 () Bool)

(declare-fun res!84484 () Bool)

(declare-fun e!67236 () Bool)

(assert (=> b!102716 (=> (not res!84484) (not e!67236))))

(declare-fun lt!149430 () tuple2!8406)

(assert (=> b!102716 (= res!84484 (isPrefixOf!0 (_2!4458 lt!149430) (_2!4460 lt!149306)))))

(declare-fun b!102717 () Bool)

(declare-fun lt!149448 () (_ BitVec 64))

(declare-fun lt!149444 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3870 (_ BitVec 64)) BitStream!3870)

(assert (=> b!102717 (= e!67236 (= (_1!4458 lt!149430) (withMovedBitIndex!0 (_2!4458 lt!149430) (bvsub lt!149448 lt!149444))))))

(assert (=> b!102717 (or (= (bvand lt!149448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!149448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!149448 lt!149444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102717 (= lt!149444 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149306))) (currentByte!5031 (_2!4460 lt!149306)) (currentBit!5026 (_2!4460 lt!149306))))))

(assert (=> b!102717 (= lt!149448 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun b!102718 () Bool)

(declare-fun res!84483 () Bool)

(assert (=> b!102718 (=> (not res!84483) (not e!67236))))

(assert (=> b!102718 (= res!84483 (isPrefixOf!0 (_1!4458 lt!149430) thiss!1305))))

(declare-fun d!31866 () Bool)

(assert (=> d!31866 e!67236))

(declare-fun res!84485 () Bool)

(assert (=> d!31866 (=> (not res!84485) (not e!67236))))

(assert (=> d!31866 (= res!84485 (isPrefixOf!0 (_1!4458 lt!149430) (_2!4458 lt!149430)))))

(declare-fun lt!149436 () BitStream!3870)

(assert (=> d!31866 (= lt!149430 (tuple2!8407 lt!149436 (_2!4460 lt!149306)))))

(declare-fun lt!149442 () Unit!6292)

(declare-fun lt!149441 () Unit!6292)

(assert (=> d!31866 (= lt!149442 lt!149441)))

(assert (=> d!31866 (isPrefixOf!0 lt!149436 (_2!4460 lt!149306))))

(assert (=> d!31866 (= lt!149441 (lemmaIsPrefixTransitive!0 lt!149436 (_2!4460 lt!149306) (_2!4460 lt!149306)))))

(declare-fun lt!149435 () Unit!6292)

(declare-fun lt!149433 () Unit!6292)

(assert (=> d!31866 (= lt!149435 lt!149433)))

(assert (=> d!31866 (isPrefixOf!0 lt!149436 (_2!4460 lt!149306))))

(assert (=> d!31866 (= lt!149433 (lemmaIsPrefixTransitive!0 lt!149436 thiss!1305 (_2!4460 lt!149306)))))

(declare-fun lt!149440 () Unit!6292)

(assert (=> d!31866 (= lt!149440 e!67235)))

(declare-fun c!6359 () Bool)

(assert (=> d!31866 (= c!6359 (not (= (size!2198 (buf!2558 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!149439 () Unit!6292)

(declare-fun lt!149438 () Unit!6292)

(assert (=> d!31866 (= lt!149439 lt!149438)))

(assert (=> d!31866 (isPrefixOf!0 (_2!4460 lt!149306) (_2!4460 lt!149306))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3870) Unit!6292)

(assert (=> d!31866 (= lt!149438 (lemmaIsPrefixRefl!0 (_2!4460 lt!149306)))))

(declare-fun lt!149445 () Unit!6292)

(declare-fun lt!149443 () Unit!6292)

(assert (=> d!31866 (= lt!149445 lt!149443)))

(assert (=> d!31866 (= lt!149443 (lemmaIsPrefixRefl!0 (_2!4460 lt!149306)))))

(declare-fun lt!149434 () Unit!6292)

(declare-fun lt!149432 () Unit!6292)

(assert (=> d!31866 (= lt!149434 lt!149432)))

(assert (=> d!31866 (isPrefixOf!0 lt!149436 lt!149436)))

(assert (=> d!31866 (= lt!149432 (lemmaIsPrefixRefl!0 lt!149436))))

(declare-fun lt!149447 () Unit!6292)

(declare-fun lt!149437 () Unit!6292)

(assert (=> d!31866 (= lt!149447 lt!149437)))

(assert (=> d!31866 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31866 (= lt!149437 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31866 (= lt!149436 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(assert (=> d!31866 (isPrefixOf!0 thiss!1305 (_2!4460 lt!149306))))

(assert (=> d!31866 (= (reader!0 thiss!1305 (_2!4460 lt!149306)) lt!149430)))

(declare-fun b!102719 () Bool)

(declare-fun Unit!6298 () Unit!6292)

(assert (=> b!102719 (= e!67235 Unit!6298)))

(assert (= (and d!31866 c!6359) b!102715))

(assert (= (and d!31866 (not c!6359)) b!102719))

(assert (= (and d!31866 res!84485) b!102718))

(assert (= (and b!102718 res!84483) b!102716))

(assert (= (and b!102716 res!84484) b!102717))

(declare-fun m!149651 () Bool)

(assert (=> d!31866 m!149651))

(declare-fun m!149653 () Bool)

(assert (=> d!31866 m!149653))

(declare-fun m!149655 () Bool)

(assert (=> d!31866 m!149655))

(assert (=> d!31866 m!149545))

(declare-fun m!149657 () Bool)

(assert (=> d!31866 m!149657))

(declare-fun m!149659 () Bool)

(assert (=> d!31866 m!149659))

(declare-fun m!149661 () Bool)

(assert (=> d!31866 m!149661))

(declare-fun m!149663 () Bool)

(assert (=> d!31866 m!149663))

(declare-fun m!149665 () Bool)

(assert (=> d!31866 m!149665))

(declare-fun m!149667 () Bool)

(assert (=> d!31866 m!149667))

(declare-fun m!149669 () Bool)

(assert (=> d!31866 m!149669))

(declare-fun m!149671 () Bool)

(assert (=> b!102718 m!149671))

(declare-fun m!149673 () Bool)

(assert (=> b!102717 m!149673))

(declare-fun m!149675 () Bool)

(assert (=> b!102717 m!149675))

(assert (=> b!102717 m!149571))

(declare-fun m!149677 () Bool)

(assert (=> b!102716 m!149677))

(assert (=> b!102715 m!149571))

(declare-fun m!149679 () Bool)

(assert (=> b!102715 m!149679))

(declare-fun m!149681 () Bool)

(assert (=> b!102715 m!149681))

(assert (=> b!102653 d!31866))

(declare-fun d!31868 () Bool)

(declare-datatypes ((tuple2!8428 0))(
  ( (tuple2!8429 (_1!4469 Bool) (_2!4469 BitStream!3870)) )
))
(declare-fun lt!149452 () tuple2!8428)

(declare-fun readBit!0 (BitStream!3870) tuple2!8428)

(assert (=> d!31868 (= lt!149452 (readBit!0 (_1!4458 lt!149302)))))

(assert (=> d!31868 (= (readBitPure!0 (_1!4458 lt!149302)) (tuple2!8409 (_2!4469 lt!149452) (_1!4469 lt!149452)))))

(declare-fun bs!7819 () Bool)

(assert (= bs!7819 d!31868))

(declare-fun m!149683 () Bool)

(assert (=> bs!7819 m!149683))

(assert (=> b!102653 d!31868))

(declare-fun d!31870 () Bool)

(assert (=> d!31870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149301) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299)))) lt!149301))))

(declare-fun bs!7820 () Bool)

(assert (= bs!7820 d!31870))

(declare-fun m!149685 () Bool)

(assert (=> bs!7820 m!149685))

(assert (=> b!102653 d!31870))

(declare-fun d!31872 () Bool)

(assert (=> d!31872 (isPrefixOf!0 thiss!1305 (_2!4460 lt!149306))))

(declare-fun lt!149455 () Unit!6292)

(declare-fun choose!30 (BitStream!3870 BitStream!3870 BitStream!3870) Unit!6292)

(assert (=> d!31872 (= lt!149455 (choose!30 thiss!1305 (_2!4460 lt!149299) (_2!4460 lt!149306)))))

(assert (=> d!31872 (isPrefixOf!0 thiss!1305 (_2!4460 lt!149299))))

(assert (=> d!31872 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4460 lt!149299) (_2!4460 lt!149306)) lt!149455)))

(declare-fun bs!7822 () Bool)

(assert (= bs!7822 d!31872))

(assert (=> bs!7822 m!149545))

(declare-fun m!149689 () Bool)

(assert (=> bs!7822 m!149689))

(assert (=> bs!7822 m!149577))

(assert (=> b!102653 d!31872))

(declare-fun b!102856 () Bool)

(declare-fun lt!149888 () tuple2!8408)

(declare-fun lt!149851 () tuple2!8410)

(assert (=> b!102856 (= lt!149888 (readBitPure!0 (readerFrom!0 (_2!4460 lt!149851) (currentBit!5026 (_2!4460 lt!149299)) (currentByte!5031 (_2!4460 lt!149299)))))))

(declare-fun lt!149885 () Bool)

(declare-fun res!84598 () Bool)

(assert (=> b!102856 (= res!84598 (and (= (_2!4459 lt!149888) lt!149885) (= (_1!4459 lt!149888) (_2!4460 lt!149851))))))

(declare-fun e!67318 () Bool)

(assert (=> b!102856 (=> (not res!84598) (not e!67318))))

(declare-fun e!67316 () Bool)

(assert (=> b!102856 (= e!67316 e!67318)))

(declare-fun b!102857 () Bool)

(declare-fun e!67320 () tuple2!8410)

(declare-fun lt!149858 () Unit!6292)

(assert (=> b!102857 (= e!67320 (tuple2!8411 lt!149858 (_2!4460 lt!149299)))))

(declare-fun lt!149862 () BitStream!3870)

(assert (=> b!102857 (= lt!149862 (_2!4460 lt!149299))))

(assert (=> b!102857 (= lt!149858 (lemmaIsPrefixRefl!0 lt!149862))))

(declare-fun call!1279 () Bool)

(assert (=> b!102857 call!1279))

(declare-fun b!102858 () Bool)

(declare-fun res!84605 () Bool)

(declare-fun e!67319 () Bool)

(assert (=> b!102858 (=> (not res!84605) (not e!67319))))

(declare-fun lt!149865 () (_ BitVec 64))

(declare-fun lt!149850 () (_ BitVec 64))

(declare-fun lt!149867 () tuple2!8410)

(assert (=> b!102858 (= res!84605 (= (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149867))) (currentByte!5031 (_2!4460 lt!149867)) (currentBit!5026 (_2!4460 lt!149867))) (bvadd lt!149865 lt!149850)))))

(assert (=> b!102858 (or (not (= (bvand lt!149865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!149850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!149865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!149865 lt!149850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102858 (= lt!149850 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102858 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102858 (= lt!149865 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(declare-fun b!102859 () Bool)

(declare-fun e!67314 () Bool)

(declare-fun lt!149855 () (_ BitVec 64))

(assert (=> b!102859 (= e!67314 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149299)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149855))))

(declare-fun b!102860 () Bool)

(declare-fun res!84601 () Bool)

(assert (=> b!102860 (=> (not res!84601) (not e!67319))))

(assert (=> b!102860 (= res!84601 (isPrefixOf!0 (_2!4460 lt!149299) (_2!4460 lt!149867)))))

(declare-fun b!102861 () Bool)

(assert (=> b!102861 (= e!67318 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149888))) (currentByte!5031 (_1!4459 lt!149888)) (currentBit!5026 (_1!4459 lt!149888))) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149851))) (currentByte!5031 (_2!4460 lt!149851)) (currentBit!5026 (_2!4460 lt!149851)))))))

(declare-fun lt!149886 () tuple2!8406)

(declare-fun b!102862 () Bool)

(declare-fun lt!149872 () tuple2!8412)

(assert (=> b!102862 (= e!67319 (and (= (_2!4461 lt!149872) v!199) (= (_1!4461 lt!149872) (_2!4458 lt!149886))))))

(declare-fun lt!149846 () (_ BitVec 64))

(assert (=> b!102862 (= lt!149872 (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149886) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149846))))

(declare-fun lt!149889 () Unit!6292)

(declare-fun lt!149863 () Unit!6292)

(assert (=> b!102862 (= lt!149889 lt!149863)))

(assert (=> b!102862 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149867)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149855)))

(assert (=> b!102862 (= lt!149863 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4460 lt!149299) (buf!2558 (_2!4460 lt!149867)) lt!149855))))

(assert (=> b!102862 e!67314))

(declare-fun res!84604 () Bool)

(assert (=> b!102862 (=> (not res!84604) (not e!67314))))

(assert (=> b!102862 (= res!84604 (and (= (size!2198 (buf!2558 (_2!4460 lt!149299))) (size!2198 (buf!2558 (_2!4460 lt!149867)))) (bvsge lt!149855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102862 (= lt!149855 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!102862 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102862 (= lt!149846 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!102862 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!102862 (= lt!149886 (reader!0 (_2!4460 lt!149299) (_2!4460 lt!149867)))))

(declare-fun b!102863 () Bool)

(declare-fun e!67317 () (_ BitVec 64))

(assert (=> b!102863 (= e!67317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!102864 () Bool)

(declare-fun lt!149890 () tuple2!8410)

(declare-fun Unit!6304 () Unit!6292)

(assert (=> b!102864 (= e!67320 (tuple2!8411 Unit!6304 (_2!4460 lt!149890)))))

(assert (=> b!102864 (= lt!149885 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102864 (= lt!149851 (appendBit!0 (_2!4460 lt!149299) lt!149885))))

(declare-fun res!84606 () Bool)

(assert (=> b!102864 (= res!84606 (= (size!2198 (buf!2558 (_2!4460 lt!149299))) (size!2198 (buf!2558 (_2!4460 lt!149851)))))))

(assert (=> b!102864 (=> (not res!84606) (not e!67316))))

(assert (=> b!102864 e!67316))

(declare-fun lt!149875 () tuple2!8410)

(assert (=> b!102864 (= lt!149875 lt!149851)))

(assert (=> b!102864 (= lt!149890 (appendNLeastSignificantBitsLoop!0 (_2!4460 lt!149875) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!149878 () Unit!6292)

(assert (=> b!102864 (= lt!149878 (lemmaIsPrefixTransitive!0 (_2!4460 lt!149299) (_2!4460 lt!149875) (_2!4460 lt!149890)))))

(assert (=> b!102864 call!1279))

(declare-fun lt!149864 () Unit!6292)

(assert (=> b!102864 (= lt!149864 lt!149878)))

(assert (=> b!102864 (invariant!0 (currentBit!5026 (_2!4460 lt!149299)) (currentByte!5031 (_2!4460 lt!149299)) (size!2198 (buf!2558 (_2!4460 lt!149875))))))

(declare-fun lt!149881 () BitStream!3870)

(assert (=> b!102864 (= lt!149881 (BitStream!3871 (buf!2558 (_2!4460 lt!149875)) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(assert (=> b!102864 (invariant!0 (currentBit!5026 lt!149881) (currentByte!5031 lt!149881) (size!2198 (buf!2558 (_2!4460 lt!149890))))))

(declare-fun lt!149868 () BitStream!3870)

(assert (=> b!102864 (= lt!149868 (BitStream!3871 (buf!2558 (_2!4460 lt!149890)) (currentByte!5031 lt!149881) (currentBit!5026 lt!149881)))))

(declare-fun lt!149854 () tuple2!8408)

(assert (=> b!102864 (= lt!149854 (readBitPure!0 lt!149881))))

(declare-fun lt!149853 () tuple2!8408)

(assert (=> b!102864 (= lt!149853 (readBitPure!0 lt!149868))))

(declare-fun lt!149880 () Unit!6292)

(assert (=> b!102864 (= lt!149880 (readBitPrefixLemma!0 lt!149881 (_2!4460 lt!149890)))))

(declare-fun res!84603 () Bool)

(assert (=> b!102864 (= res!84603 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149854))) (currentByte!5031 (_1!4459 lt!149854)) (currentBit!5026 (_1!4459 lt!149854))) (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149853))) (currentByte!5031 (_1!4459 lt!149853)) (currentBit!5026 (_1!4459 lt!149853)))))))

(declare-fun e!67315 () Bool)

(assert (=> b!102864 (=> (not res!84603) (not e!67315))))

(assert (=> b!102864 e!67315))

(declare-fun lt!149876 () Unit!6292)

(assert (=> b!102864 (= lt!149876 lt!149880)))

(declare-fun lt!149847 () tuple2!8406)

(assert (=> b!102864 (= lt!149847 (reader!0 (_2!4460 lt!149299) (_2!4460 lt!149890)))))

(declare-fun lt!149884 () tuple2!8406)

(assert (=> b!102864 (= lt!149884 (reader!0 (_2!4460 lt!149875) (_2!4460 lt!149890)))))

(declare-fun lt!149852 () tuple2!8408)

(assert (=> b!102864 (= lt!149852 (readBitPure!0 (_1!4458 lt!149847)))))

(assert (=> b!102864 (= (_2!4459 lt!149852) lt!149885)))

(declare-fun lt!149848 () Unit!6292)

(declare-fun Unit!6305 () Unit!6292)

(assert (=> b!102864 (= lt!149848 Unit!6305)))

(declare-fun lt!149861 () (_ BitVec 64))

(assert (=> b!102864 (= lt!149861 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!149871 () (_ BitVec 64))

(assert (=> b!102864 (= lt!149871 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!149879 () Unit!6292)

(assert (=> b!102864 (= lt!149879 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4460 lt!149299) (buf!2558 (_2!4460 lt!149890)) lt!149871))))

(assert (=> b!102864 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149890)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149871)))

(declare-fun lt!149882 () Unit!6292)

(assert (=> b!102864 (= lt!149882 lt!149879)))

(declare-fun lt!149887 () tuple2!8412)

(assert (=> b!102864 (= lt!149887 (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149847) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149861))))

(declare-fun lt!149857 () (_ BitVec 64))

(assert (=> b!102864 (= lt!149857 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!149856 () Unit!6292)

(assert (=> b!102864 (= lt!149856 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4460 lt!149875) (buf!2558 (_2!4460 lt!149890)) lt!149857))))

(assert (=> b!102864 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149890)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149875))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149875))) lt!149857)))

(declare-fun lt!149849 () Unit!6292)

(assert (=> b!102864 (= lt!149849 lt!149856)))

(declare-fun lt!149859 () tuple2!8412)

(assert (=> b!102864 (= lt!149859 (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149884) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!149861 (ite (_2!4459 lt!149852) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!149860 () tuple2!8412)

(assert (=> b!102864 (= lt!149860 (readNLeastSignificantBitsLoopPure!0 (_1!4458 lt!149847) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149861))))

(declare-fun c!6374 () Bool)

(assert (=> b!102864 (= c!6374 (_2!4459 (readBitPure!0 (_1!4458 lt!149847))))))

(declare-fun lt!149869 () tuple2!8412)

(assert (=> b!102864 (= lt!149869 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4458 lt!149847) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!149861 e!67317)))))

(declare-fun lt!149877 () Unit!6292)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6292)

(assert (=> b!102864 (= lt!149877 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4458 lt!149847) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!149861))))

(assert (=> b!102864 (and (= (_2!4461 lt!149860) (_2!4461 lt!149869)) (= (_1!4461 lt!149860) (_1!4461 lt!149869)))))

(declare-fun lt!149870 () Unit!6292)

(assert (=> b!102864 (= lt!149870 lt!149877)))

(assert (=> b!102864 (= (_1!4458 lt!149847) (withMovedBitIndex!0 (_2!4458 lt!149847) (bvsub (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149890))) (currentByte!5031 (_2!4460 lt!149890)) (currentBit!5026 (_2!4460 lt!149890))))))))

(declare-fun lt!149873 () Unit!6292)

(declare-fun Unit!6306 () Unit!6292)

(assert (=> b!102864 (= lt!149873 Unit!6306)))

(assert (=> b!102864 (= (_1!4458 lt!149884) (withMovedBitIndex!0 (_2!4458 lt!149884) (bvsub (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149875))) (currentByte!5031 (_2!4460 lt!149875)) (currentBit!5026 (_2!4460 lt!149875))) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149890))) (currentByte!5031 (_2!4460 lt!149890)) (currentBit!5026 (_2!4460 lt!149890))))))))

(declare-fun lt!149866 () Unit!6292)

(declare-fun Unit!6307 () Unit!6292)

(assert (=> b!102864 (= lt!149866 Unit!6307)))

(assert (=> b!102864 (= (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))) (bvsub (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149875))) (currentByte!5031 (_2!4460 lt!149875)) (currentBit!5026 (_2!4460 lt!149875))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!149874 () Unit!6292)

(declare-fun Unit!6308 () Unit!6292)

(assert (=> b!102864 (= lt!149874 Unit!6308)))

(assert (=> b!102864 (= (_2!4461 lt!149887) (_2!4461 lt!149859))))

(declare-fun lt!149883 () Unit!6292)

(declare-fun Unit!6309 () Unit!6292)

(assert (=> b!102864 (= lt!149883 Unit!6309)))

(assert (=> b!102864 (= (_1!4461 lt!149887) (_2!4458 lt!149847))))

(declare-fun c!6373 () Bool)

(declare-fun bm!1276 () Bool)

(assert (=> bm!1276 (= call!1279 (isPrefixOf!0 (ite c!6373 (_2!4460 lt!149299) lt!149862) (ite c!6373 (_2!4460 lt!149890) lt!149862)))))

(declare-fun b!102865 () Bool)

(assert (=> b!102865 (= e!67317 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!102866 () Bool)

(declare-fun res!84602 () Bool)

(assert (=> b!102866 (= res!84602 (= (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149851))) (currentByte!5031 (_2!4460 lt!149851)) (currentBit!5026 (_2!4460 lt!149851))) (bvadd (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!102866 (=> (not res!84602) (not e!67316))))

(declare-fun d!31878 () Bool)

(assert (=> d!31878 e!67319))

(declare-fun res!84599 () Bool)

(assert (=> d!31878 (=> (not res!84599) (not e!67319))))

(assert (=> d!31878 (= res!84599 (= (size!2198 (buf!2558 (_2!4460 lt!149299))) (size!2198 (buf!2558 (_2!4460 lt!149867)))))))

(assert (=> d!31878 (= lt!149867 e!67320)))

(assert (=> d!31878 (= c!6373 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31878 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31878 (= (appendNLeastSignificantBitsLoop!0 (_2!4460 lt!149299) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!149867)))

(declare-fun b!102867 () Bool)

(declare-fun res!84600 () Bool)

(assert (=> b!102867 (= res!84600 (isPrefixOf!0 (_2!4460 lt!149299) (_2!4460 lt!149851)))))

(assert (=> b!102867 (=> (not res!84600) (not e!67316))))

(declare-fun b!102868 () Bool)

(assert (=> b!102868 (= e!67315 (= (_2!4459 lt!149854) (_2!4459 lt!149853)))))

(assert (= (and d!31878 c!6373) b!102864))

(assert (= (and d!31878 (not c!6373)) b!102857))

(assert (= (and b!102864 res!84606) b!102866))

(assert (= (and b!102866 res!84602) b!102867))

(assert (= (and b!102867 res!84600) b!102856))

(assert (= (and b!102856 res!84598) b!102861))

(assert (= (and b!102864 res!84603) b!102868))

(assert (= (and b!102864 c!6374) b!102865))

(assert (= (and b!102864 (not c!6374)) b!102863))

(assert (= (or b!102864 b!102857) bm!1276))

(assert (= (and d!31878 res!84599) b!102858))

(assert (= (and b!102858 res!84605) b!102860))

(assert (= (and b!102860 res!84601) b!102862))

(assert (= (and b!102862 res!84604) b!102859))

(declare-fun m!149875 () Bool)

(assert (=> b!102864 m!149875))

(declare-fun m!149877 () Bool)

(assert (=> b!102864 m!149877))

(declare-fun m!149879 () Bool)

(assert (=> b!102864 m!149879))

(assert (=> b!102864 m!149877))

(declare-fun m!149881 () Bool)

(assert (=> b!102864 m!149881))

(declare-fun m!149883 () Bool)

(assert (=> b!102864 m!149883))

(declare-fun m!149885 () Bool)

(assert (=> b!102864 m!149885))

(assert (=> b!102864 m!149569))

(declare-fun m!149887 () Bool)

(assert (=> b!102864 m!149887))

(declare-fun m!149889 () Bool)

(assert (=> b!102864 m!149889))

(declare-fun m!149891 () Bool)

(assert (=> b!102864 m!149891))

(declare-fun m!149893 () Bool)

(assert (=> b!102864 m!149893))

(declare-fun m!149895 () Bool)

(assert (=> b!102864 m!149895))

(declare-fun m!149897 () Bool)

(assert (=> b!102864 m!149897))

(declare-fun m!149899 () Bool)

(assert (=> b!102864 m!149899))

(declare-fun m!149901 () Bool)

(assert (=> b!102864 m!149901))

(declare-fun m!149903 () Bool)

(assert (=> b!102864 m!149903))

(declare-fun m!149905 () Bool)

(assert (=> b!102864 m!149905))

(declare-fun m!149907 () Bool)

(assert (=> b!102864 m!149907))

(declare-fun m!149909 () Bool)

(assert (=> b!102864 m!149909))

(declare-fun m!149911 () Bool)

(assert (=> b!102864 m!149911))

(declare-fun m!149913 () Bool)

(assert (=> b!102864 m!149913))

(declare-fun m!149915 () Bool)

(assert (=> b!102864 m!149915))

(declare-fun m!149917 () Bool)

(assert (=> b!102864 m!149917))

(declare-fun m!149919 () Bool)

(assert (=> b!102864 m!149919))

(declare-fun m!149921 () Bool)

(assert (=> b!102864 m!149921))

(declare-fun m!149923 () Bool)

(assert (=> b!102864 m!149923))

(declare-fun m!149925 () Bool)

(assert (=> b!102864 m!149925))

(declare-fun m!149927 () Bool)

(assert (=> b!102864 m!149927))

(declare-fun m!149929 () Bool)

(assert (=> b!102861 m!149929))

(declare-fun m!149931 () Bool)

(assert (=> b!102861 m!149931))

(declare-fun m!149933 () Bool)

(assert (=> b!102859 m!149933))

(declare-fun m!149935 () Bool)

(assert (=> bm!1276 m!149935))

(declare-fun m!149937 () Bool)

(assert (=> b!102857 m!149937))

(assert (=> b!102866 m!149931))

(assert (=> b!102866 m!149569))

(declare-fun m!149939 () Bool)

(assert (=> b!102858 m!149939))

(assert (=> b!102858 m!149569))

(declare-fun m!149941 () Bool)

(assert (=> b!102867 m!149941))

(declare-fun m!149943 () Bool)

(assert (=> b!102856 m!149943))

(assert (=> b!102856 m!149943))

(declare-fun m!149945 () Bool)

(assert (=> b!102856 m!149945))

(declare-fun m!149947 () Bool)

(assert (=> b!102862 m!149947))

(declare-fun m!149949 () Bool)

(assert (=> b!102862 m!149949))

(declare-fun m!149951 () Bool)

(assert (=> b!102862 m!149951))

(assert (=> b!102862 m!149883))

(declare-fun m!149953 () Bool)

(assert (=> b!102862 m!149953))

(declare-fun m!149955 () Bool)

(assert (=> b!102860 m!149955))

(assert (=> b!102653 d!31878))

(declare-fun d!31954 () Bool)

(declare-fun e!67353 () Bool)

(assert (=> d!31954 e!67353))

(declare-fun res!84657 () Bool)

(assert (=> d!31954 (=> (not res!84657) (not e!67353))))

(declare-fun lt!150039 () tuple2!8410)

(assert (=> d!31954 (= res!84657 (= (size!2198 (buf!2558 thiss!1305)) (size!2198 (buf!2558 (_2!4460 lt!150039)))))))

(declare-fun choose!16 (BitStream!3870 Bool) tuple2!8410)

(assert (=> d!31954 (= lt!150039 (choose!16 thiss!1305 lt!149298))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31954 (validate_offset_bit!0 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)))))

(assert (=> d!31954 (= (appendBit!0 thiss!1305 lt!149298) lt!150039)))

(declare-fun b!102928 () Bool)

(declare-fun res!84654 () Bool)

(assert (=> b!102928 (=> (not res!84654) (not e!67353))))

(declare-fun lt!150037 () (_ BitVec 64))

(declare-fun lt!150040 () (_ BitVec 64))

(assert (=> b!102928 (= res!84654 (= (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!150039))) (currentByte!5031 (_2!4460 lt!150039)) (currentBit!5026 (_2!4460 lt!150039))) (bvadd lt!150040 lt!150037)))))

(assert (=> b!102928 (or (not (= (bvand lt!150040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150037 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!150040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!150040 lt!150037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102928 (= lt!150037 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!102928 (= lt!150040 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun b!102931 () Bool)

(declare-fun e!67352 () Bool)

(declare-fun lt!150038 () tuple2!8408)

(assert (=> b!102931 (= e!67352 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!150038))) (currentByte!5031 (_1!4459 lt!150038)) (currentBit!5026 (_1!4459 lt!150038))) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!150039))) (currentByte!5031 (_2!4460 lt!150039)) (currentBit!5026 (_2!4460 lt!150039)))))))

(declare-fun b!102930 () Bool)

(assert (=> b!102930 (= e!67353 e!67352)))

(declare-fun res!84655 () Bool)

(assert (=> b!102930 (=> (not res!84655) (not e!67352))))

(assert (=> b!102930 (= res!84655 (and (= (_2!4459 lt!150038) lt!149298) (= (_1!4459 lt!150038) (_2!4460 lt!150039))))))

(assert (=> b!102930 (= lt!150038 (readBitPure!0 (readerFrom!0 (_2!4460 lt!150039) (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305))))))

(declare-fun b!102929 () Bool)

(declare-fun res!84656 () Bool)

(assert (=> b!102929 (=> (not res!84656) (not e!67353))))

(assert (=> b!102929 (= res!84656 (isPrefixOf!0 thiss!1305 (_2!4460 lt!150039)))))

(assert (= (and d!31954 res!84657) b!102928))

(assert (= (and b!102928 res!84654) b!102929))

(assert (= (and b!102929 res!84656) b!102930))

(assert (= (and b!102930 res!84655) b!102931))

(declare-fun m!150019 () Bool)

(assert (=> d!31954 m!150019))

(declare-fun m!150021 () Bool)

(assert (=> d!31954 m!150021))

(declare-fun m!150023 () Bool)

(assert (=> b!102930 m!150023))

(assert (=> b!102930 m!150023))

(declare-fun m!150025 () Bool)

(assert (=> b!102930 m!150025))

(declare-fun m!150027 () Bool)

(assert (=> b!102931 m!150027))

(declare-fun m!150029 () Bool)

(assert (=> b!102931 m!150029))

(assert (=> b!102928 m!150029))

(assert (=> b!102928 m!149571))

(declare-fun m!150031 () Bool)

(assert (=> b!102929 m!150031))

(assert (=> b!102653 d!31954))

(declare-fun d!31976 () Bool)

(declare-fun lt!150041 () tuple2!8428)

(assert (=> d!31976 (= lt!150041 (readBit!0 lt!149305))))

(assert (=> d!31976 (= (readBitPure!0 lt!149305) (tuple2!8409 (_2!4469 lt!150041) (_1!4469 lt!150041)))))

(declare-fun bs!7839 () Bool)

(assert (= bs!7839 d!31976))

(declare-fun m!150033 () Bool)

(assert (=> bs!7839 m!150033))

(assert (=> b!102653 d!31976))

(declare-fun d!31978 () Bool)

(declare-fun lt!150042 () tuple2!8428)

(assert (=> d!31978 (= lt!150042 (readBit!0 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))))))

(assert (=> d!31978 (= (readBitPure!0 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))) (tuple2!8409 (_2!4469 lt!150042) (_1!4469 lt!150042)))))

(declare-fun bs!7840 () Bool)

(assert (= bs!7840 d!31978))

(declare-fun m!150035 () Bool)

(assert (=> bs!7840 m!150035))

(assert (=> b!102653 d!31978))

(declare-fun d!31980 () Bool)

(declare-fun e!67363 () Bool)

(assert (=> d!31980 e!67363))

(declare-fun res!84669 () Bool)

(assert (=> d!31980 (=> (not res!84669) (not e!67363))))

(declare-fun lt!150101 () tuple2!8408)

(declare-fun lt!150100 () tuple2!8408)

(assert (=> d!31980 (= res!84669 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!150101))) (currentByte!5031 (_1!4459 lt!150101)) (currentBit!5026 (_1!4459 lt!150101))) (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!150100))) (currentByte!5031 (_1!4459 lt!150100)) (currentBit!5026 (_1!4459 lt!150100)))))))

(declare-fun lt!150103 () BitStream!3870)

(declare-fun lt!150102 () Unit!6292)

(declare-fun choose!50 (BitStream!3870 BitStream!3870 BitStream!3870 tuple2!8408 tuple2!8408 BitStream!3870 Bool tuple2!8408 tuple2!8408 BitStream!3870 Bool) Unit!6292)

(assert (=> d!31980 (= lt!150102 (choose!50 lt!149305 (_2!4460 lt!149306) lt!150103 lt!150101 (tuple2!8409 (_1!4459 lt!150101) (_2!4459 lt!150101)) (_1!4459 lt!150101) (_2!4459 lt!150101) lt!150100 (tuple2!8409 (_1!4459 lt!150100) (_2!4459 lt!150100)) (_1!4459 lt!150100) (_2!4459 lt!150100)))))

(assert (=> d!31980 (= lt!150100 (readBitPure!0 lt!150103))))

(assert (=> d!31980 (= lt!150101 (readBitPure!0 lt!149305))))

(assert (=> d!31980 (= lt!150103 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 lt!149305) (currentBit!5026 lt!149305)))))

(assert (=> d!31980 (invariant!0 (currentBit!5026 lt!149305) (currentByte!5031 lt!149305) (size!2198 (buf!2558 (_2!4460 lt!149306))))))

(assert (=> d!31980 (= (readBitPrefixLemma!0 lt!149305 (_2!4460 lt!149306)) lt!150102)))

(declare-fun b!102947 () Bool)

(assert (=> b!102947 (= e!67363 (= (_2!4459 lt!150101) (_2!4459 lt!150100)))))

(assert (= (and d!31980 res!84669) b!102947))

(declare-fun m!150125 () Bool)

(assert (=> d!31980 m!150125))

(declare-fun m!150127 () Bool)

(assert (=> d!31980 m!150127))

(declare-fun m!150129 () Bool)

(assert (=> d!31980 m!150129))

(declare-fun m!150131 () Bool)

(assert (=> d!31980 m!150131))

(declare-fun m!150133 () Bool)

(assert (=> d!31980 m!150133))

(assert (=> d!31980 m!149551))

(assert (=> b!102653 d!31980))

(declare-fun d!31990 () Bool)

(assert (=> d!31990 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!102653 d!31990))

(declare-fun d!31992 () Bool)

(declare-fun res!84677 () Bool)

(declare-fun e!67368 () Bool)

(assert (=> d!31992 (=> (not res!84677) (not e!67368))))

(assert (=> d!31992 (= res!84677 (= (size!2198 (buf!2558 thiss!1305)) (size!2198 (buf!2558 (_2!4460 lt!149306)))))))

(assert (=> d!31992 (= (isPrefixOf!0 thiss!1305 (_2!4460 lt!149306)) e!67368)))

(declare-fun b!102954 () Bool)

(declare-fun res!84676 () Bool)

(assert (=> b!102954 (=> (not res!84676) (not e!67368))))

(assert (=> b!102954 (= res!84676 (bvsle (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149306))) (currentByte!5031 (_2!4460 lt!149306)) (currentBit!5026 (_2!4460 lt!149306)))))))

(declare-fun b!102955 () Bool)

(declare-fun e!67369 () Bool)

(assert (=> b!102955 (= e!67368 e!67369)))

(declare-fun res!84678 () Bool)

(assert (=> b!102955 (=> res!84678 e!67369)))

(assert (=> b!102955 (= res!84678 (= (size!2198 (buf!2558 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102956 () Bool)

(assert (=> b!102956 (= e!67369 (arrayBitRangesEq!0 (buf!2558 thiss!1305) (buf!2558 (_2!4460 lt!149306)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))))))

(assert (= (and d!31992 res!84677) b!102954))

(assert (= (and b!102954 res!84676) b!102955))

(assert (= (and b!102955 (not res!84678)) b!102956))

(assert (=> b!102954 m!149571))

(assert (=> b!102954 m!149675))

(assert (=> b!102956 m!149571))

(assert (=> b!102956 m!149571))

(declare-fun m!150137 () Bool)

(assert (=> b!102956 m!150137))

(assert (=> b!102653 d!31992))

(declare-fun b!102957 () Bool)

(declare-fun e!67370 () Unit!6292)

(declare-fun lt!150126 () Unit!6292)

(assert (=> b!102957 (= e!67370 lt!150126)))

(declare-fun lt!150108 () (_ BitVec 64))

(assert (=> b!102957 (= lt!150108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!150123 () (_ BitVec 64))

(assert (=> b!102957 (= lt!150123 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(assert (=> b!102957 (= lt!150126 (arrayBitRangesEqSymmetric!0 (buf!2558 (_2!4460 lt!149299)) (buf!2558 (_2!4460 lt!149306)) lt!150108 lt!150123))))

(assert (=> b!102957 (arrayBitRangesEq!0 (buf!2558 (_2!4460 lt!149306)) (buf!2558 (_2!4460 lt!149299)) lt!150108 lt!150123)))

(declare-fun b!102958 () Bool)

(declare-fun res!84680 () Bool)

(declare-fun e!67371 () Bool)

(assert (=> b!102958 (=> (not res!84680) (not e!67371))))

(declare-fun lt!150107 () tuple2!8406)

(assert (=> b!102958 (= res!84680 (isPrefixOf!0 (_2!4458 lt!150107) (_2!4460 lt!149306)))))

(declare-fun b!102959 () Bool)

(declare-fun lt!150125 () (_ BitVec 64))

(declare-fun lt!150121 () (_ BitVec 64))

(assert (=> b!102959 (= e!67371 (= (_1!4458 lt!150107) (withMovedBitIndex!0 (_2!4458 lt!150107) (bvsub lt!150125 lt!150121))))))

(assert (=> b!102959 (or (= (bvand lt!150125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150125 lt!150121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!102959 (= lt!150121 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149306))) (currentByte!5031 (_2!4460 lt!149306)) (currentBit!5026 (_2!4460 lt!149306))))))

(assert (=> b!102959 (= lt!150125 (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(declare-fun b!102960 () Bool)

(declare-fun res!84679 () Bool)

(assert (=> b!102960 (=> (not res!84679) (not e!67371))))

(assert (=> b!102960 (= res!84679 (isPrefixOf!0 (_1!4458 lt!150107) (_2!4460 lt!149299)))))

(declare-fun d!31996 () Bool)

(assert (=> d!31996 e!67371))

(declare-fun res!84681 () Bool)

(assert (=> d!31996 (=> (not res!84681) (not e!67371))))

(assert (=> d!31996 (= res!84681 (isPrefixOf!0 (_1!4458 lt!150107) (_2!4458 lt!150107)))))

(declare-fun lt!150113 () BitStream!3870)

(assert (=> d!31996 (= lt!150107 (tuple2!8407 lt!150113 (_2!4460 lt!149306)))))

(declare-fun lt!150119 () Unit!6292)

(declare-fun lt!150118 () Unit!6292)

(assert (=> d!31996 (= lt!150119 lt!150118)))

(assert (=> d!31996 (isPrefixOf!0 lt!150113 (_2!4460 lt!149306))))

(assert (=> d!31996 (= lt!150118 (lemmaIsPrefixTransitive!0 lt!150113 (_2!4460 lt!149306) (_2!4460 lt!149306)))))

(declare-fun lt!150112 () Unit!6292)

(declare-fun lt!150110 () Unit!6292)

(assert (=> d!31996 (= lt!150112 lt!150110)))

(assert (=> d!31996 (isPrefixOf!0 lt!150113 (_2!4460 lt!149306))))

(assert (=> d!31996 (= lt!150110 (lemmaIsPrefixTransitive!0 lt!150113 (_2!4460 lt!149299) (_2!4460 lt!149306)))))

(declare-fun lt!150117 () Unit!6292)

(assert (=> d!31996 (= lt!150117 e!67370)))

(declare-fun c!6382 () Bool)

(assert (=> d!31996 (= c!6382 (not (= (size!2198 (buf!2558 (_2!4460 lt!149299))) #b00000000000000000000000000000000)))))

(declare-fun lt!150116 () Unit!6292)

(declare-fun lt!150115 () Unit!6292)

(assert (=> d!31996 (= lt!150116 lt!150115)))

(assert (=> d!31996 (isPrefixOf!0 (_2!4460 lt!149306) (_2!4460 lt!149306))))

(assert (=> d!31996 (= lt!150115 (lemmaIsPrefixRefl!0 (_2!4460 lt!149306)))))

(declare-fun lt!150122 () Unit!6292)

(declare-fun lt!150120 () Unit!6292)

(assert (=> d!31996 (= lt!150122 lt!150120)))

(assert (=> d!31996 (= lt!150120 (lemmaIsPrefixRefl!0 (_2!4460 lt!149306)))))

(declare-fun lt!150111 () Unit!6292)

(declare-fun lt!150109 () Unit!6292)

(assert (=> d!31996 (= lt!150111 lt!150109)))

(assert (=> d!31996 (isPrefixOf!0 lt!150113 lt!150113)))

(assert (=> d!31996 (= lt!150109 (lemmaIsPrefixRefl!0 lt!150113))))

(declare-fun lt!150124 () Unit!6292)

(declare-fun lt!150114 () Unit!6292)

(assert (=> d!31996 (= lt!150124 lt!150114)))

(assert (=> d!31996 (isPrefixOf!0 (_2!4460 lt!149299) (_2!4460 lt!149299))))

(assert (=> d!31996 (= lt!150114 (lemmaIsPrefixRefl!0 (_2!4460 lt!149299)))))

(assert (=> d!31996 (= lt!150113 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))))))

(assert (=> d!31996 (isPrefixOf!0 (_2!4460 lt!149299) (_2!4460 lt!149306))))

(assert (=> d!31996 (= (reader!0 (_2!4460 lt!149299) (_2!4460 lt!149306)) lt!150107)))

(declare-fun b!102961 () Bool)

(declare-fun Unit!6311 () Unit!6292)

(assert (=> b!102961 (= e!67370 Unit!6311)))

(assert (= (and d!31996 c!6382) b!102957))

(assert (= (and d!31996 (not c!6382)) b!102961))

(assert (= (and d!31996 res!84681) b!102960))

(assert (= (and b!102960 res!84679) b!102958))

(assert (= (and b!102958 res!84680) b!102959))

(assert (=> d!31996 m!149651))

(declare-fun m!150139 () Bool)

(assert (=> d!31996 m!150139))

(declare-fun m!150141 () Bool)

(assert (=> d!31996 m!150141))

(declare-fun m!150143 () Bool)

(assert (=> d!31996 m!150143))

(assert (=> d!31996 m!149657))

(declare-fun m!150145 () Bool)

(assert (=> d!31996 m!150145))

(declare-fun m!150147 () Bool)

(assert (=> d!31996 m!150147))

(declare-fun m!150149 () Bool)

(assert (=> d!31996 m!150149))

(declare-fun m!150151 () Bool)

(assert (=> d!31996 m!150151))

(declare-fun m!150153 () Bool)

(assert (=> d!31996 m!150153))

(declare-fun m!150155 () Bool)

(assert (=> d!31996 m!150155))

(declare-fun m!150157 () Bool)

(assert (=> b!102960 m!150157))

(declare-fun m!150159 () Bool)

(assert (=> b!102959 m!150159))

(assert (=> b!102959 m!149675))

(assert (=> b!102959 m!149569))

(declare-fun m!150161 () Bool)

(assert (=> b!102958 m!150161))

(assert (=> b!102957 m!149569))

(declare-fun m!150163 () Bool)

(assert (=> b!102957 m!150163))

(declare-fun m!150165 () Bool)

(assert (=> b!102957 m!150165))

(assert (=> b!102653 d!31996))

(declare-fun d!31998 () Bool)

(assert (=> d!31998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299))) lt!149301)))

(declare-fun lt!150129 () Unit!6292)

(declare-fun choose!9 (BitStream!3870 array!4814 (_ BitVec 64) BitStream!3870) Unit!6292)

(assert (=> d!31998 (= lt!150129 (choose!9 (_2!4460 lt!149299) (buf!2558 (_2!4460 lt!149306)) lt!149301 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299)))))))

(assert (=> d!31998 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4460 lt!149299) (buf!2558 (_2!4460 lt!149306)) lt!149301) lt!150129)))

(declare-fun bs!7845 () Bool)

(assert (= bs!7845 d!31998))

(assert (=> bs!7845 m!149541))

(declare-fun m!150167 () Bool)

(assert (=> bs!7845 m!150167))

(assert (=> b!102653 d!31998))

(declare-fun d!32000 () Bool)

(declare-fun e!67372 () Bool)

(assert (=> d!32000 e!67372))

(declare-fun res!84682 () Bool)

(assert (=> d!32000 (=> (not res!84682) (not e!67372))))

(declare-fun lt!150131 () (_ BitVec 64))

(declare-fun lt!150132 () (_ BitVec 64))

(declare-fun lt!150134 () (_ BitVec 64))

(assert (=> d!32000 (= res!84682 (= lt!150134 (bvsub lt!150131 lt!150132)))))

(assert (=> d!32000 (or (= (bvand lt!150131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150131 lt!150132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32000 (= lt!150132 (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149312)))) ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149312))) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149312)))))))

(declare-fun lt!150130 () (_ BitVec 64))

(declare-fun lt!150135 () (_ BitVec 64))

(assert (=> d!32000 (= lt!150131 (bvmul lt!150130 lt!150135))))

(assert (=> d!32000 (or (= lt!150130 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150135 (bvsdiv (bvmul lt!150130 lt!150135) lt!150130)))))

(assert (=> d!32000 (= lt!150135 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32000 (= lt!150130 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149312)))))))

(assert (=> d!32000 (= lt!150134 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149312))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149312)))))))

(assert (=> d!32000 (invariant!0 (currentBit!5026 (_1!4459 lt!149312)) (currentByte!5031 (_1!4459 lt!149312)) (size!2198 (buf!2558 (_1!4459 lt!149312))))))

(assert (=> d!32000 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149312))) (currentByte!5031 (_1!4459 lt!149312)) (currentBit!5026 (_1!4459 lt!149312))) lt!150134)))

(declare-fun b!102962 () Bool)

(declare-fun res!84683 () Bool)

(assert (=> b!102962 (=> (not res!84683) (not e!67372))))

(assert (=> b!102962 (= res!84683 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150134))))

(declare-fun b!102963 () Bool)

(declare-fun lt!150133 () (_ BitVec 64))

(assert (=> b!102963 (= e!67372 (bvsle lt!150134 (bvmul lt!150133 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102963 (or (= lt!150133 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150133 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150133)))))

(assert (=> b!102963 (= lt!150133 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149312)))))))

(assert (= (and d!32000 res!84682) b!102962))

(assert (= (and b!102962 res!84683) b!102963))

(declare-fun m!150169 () Bool)

(assert (=> d!32000 m!150169))

(declare-fun m!150171 () Bool)

(assert (=> d!32000 m!150171))

(assert (=> b!102653 d!32000))

(declare-fun d!32002 () Bool)

(declare-fun e!67373 () Bool)

(assert (=> d!32002 e!67373))

(declare-fun res!84684 () Bool)

(assert (=> d!32002 (=> (not res!84684) (not e!67373))))

(declare-fun lt!150137 () (_ BitVec 64))

(declare-fun lt!150138 () (_ BitVec 64))

(declare-fun lt!150140 () (_ BitVec 64))

(assert (=> d!32002 (= res!84684 (= lt!150140 (bvsub lt!150137 lt!150138)))))

(assert (=> d!32002 (or (= (bvand lt!150137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150137 lt!150138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32002 (= lt!150138 (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149307)))) ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149307))) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149307)))))))

(declare-fun lt!150136 () (_ BitVec 64))

(declare-fun lt!150141 () (_ BitVec 64))

(assert (=> d!32002 (= lt!150137 (bvmul lt!150136 lt!150141))))

(assert (=> d!32002 (or (= lt!150136 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150141 (bvsdiv (bvmul lt!150136 lt!150141) lt!150136)))))

(assert (=> d!32002 (= lt!150141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32002 (= lt!150136 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149307)))))))

(assert (=> d!32002 (= lt!150140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5031 (_1!4459 lt!149307))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5026 (_1!4459 lt!149307)))))))

(assert (=> d!32002 (invariant!0 (currentBit!5026 (_1!4459 lt!149307)) (currentByte!5031 (_1!4459 lt!149307)) (size!2198 (buf!2558 (_1!4459 lt!149307))))))

(assert (=> d!32002 (= (bitIndex!0 (size!2198 (buf!2558 (_1!4459 lt!149307))) (currentByte!5031 (_1!4459 lt!149307)) (currentBit!5026 (_1!4459 lt!149307))) lt!150140)))

(declare-fun b!102964 () Bool)

(declare-fun res!84685 () Bool)

(assert (=> b!102964 (=> (not res!84685) (not e!67373))))

(assert (=> b!102964 (= res!84685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150140))))

(declare-fun b!102965 () Bool)

(declare-fun lt!150139 () (_ BitVec 64))

(assert (=> b!102965 (= e!67373 (bvsle lt!150140 (bvmul lt!150139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102965 (or (= lt!150139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150139)))))

(assert (=> b!102965 (= lt!150139 ((_ sign_extend 32) (size!2198 (buf!2558 (_1!4459 lt!149307)))))))

(assert (= (and d!32002 res!84684) b!102964))

(assert (= (and b!102964 res!84685) b!102965))

(declare-fun m!150173 () Bool)

(assert (=> d!32002 m!150173))

(declare-fun m!150175 () Bool)

(assert (=> d!32002 m!150175))

(assert (=> b!102653 d!32002))

(declare-fun d!32004 () Bool)

(assert (=> d!32004 (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)) lt!149314)))

(declare-fun lt!150142 () Unit!6292)

(assert (=> d!32004 (= lt!150142 (choose!9 thiss!1305 (buf!2558 (_2!4460 lt!149306)) lt!149314 (BitStream!3871 (buf!2558 (_2!4460 lt!149306)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))))))

(assert (=> d!32004 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2558 (_2!4460 lt!149306)) lt!149314) lt!150142)))

(declare-fun bs!7846 () Bool)

(assert (= bs!7846 d!32004))

(assert (=> bs!7846 m!149535))

(declare-fun m!150177 () Bool)

(assert (=> bs!7846 m!150177))

(assert (=> b!102653 d!32004))

(declare-fun d!32006 () Bool)

(assert (=> d!32006 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)) lt!149314) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149306)))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305))) lt!149314))))

(declare-fun bs!7847 () Bool)

(assert (= bs!7847 d!32006))

(declare-fun m!150179 () Bool)

(assert (=> bs!7847 m!150179))

(assert (=> b!102653 d!32006))

(declare-fun d!32008 () Bool)

(declare-fun e!67374 () Bool)

(assert (=> d!32008 e!67374))

(declare-fun res!84686 () Bool)

(assert (=> d!32008 (=> (not res!84686) (not e!67374))))

(declare-fun lt!150147 () (_ BitVec 64))

(declare-fun lt!150145 () (_ BitVec 64))

(declare-fun lt!150144 () (_ BitVec 64))

(assert (=> d!32008 (= res!84686 (= lt!150147 (bvsub lt!150144 lt!150145)))))

(assert (=> d!32008 (or (= (bvand lt!150144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150144 lt!150145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32008 (= lt!150145 (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149299)))) ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299)))))))

(declare-fun lt!150143 () (_ BitVec 64))

(declare-fun lt!150148 () (_ BitVec 64))

(assert (=> d!32008 (= lt!150144 (bvmul lt!150143 lt!150148))))

(assert (=> d!32008 (or (= lt!150143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150148 (bvsdiv (bvmul lt!150143 lt!150148) lt!150143)))))

(assert (=> d!32008 (= lt!150148 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32008 (= lt!150143 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(assert (=> d!32008 (= lt!150147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5031 (_2!4460 lt!149299))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5026 (_2!4460 lt!149299)))))))

(assert (=> d!32008 (invariant!0 (currentBit!5026 (_2!4460 lt!149299)) (currentByte!5031 (_2!4460 lt!149299)) (size!2198 (buf!2558 (_2!4460 lt!149299))))))

(assert (=> d!32008 (= (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299))) lt!150147)))

(declare-fun b!102966 () Bool)

(declare-fun res!84687 () Bool)

(assert (=> b!102966 (=> (not res!84687) (not e!67374))))

(assert (=> b!102966 (= res!84687 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150147))))

(declare-fun b!102967 () Bool)

(declare-fun lt!150146 () (_ BitVec 64))

(assert (=> b!102967 (= e!67374 (bvsle lt!150147 (bvmul lt!150146 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102967 (or (= lt!150146 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150146 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150146)))))

(assert (=> b!102967 (= lt!150146 ((_ sign_extend 32) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(assert (= (and d!32008 res!84686) b!102966))

(assert (= (and b!102966 res!84687) b!102967))

(declare-fun m!150181 () Bool)

(assert (=> d!32008 m!150181))

(declare-fun m!150183 () Bool)

(assert (=> d!32008 m!150183))

(assert (=> b!102655 d!32008))

(declare-fun d!32010 () Bool)

(declare-fun e!67375 () Bool)

(assert (=> d!32010 e!67375))

(declare-fun res!84688 () Bool)

(assert (=> d!32010 (=> (not res!84688) (not e!67375))))

(declare-fun lt!150151 () (_ BitVec 64))

(declare-fun lt!150150 () (_ BitVec 64))

(declare-fun lt!150153 () (_ BitVec 64))

(assert (=> d!32010 (= res!84688 (= lt!150153 (bvsub lt!150150 lt!150151)))))

(assert (=> d!32010 (or (= (bvand lt!150150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150150 lt!150151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32010 (= lt!150151 (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305))))))

(declare-fun lt!150149 () (_ BitVec 64))

(declare-fun lt!150154 () (_ BitVec 64))

(assert (=> d!32010 (= lt!150150 (bvmul lt!150149 lt!150154))))

(assert (=> d!32010 (or (= lt!150149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150154 (bvsdiv (bvmul lt!150149 lt!150154) lt!150149)))))

(assert (=> d!32010 (= lt!150154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32010 (= lt!150149 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))))))

(assert (=> d!32010 (= lt!150153 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5031 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5026 thiss!1305))))))

(assert (=> d!32010 (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 thiss!1305)))))

(assert (=> d!32010 (= (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)) lt!150153)))

(declare-fun b!102968 () Bool)

(declare-fun res!84689 () Bool)

(assert (=> b!102968 (=> (not res!84689) (not e!67375))))

(assert (=> b!102968 (= res!84689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150153))))

(declare-fun b!102969 () Bool)

(declare-fun lt!150152 () (_ BitVec 64))

(assert (=> b!102969 (= e!67375 (bvsle lt!150153 (bvmul lt!150152 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!102969 (or (= lt!150152 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150152 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150152)))))

(assert (=> b!102969 (= lt!150152 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))))))

(assert (= (and d!32010 res!84688) b!102968))

(assert (= (and b!102968 res!84689) b!102969))

(declare-fun m!150185 () Bool)

(assert (=> d!32010 m!150185))

(assert (=> d!32010 m!149645))

(assert (=> b!102655 d!32010))

(declare-fun d!32012 () Bool)

(declare-fun lt!150155 () tuple2!8428)

(assert (=> d!32012 (= lt!150155 (readBit!0 (readerFrom!0 (_2!4460 lt!149299) (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305))))))

(assert (=> d!32012 (= (readBitPure!0 (readerFrom!0 (_2!4460 lt!149299) (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305))) (tuple2!8409 (_2!4469 lt!150155) (_1!4469 lt!150155)))))

(declare-fun bs!7848 () Bool)

(assert (= bs!7848 d!32012))

(assert (=> bs!7848 m!149563))

(declare-fun m!150187 () Bool)

(assert (=> bs!7848 m!150187))

(assert (=> b!102654 d!32012))

(declare-fun d!32014 () Bool)

(declare-fun e!67378 () Bool)

(assert (=> d!32014 e!67378))

(declare-fun res!84693 () Bool)

(assert (=> d!32014 (=> (not res!84693) (not e!67378))))

(assert (=> d!32014 (= res!84693 (invariant!0 (currentBit!5026 (_2!4460 lt!149299)) (currentByte!5031 (_2!4460 lt!149299)) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(assert (=> d!32014 (= (readerFrom!0 (_2!4460 lt!149299) (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305)) (BitStream!3871 (buf!2558 (_2!4460 lt!149299)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)))))

(declare-fun b!102972 () Bool)

(assert (=> b!102972 (= e!67378 (invariant!0 (currentBit!5026 thiss!1305) (currentByte!5031 thiss!1305) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(assert (= (and d!32014 res!84693) b!102972))

(assert (=> d!32014 m!150183))

(assert (=> b!102972 m!149575))

(assert (=> b!102654 d!32014))

(declare-fun d!32016 () Bool)

(declare-fun res!84695 () Bool)

(declare-fun e!67379 () Bool)

(assert (=> d!32016 (=> (not res!84695) (not e!67379))))

(assert (=> d!32016 (= res!84695 (= (size!2198 (buf!2558 thiss!1305)) (size!2198 (buf!2558 (_2!4460 lt!149299)))))))

(assert (=> d!32016 (= (isPrefixOf!0 thiss!1305 (_2!4460 lt!149299)) e!67379)))

(declare-fun b!102973 () Bool)

(declare-fun res!84694 () Bool)

(assert (=> b!102973 (=> (not res!84694) (not e!67379))))

(assert (=> b!102973 (= res!84694 (bvsle (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305)) (bitIndex!0 (size!2198 (buf!2558 (_2!4460 lt!149299))) (currentByte!5031 (_2!4460 lt!149299)) (currentBit!5026 (_2!4460 lt!149299)))))))

(declare-fun b!102974 () Bool)

(declare-fun e!67380 () Bool)

(assert (=> b!102974 (= e!67379 e!67380)))

(declare-fun res!84696 () Bool)

(assert (=> b!102974 (=> res!84696 e!67380)))

(assert (=> b!102974 (= res!84696 (= (size!2198 (buf!2558 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!102975 () Bool)

(assert (=> b!102975 (= e!67380 (arrayBitRangesEq!0 (buf!2558 thiss!1305) (buf!2558 (_2!4460 lt!149299)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2198 (buf!2558 thiss!1305)) (currentByte!5031 thiss!1305) (currentBit!5026 thiss!1305))))))

(assert (= (and d!32016 res!84695) b!102973))

(assert (= (and b!102973 res!84694) b!102974))

(assert (= (and b!102974 (not res!84696)) b!102975))

(assert (=> b!102973 m!149571))

(assert (=> b!102973 m!149569))

(assert (=> b!102975 m!149571))

(assert (=> b!102975 m!149571))

(declare-fun m!150189 () Bool)

(assert (=> b!102975 m!150189))

(assert (=> b!102651 d!32016))

(declare-fun d!32018 () Bool)

(assert (=> d!32018 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305)) lt!149314) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2198 (buf!2558 thiss!1305))) ((_ sign_extend 32) (currentByte!5031 thiss!1305)) ((_ sign_extend 32) (currentBit!5026 thiss!1305))) lt!149314))))

(declare-fun bs!7849 () Bool)

(assert (= bs!7849 d!32018))

(assert (=> bs!7849 m!150185))

(assert (=> b!102650 d!32018))

(declare-fun d!32020 () Bool)

(assert (=> d!32020 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!102652 d!32020))

(check-sat (not b!102715) (not d!32004) (not b!102930) (not d!32012) (not b!102929) (not b!102960) (not d!31998) (not d!31976) (not b!102958) (not b!102975) (not d!31996) (not b!102856) (not d!31868) (not d!32014) (not b!102867) (not b!102857) (not d!32000) (not b!102861) (not b!102859) (not d!31980) (not b!102864) (not b!102956) (not b!102957) (not d!32010) (not b!102954) (not d!32002) (not b!102718) (not d!32008) (not d!31954) (not d!31852) (not d!32018) (not b!102716) (not d!31866) (not d!31856) (not b!102866) (not b!102860) (not d!31872) (not b!102972) (not b!102862) (not b!102717) (not b!102928) (not d!31978) (not d!31870) (not d!31864) (not d!31854) (not b!102931) (not bm!1276) (not b!102973) (not b!102858) (not d!32006) (not b!102959))
(check-sat)
