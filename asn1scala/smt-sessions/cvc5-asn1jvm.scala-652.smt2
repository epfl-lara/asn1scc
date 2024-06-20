; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18250 () Bool)

(assert start!18250)

(declare-fun res!74542 () Bool)

(declare-fun e!59544 () Bool)

(assert (=> start!18250 (=> (not res!74542) (not e!59544))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18250 (= res!74542 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18250 e!59544))

(declare-datatypes ((array!4242 0))(
  ( (array!4243 (arr!2550 (Array (_ BitVec 32) (_ BitVec 8))) (size!1913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3388 0))(
  ( (BitStream!3389 (buf!2303 array!4242) (currentByte!4575 (_ BitVec 32)) (currentBit!4570 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3388)

(declare-fun e!59549 () Bool)

(declare-fun inv!12 (BitStream!3388) Bool)

(assert (=> start!18250 (and (inv!12 thiss!1152) e!59549)))

(declare-fun thiss!1151 () BitStream!3388)

(declare-fun e!59541 () Bool)

(assert (=> start!18250 (and (inv!12 thiss!1151) e!59541)))

(assert (=> start!18250 true))

(declare-fun b!90387 () Bool)

(declare-fun res!74535 () Bool)

(assert (=> b!90387 (=> (not res!74535) (not e!59544))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!90387 (= res!74535 (and (bvsle i!576 nBits!336) (= (size!1913 (buf!2303 thiss!1152)) (size!1913 (buf!2303 thiss!1151)))))))

(declare-fun b!90388 () Bool)

(declare-fun array_inv!1759 (array!4242) Bool)

(assert (=> b!90388 (= e!59541 (array_inv!1759 (buf!2303 thiss!1151)))))

(declare-fun b!90389 () Bool)

(declare-fun res!74536 () Bool)

(declare-fun e!59548 () Bool)

(assert (=> b!90389 (=> res!74536 e!59548)))

(assert (=> b!90389 (= res!74536 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90390 () Bool)

(declare-fun res!74533 () Bool)

(declare-fun e!59546 () Bool)

(assert (=> b!90390 (=> (not res!74533) (not e!59546))))

(declare-datatypes ((Unit!5815 0))(
  ( (Unit!5816) )
))
(declare-datatypes ((tuple2!7540 0))(
  ( (tuple2!7541 (_1!4012 Unit!5815) (_2!4012 BitStream!3388)) )
))
(declare-fun lt!137137 () tuple2!7540)

(declare-fun isPrefixOf!0 (BitStream!3388 BitStream!3388) Bool)

(assert (=> b!90390 (= res!74533 (isPrefixOf!0 thiss!1152 (_2!4012 lt!137137)))))

(declare-fun b!90391 () Bool)

(declare-fun e!59543 () Bool)

(declare-datatypes ((tuple2!7542 0))(
  ( (tuple2!7543 (_1!4013 BitStream!3388) (_2!4013 Bool)) )
))
(declare-fun lt!137139 () tuple2!7542)

(declare-fun lt!137135 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90391 (= e!59543 (= (bitIndex!0 (size!1913 (buf!2303 (_1!4013 lt!137139))) (currentByte!4575 (_1!4013 lt!137139)) (currentBit!4570 (_1!4013 lt!137139))) lt!137135))))

(declare-fun b!90392 () Bool)

(declare-fun res!74529 () Bool)

(assert (=> b!90392 (=> (not res!74529) (not e!59544))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90392 (= res!74529 (invariant!0 (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152))))))

(declare-fun b!90393 () Bool)

(declare-fun e!59550 () Bool)

(assert (=> b!90393 (= e!59550 e!59546)))

(declare-fun res!74531 () Bool)

(assert (=> b!90393 (=> (not res!74531) (not e!59546))))

(declare-fun lt!137138 () (_ BitVec 64))

(assert (=> b!90393 (= res!74531 (= lt!137135 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137138)))))

(assert (=> b!90393 (= lt!137135 (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137137))) (currentByte!4575 (_2!4012 lt!137137)) (currentBit!4570 (_2!4012 lt!137137))))))

(declare-fun b!90394 () Bool)

(assert (=> b!90394 (= e!59546 e!59543)))

(declare-fun res!74534 () Bool)

(assert (=> b!90394 (=> (not res!74534) (not e!59543))))

(declare-fun lt!137136 () Bool)

(assert (=> b!90394 (= res!74534 (and (= (_2!4013 lt!137139) lt!137136) (= (_1!4013 lt!137139) (_2!4012 lt!137137))))))

(declare-fun readBitPure!0 (BitStream!3388) tuple2!7542)

(declare-fun readerFrom!0 (BitStream!3388 (_ BitVec 32) (_ BitVec 32)) BitStream!3388)

(assert (=> b!90394 (= lt!137139 (readBitPure!0 (readerFrom!0 (_2!4012 lt!137137) (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152))))))

(declare-fun b!90395 () Bool)

(declare-fun res!74537 () Bool)

(assert (=> b!90395 (=> (not res!74537) (not e!59544))))

(assert (=> b!90395 (= res!74537 (invariant!0 (currentBit!4570 thiss!1151) (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151))))))

(declare-fun b!90396 () Bool)

(declare-fun res!74528 () Bool)

(declare-fun e!59542 () Bool)

(assert (=> b!90396 (=> (not res!74528) (not e!59542))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90396 (= res!74528 (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))) ((_ sign_extend 32) (currentByte!4575 thiss!1152)) ((_ sign_extend 32) (currentBit!4570 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90397 () Bool)

(declare-fun res!74532 () Bool)

(assert (=> b!90397 (=> (not res!74532) (not e!59544))))

(assert (=> b!90397 (= res!74532 (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))) ((_ sign_extend 32) (currentByte!4575 thiss!1151)) ((_ sign_extend 32) (currentBit!4570 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90398 () Bool)

(assert (=> b!90398 (= e!59549 (array_inv!1759 (buf!2303 thiss!1152)))))

(declare-fun b!90399 () Bool)

(assert (=> b!90399 (= e!59542 (not e!59548))))

(declare-fun res!74541 () Bool)

(assert (=> b!90399 (=> res!74541 e!59548)))

(assert (=> b!90399 (= res!74541 (not (invariant!0 (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137))))))))

(assert (=> b!90399 e!59550))

(declare-fun res!74540 () Bool)

(assert (=> b!90399 (=> (not res!74540) (not e!59550))))

(assert (=> b!90399 (= res!74540 (= (size!1913 (buf!2303 thiss!1152)) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(declare-fun appendBit!0 (BitStream!3388 Bool) tuple2!7540)

(assert (=> b!90399 (= lt!137137 (appendBit!0 thiss!1152 lt!137136))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!90399 (= lt!137136 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90400 () Bool)

(declare-fun res!74538 () Bool)

(assert (=> b!90400 (=> (not res!74538) (not e!59542))))

(assert (=> b!90400 (= res!74538 (bvslt i!576 nBits!336))))

(declare-fun b!90401 () Bool)

(assert (=> b!90401 (= e!59544 e!59542)))

(declare-fun res!74530 () Bool)

(assert (=> b!90401 (=> (not res!74530) (not e!59542))))

(declare-fun lt!137134 () (_ BitVec 64))

(assert (=> b!90401 (= res!74530 (= lt!137138 (bvadd lt!137134 ((_ sign_extend 32) i!576))))))

(assert (=> b!90401 (= lt!137138 (bitIndex!0 (size!1913 (buf!2303 thiss!1152)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152)))))

(assert (=> b!90401 (= lt!137134 (bitIndex!0 (size!1913 (buf!2303 thiss!1151)) (currentByte!4575 thiss!1151) (currentBit!4570 thiss!1151)))))

(declare-fun b!90402 () Bool)

(declare-fun res!74539 () Bool)

(assert (=> b!90402 (=> (not res!74539) (not e!59544))))

(assert (=> b!90402 (= res!74539 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90403 () Bool)

(declare-datatypes ((tuple3!436 0))(
  ( (tuple3!437 (_1!4014 Unit!5815) (_2!4014 BitStream!3388) (_3!242 (_ BitVec 32))) )
))
(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3388 (_ BitVec 64) BitStream!3388 (_ BitVec 32)) tuple3!436)

(assert (=> b!90403 (= e!59548 (bvsge (_3!242 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4012 lt!137137) (bvadd #b00000000000000000000000000000001 i!576))) nBits!336))))

(assert (= (and start!18250 res!74542) b!90397))

(assert (= (and b!90397 res!74532) b!90395))

(assert (= (and b!90395 res!74537) b!90402))

(assert (= (and b!90402 res!74539) b!90392))

(assert (= (and b!90392 res!74529) b!90387))

(assert (= (and b!90387 res!74535) b!90401))

(assert (= (and b!90401 res!74530) b!90396))

(assert (= (and b!90396 res!74528) b!90400))

(assert (= (and b!90400 res!74538) b!90399))

(assert (= (and b!90399 res!74540) b!90393))

(assert (= (and b!90393 res!74531) b!90390))

(assert (= (and b!90390 res!74533) b!90394))

(assert (= (and b!90394 res!74534) b!90391))

(assert (= (and b!90399 (not res!74541)) b!90389))

(assert (= (and b!90389 (not res!74536)) b!90403))

(assert (= start!18250 b!90398))

(assert (= start!18250 b!90388))

(declare-fun m!134873 () Bool)

(assert (=> b!90388 m!134873))

(declare-fun m!134875 () Bool)

(assert (=> b!90390 m!134875))

(declare-fun m!134877 () Bool)

(assert (=> b!90401 m!134877))

(declare-fun m!134879 () Bool)

(assert (=> b!90401 m!134879))

(declare-fun m!134881 () Bool)

(assert (=> b!90395 m!134881))

(declare-fun m!134883 () Bool)

(assert (=> b!90392 m!134883))

(declare-fun m!134885 () Bool)

(assert (=> start!18250 m!134885))

(declare-fun m!134887 () Bool)

(assert (=> start!18250 m!134887))

(declare-fun m!134889 () Bool)

(assert (=> b!90396 m!134889))

(declare-fun m!134891 () Bool)

(assert (=> b!90393 m!134891))

(declare-fun m!134893 () Bool)

(assert (=> b!90398 m!134893))

(declare-fun m!134895 () Bool)

(assert (=> b!90399 m!134895))

(declare-fun m!134897 () Bool)

(assert (=> b!90399 m!134897))

(declare-fun m!134899 () Bool)

(assert (=> b!90394 m!134899))

(assert (=> b!90394 m!134899))

(declare-fun m!134901 () Bool)

(assert (=> b!90394 m!134901))

(declare-fun m!134903 () Bool)

(assert (=> b!90391 m!134903))

(declare-fun m!134905 () Bool)

(assert (=> b!90397 m!134905))

(declare-fun m!134907 () Bool)

(assert (=> b!90403 m!134907))

(push 1)

(assert (not b!90394))

(assert (not b!90399))

(assert (not b!90391))

(assert (not start!18250))

(assert (not b!90393))

(assert (not b!90397))

(assert (not b!90403))

(assert (not b!90398))

(assert (not b!90401))

(assert (not b!90392))

(assert (not b!90395))

(assert (not b!90390))

(assert (not b!90396))

(assert (not b!90388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28158 () Bool)

(assert (=> d!28158 (= (invariant!0 (currentBit!4570 thiss!1151) (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151))) (and (bvsge (currentBit!4570 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4570 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4575 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151))) (and (= (currentBit!4570 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151)))))))))

(assert (=> b!90395 d!28158))

(declare-fun d!28160 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))) ((_ sign_extend 32) (currentByte!4575 thiss!1152)) ((_ sign_extend 32) (currentBit!4570 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))) ((_ sign_extend 32) (currentByte!4575 thiss!1152)) ((_ sign_extend 32) (currentBit!4570 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6968 () Bool)

(assert (= bs!6968 d!28160))

(declare-fun m!134985 () Bool)

(assert (=> bs!6968 m!134985))

(assert (=> b!90396 d!28160))

(declare-fun d!28162 () Bool)

(assert (=> d!28162 (= (invariant!0 (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152))) (and (bvsge (currentBit!4570 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4570 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4575 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152))) (and (= (currentBit!4570 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152)))))))))

(assert (=> b!90392 d!28162))

(declare-fun b!90681 () Bool)

(declare-fun res!74796 () Bool)

(declare-fun e!59680 () Bool)

(assert (=> b!90681 (=> (not res!74796) (not e!59680))))

(assert (=> b!90681 (= res!74796 (= (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137137))) (currentByte!4575 (_2!4012 lt!137137)) (currentBit!4570 (_2!4012 lt!137137))) (bvadd (bitIndex!0 (size!1913 (buf!2303 thiss!1151)) (currentByte!4575 thiss!1151) (currentBit!4570 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90682 () Bool)

(declare-fun res!74798 () Bool)

(assert (=> b!90682 (=> (not res!74798) (not e!59680))))

(assert (=> b!90682 (= res!74798 (invariant!0 (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(declare-fun b!90683 () Bool)

(declare-fun res!74792 () Bool)

(declare-fun e!59682 () Bool)

(assert (=> b!90683 (=> (not res!74792) (not e!59682))))

(declare-fun lt!137298 () tuple2!7540)

(assert (=> b!90683 (= res!74792 (isPrefixOf!0 (_2!4012 lt!137137) (_2!4012 lt!137298)))))

(declare-fun b!90684 () Bool)

(declare-fun res!74795 () Bool)

(assert (=> b!90684 (=> (not res!74795) (not e!59680))))

(assert (=> b!90684 (= res!74795 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1913 (buf!2303 (_2!4012 lt!137137))) (size!1913 (buf!2303 thiss!1151)))))))

(declare-fun b!90685 () Bool)

(declare-fun res!74804 () Bool)

(assert (=> b!90685 (=> (not res!74804) (not e!59680))))

(assert (=> b!90685 (= res!74804 (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 (_2!4012 lt!137137)))) ((_ sign_extend 32) (currentByte!4575 (_2!4012 lt!137137))) ((_ sign_extend 32) (currentBit!4570 (_2!4012 lt!137137))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90686 () Bool)

(declare-fun e!59679 () tuple3!436)

(declare-fun lt!137291 () tuple2!7540)

(declare-fun lt!137294 () (_ BitVec 32))

(declare-fun Unit!5822 () Unit!5815)

(assert (=> b!90686 (= e!59679 (tuple3!437 Unit!5822 (_2!4012 lt!137291) lt!137294))))

(declare-fun b!90687 () Bool)

(assert (=> b!90687 (= e!59680 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90688 () Bool)

(declare-fun e!59681 () Bool)

(declare-fun lt!137297 () tuple2!7542)

(assert (=> b!90688 (= e!59681 (= (bitIndex!0 (size!1913 (buf!2303 (_1!4013 lt!137297))) (currentByte!4575 (_1!4013 lt!137297)) (currentBit!4570 (_1!4013 lt!137297))) (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137298))) (currentByte!4575 (_2!4012 lt!137298)) (currentBit!4570 (_2!4012 lt!137298)))))))

(declare-fun b!90689 () Bool)

(declare-fun res!74794 () Bool)

(declare-fun e!59678 () Bool)

(assert (=> b!90689 (=> (not res!74794) (not e!59678))))

(declare-fun lt!137293 () tuple3!436)

(assert (=> b!90689 (= res!74794 (and (bvsle (_3!242 lt!137293) nBits!336) (= (size!1913 (buf!2303 (_2!4014 lt!137293))) (size!1913 (buf!2303 thiss!1151)))))))

(declare-fun b!90690 () Bool)

(assert (=> b!90690 (= e!59682 e!59681)))

(declare-fun res!74803 () Bool)

(assert (=> b!90690 (=> (not res!74803) (not e!59681))))

(declare-fun lt!137292 () Bool)

(assert (=> b!90690 (= res!74803 (and (= (_2!4013 lt!137297) lt!137292) (= (_1!4013 lt!137297) (_2!4012 lt!137298))))))

(assert (=> b!90690 (= lt!137297 (readBitPure!0 (readerFrom!0 (_2!4012 lt!137298) (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)))))))

(declare-fun b!90691 () Bool)

(assert (=> b!90691 (= e!59679 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4012 lt!137291) lt!137294))))

(declare-fun b!90680 () Bool)

(declare-fun res!74802 () Bool)

(assert (=> b!90680 (=> (not res!74802) (not e!59678))))

(assert (=> b!90680 (= res!74802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 (_2!4014 lt!137293)))) ((_ sign_extend 32) (currentByte!4575 (_2!4014 lt!137293))) ((_ sign_extend 32) (currentBit!4570 (_2!4014 lt!137293))) ((_ sign_extend 32) (bvsub nBits!336 (_3!242 lt!137293)))))))

(assert (=> b!90680 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!242 lt!137293) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!242 lt!137293)) #b10000000000000000000000000000000)))))

(declare-fun d!28164 () Bool)

(assert (=> d!28164 e!59678))

(declare-fun res!74799 () Bool)

(assert (=> d!28164 (=> (not res!74799) (not e!59678))))

(assert (=> d!28164 (= res!74799 (bvsge (_3!242 lt!137293) #b00000000000000000000000000000000))))

(assert (=> d!28164 (= lt!137293 e!59679)))

(declare-fun c!5885 () Bool)

(assert (=> d!28164 (= c!5885 (bvslt lt!137294 nBits!336))))

(assert (=> d!28164 (= lt!137294 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!28164 (= lt!137291 lt!137298)))

(assert (=> d!28164 e!59682))

(declare-fun res!74793 () Bool)

(assert (=> d!28164 (=> (not res!74793) (not e!59682))))

(assert (=> d!28164 (= res!74793 (= (size!1913 (buf!2303 (_2!4012 lt!137137))) (size!1913 (buf!2303 (_2!4012 lt!137298)))))))

(assert (=> d!28164 (= lt!137298 (appendBit!0 (_2!4012 lt!137137) lt!137292))))

(assert (=> d!28164 (= lt!137292 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28164 e!59680))

(declare-fun res!74800 () Bool)

(assert (=> d!28164 (=> (not res!74800) (not e!59680))))

(assert (=> d!28164 (= res!74800 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28164 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4012 lt!137137) (bvadd #b00000000000000000000000000000001 i!576)) lt!137293)))

(declare-fun b!90692 () Bool)

(declare-fun res!74791 () Bool)

(assert (=> b!90692 (=> (not res!74791) (not e!59678))))

(assert (=> b!90692 (= res!74791 (invariant!0 (currentBit!4570 (_2!4014 lt!137293)) (currentByte!4575 (_2!4014 lt!137293)) (size!1913 (buf!2303 (_2!4014 lt!137293)))))))

(declare-fun b!90693 () Bool)

(declare-fun res!74801 () Bool)

(assert (=> b!90693 (=> (not res!74801) (not e!59682))))

(assert (=> b!90693 (= res!74801 (= (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137298))) (currentByte!4575 (_2!4012 lt!137298)) (currentBit!4570 (_2!4012 lt!137298))) (bvadd (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137137))) (currentByte!4575 (_2!4012 lt!137137)) (currentBit!4570 (_2!4012 lt!137137))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!90694 () Bool)

(declare-fun res!74797 () Bool)

(assert (=> b!90694 (=> (not res!74797) (not e!59678))))

(declare-fun lt!137296 () (_ BitVec 64))

(declare-fun lt!137295 () (_ BitVec 64))

(assert (=> b!90694 (= res!74797 (= (bitIndex!0 (size!1913 (buf!2303 (_2!4014 lt!137293))) (currentByte!4575 (_2!4014 lt!137293)) (currentBit!4570 (_2!4014 lt!137293))) (bvadd lt!137295 lt!137296)))))

(assert (=> b!90694 (or (not (= (bvand lt!137295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137296 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137295 lt!137296) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90694 (= lt!137296 ((_ sign_extend 32) (_3!242 lt!137293)))))

(assert (=> b!90694 (= lt!137295 (bitIndex!0 (size!1913 (buf!2303 thiss!1151)) (currentByte!4575 thiss!1151) (currentBit!4570 thiss!1151)))))

(declare-fun b!90695 () Bool)

(assert (=> b!90695 (= e!59678 (bvsge (_3!242 lt!137293) nBits!336))))

(assert (= (and d!28164 res!74800) b!90682))

(assert (= (and b!90682 res!74798) b!90684))

(assert (= (and b!90684 res!74795) b!90681))

(assert (= (and b!90681 res!74796) b!90685))

(assert (= (and b!90685 res!74804) b!90687))

(assert (= (and d!28164 res!74793) b!90693))

(assert (= (and b!90693 res!74801) b!90683))

(assert (= (and b!90683 res!74792) b!90690))

(assert (= (and b!90690 res!74803) b!90688))

(assert (= (and d!28164 c!5885) b!90691))

(assert (= (and d!28164 (not c!5885)) b!90686))

(assert (= (and d!28164 res!74799) b!90692))

(assert (= (and b!90692 res!74791) b!90689))

(assert (= (and b!90689 res!74794) b!90694))

(assert (= (and b!90694 res!74797) b!90680))

(assert (= (and b!90680 res!74802) b!90695))

(declare-fun m!135059 () Bool)

(assert (=> d!28164 m!135059))

(declare-fun m!135061 () Bool)

(assert (=> b!90692 m!135061))

(assert (=> b!90681 m!134891))

(assert (=> b!90681 m!134879))

(declare-fun m!135065 () Bool)

(assert (=> b!90680 m!135065))

(declare-fun m!135067 () Bool)

(assert (=> b!90694 m!135067))

(assert (=> b!90694 m!134879))

(declare-fun m!135069 () Bool)

(assert (=> b!90690 m!135069))

(assert (=> b!90690 m!135069))

(declare-fun m!135071 () Bool)

(assert (=> b!90690 m!135071))

(declare-fun m!135073 () Bool)

(assert (=> b!90688 m!135073))

(declare-fun m!135075 () Bool)

(assert (=> b!90688 m!135075))

(assert (=> b!90693 m!135075))

(assert (=> b!90693 m!134891))

(declare-fun m!135077 () Bool)

(assert (=> b!90685 m!135077))

(declare-fun m!135079 () Bool)

(assert (=> b!90683 m!135079))

(assert (=> b!90682 m!134895))

(declare-fun m!135081 () Bool)

(assert (=> b!90691 m!135081))

(assert (=> b!90403 d!28164))

(declare-fun d!28208 () Bool)

(declare-fun e!59688 () Bool)

(assert (=> d!28208 e!59688))

(declare-fun res!74814 () Bool)

(assert (=> d!28208 (=> (not res!74814) (not e!59688))))

(declare-fun lt!137318 () (_ BitVec 64))

(declare-fun lt!137317 () (_ BitVec 64))

(declare-fun lt!137314 () (_ BitVec 64))

(assert (=> d!28208 (= res!74814 (= lt!137314 (bvsub lt!137317 lt!137318)))))

(assert (=> d!28208 (or (= (bvand lt!137317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137318 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137317 lt!137318) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28208 (= lt!137318 (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 (_2!4012 lt!137137)))) ((_ sign_extend 32) (currentByte!4575 (_2!4012 lt!137137))) ((_ sign_extend 32) (currentBit!4570 (_2!4012 lt!137137)))))))

(declare-fun lt!137315 () (_ BitVec 64))

(declare-fun lt!137319 () (_ BitVec 64))

(assert (=> d!28208 (= lt!137317 (bvmul lt!137315 lt!137319))))

(assert (=> d!28208 (or (= lt!137315 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137319 (bvsdiv (bvmul lt!137315 lt!137319) lt!137315)))))

(assert (=> d!28208 (= lt!137319 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28208 (= lt!137315 ((_ sign_extend 32) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(assert (=> d!28208 (= lt!137314 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4575 (_2!4012 lt!137137))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4570 (_2!4012 lt!137137)))))))

(assert (=> d!28208 (invariant!0 (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137))))))

(assert (=> d!28208 (= (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137137))) (currentByte!4575 (_2!4012 lt!137137)) (currentBit!4570 (_2!4012 lt!137137))) lt!137314)))

(declare-fun b!90703 () Bool)

(declare-fun res!74813 () Bool)

(assert (=> b!90703 (=> (not res!74813) (not e!59688))))

(assert (=> b!90703 (= res!74813 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137314))))

(declare-fun b!90704 () Bool)

(declare-fun lt!137316 () (_ BitVec 64))

(assert (=> b!90704 (= e!59688 (bvsle lt!137314 (bvmul lt!137316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90704 (or (= lt!137316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137316)))))

(assert (=> b!90704 (= lt!137316 ((_ sign_extend 32) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(assert (= (and d!28208 res!74814) b!90703))

(assert (= (and b!90703 res!74813) b!90704))

(declare-fun m!135089 () Bool)

(assert (=> d!28208 m!135089))

(assert (=> d!28208 m!134895))

(assert (=> b!90393 d!28208))

(declare-fun d!28222 () Bool)

(declare-datatypes ((tuple2!7554 0))(
  ( (tuple2!7555 (_1!4022 Bool) (_2!4022 BitStream!3388)) )
))
(declare-fun lt!137334 () tuple2!7554)

(declare-fun readBit!0 (BitStream!3388) tuple2!7554)

(assert (=> d!28222 (= lt!137334 (readBit!0 (readerFrom!0 (_2!4012 lt!137137) (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152))))))

(assert (=> d!28222 (= (readBitPure!0 (readerFrom!0 (_2!4012 lt!137137) (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152))) (tuple2!7543 (_2!4022 lt!137334) (_1!4022 lt!137334)))))

(declare-fun bs!6979 () Bool)

(assert (= bs!6979 d!28222))

(assert (=> bs!6979 m!134899))

(declare-fun m!135091 () Bool)

(assert (=> bs!6979 m!135091))

(assert (=> b!90394 d!28222))

(declare-fun d!28224 () Bool)

(declare-fun e!59697 () Bool)

(assert (=> d!28224 e!59697))

(declare-fun res!74830 () Bool)

(assert (=> d!28224 (=> (not res!74830) (not e!59697))))

(assert (=> d!28224 (= res!74830 (invariant!0 (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(assert (=> d!28224 (= (readerFrom!0 (_2!4012 lt!137137) (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152)) (BitStream!3389 (buf!2303 (_2!4012 lt!137137)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152)))))

(declare-fun b!90719 () Bool)

(assert (=> b!90719 (= e!59697 (invariant!0 (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(assert (= (and d!28224 res!74830) b!90719))

(assert (=> d!28224 m!134895))

(declare-fun m!135099 () Bool)

(assert (=> b!90719 m!135099))

(assert (=> b!90394 d!28224))

(declare-fun d!28234 () Bool)

(declare-fun res!74838 () Bool)

(declare-fun e!59702 () Bool)

(assert (=> d!28234 (=> (not res!74838) (not e!59702))))

(assert (=> d!28234 (= res!74838 (= (size!1913 (buf!2303 thiss!1152)) (size!1913 (buf!2303 (_2!4012 lt!137137)))))))

(assert (=> d!28234 (= (isPrefixOf!0 thiss!1152 (_2!4012 lt!137137)) e!59702)))

(declare-fun b!90726 () Bool)

(declare-fun res!74839 () Bool)

(assert (=> b!90726 (=> (not res!74839) (not e!59702))))

(assert (=> b!90726 (= res!74839 (bvsle (bitIndex!0 (size!1913 (buf!2303 thiss!1152)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152)) (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137137))) (currentByte!4575 (_2!4012 lt!137137)) (currentBit!4570 (_2!4012 lt!137137)))))))

(declare-fun b!90727 () Bool)

(declare-fun e!59703 () Bool)

(assert (=> b!90727 (= e!59702 e!59703)))

(declare-fun res!74837 () Bool)

(assert (=> b!90727 (=> res!74837 e!59703)))

(assert (=> b!90727 (= res!74837 (= (size!1913 (buf!2303 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90728 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4242 array!4242 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90728 (= e!59703 (arrayBitRangesEq!0 (buf!2303 thiss!1152) (buf!2303 (_2!4012 lt!137137)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1913 (buf!2303 thiss!1152)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152))))))

(assert (= (and d!28234 res!74838) b!90726))

(assert (= (and b!90726 res!74839) b!90727))

(assert (= (and b!90727 (not res!74837)) b!90728))

(assert (=> b!90726 m!134877))

(assert (=> b!90726 m!134891))

(assert (=> b!90728 m!134877))

(assert (=> b!90728 m!134877))

(declare-fun m!135101 () Bool)

(assert (=> b!90728 m!135101))

(assert (=> b!90390 d!28234))

(declare-fun d!28242 () Bool)

(declare-fun e!59704 () Bool)

(assert (=> d!28242 e!59704))

(declare-fun res!74841 () Bool)

(assert (=> d!28242 (=> (not res!74841) (not e!59704))))

(declare-fun lt!137363 () (_ BitVec 64))

(declare-fun lt!137359 () (_ BitVec 64))

(declare-fun lt!137362 () (_ BitVec 64))

(assert (=> d!28242 (= res!74841 (= lt!137359 (bvsub lt!137362 lt!137363)))))

(assert (=> d!28242 (or (= (bvand lt!137362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137362 lt!137363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28242 (= lt!137363 (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))) ((_ sign_extend 32) (currentByte!4575 thiss!1152)) ((_ sign_extend 32) (currentBit!4570 thiss!1152))))))

(declare-fun lt!137360 () (_ BitVec 64))

(declare-fun lt!137364 () (_ BitVec 64))

(assert (=> d!28242 (= lt!137362 (bvmul lt!137360 lt!137364))))

(assert (=> d!28242 (or (= lt!137360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137364 (bvsdiv (bvmul lt!137360 lt!137364) lt!137360)))))

(assert (=> d!28242 (= lt!137364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28242 (= lt!137360 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))))))

(assert (=> d!28242 (= lt!137359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4575 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4570 thiss!1152))))))

(assert (=> d!28242 (invariant!0 (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152)))))

(assert (=> d!28242 (= (bitIndex!0 (size!1913 (buf!2303 thiss!1152)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152)) lt!137359)))

(declare-fun b!90729 () Bool)

(declare-fun res!74840 () Bool)

(assert (=> b!90729 (=> (not res!74840) (not e!59704))))

(assert (=> b!90729 (= res!74840 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137359))))

(declare-fun b!90730 () Bool)

(declare-fun lt!137361 () (_ BitVec 64))

(assert (=> b!90730 (= e!59704 (bvsle lt!137359 (bvmul lt!137361 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90730 (or (= lt!137361 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137361 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137361)))))

(assert (=> b!90730 (= lt!137361 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))))))

(assert (= (and d!28242 res!74841) b!90729))

(assert (= (and b!90729 res!74840) b!90730))

(assert (=> d!28242 m!134985))

(assert (=> d!28242 m!134883))

(assert (=> b!90401 d!28242))

(declare-fun d!28244 () Bool)

(declare-fun e!59705 () Bool)

(assert (=> d!28244 e!59705))

(declare-fun res!74843 () Bool)

(assert (=> d!28244 (=> (not res!74843) (not e!59705))))

(declare-fun lt!137369 () (_ BitVec 64))

(declare-fun lt!137365 () (_ BitVec 64))

(declare-fun lt!137368 () (_ BitVec 64))

(assert (=> d!28244 (= res!74843 (= lt!137365 (bvsub lt!137368 lt!137369)))))

(assert (=> d!28244 (or (= (bvand lt!137368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137369 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137368 lt!137369) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28244 (= lt!137369 (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))) ((_ sign_extend 32) (currentByte!4575 thiss!1151)) ((_ sign_extend 32) (currentBit!4570 thiss!1151))))))

(declare-fun lt!137366 () (_ BitVec 64))

(declare-fun lt!137370 () (_ BitVec 64))

(assert (=> d!28244 (= lt!137368 (bvmul lt!137366 lt!137370))))

(assert (=> d!28244 (or (= lt!137366 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137370 (bvsdiv (bvmul lt!137366 lt!137370) lt!137366)))))

(assert (=> d!28244 (= lt!137370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28244 (= lt!137366 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))))))

(assert (=> d!28244 (= lt!137365 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4575 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4570 thiss!1151))))))

(assert (=> d!28244 (invariant!0 (currentBit!4570 thiss!1151) (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151)))))

(assert (=> d!28244 (= (bitIndex!0 (size!1913 (buf!2303 thiss!1151)) (currentByte!4575 thiss!1151) (currentBit!4570 thiss!1151)) lt!137365)))

(declare-fun b!90731 () Bool)

(declare-fun res!74842 () Bool)

(assert (=> b!90731 (=> (not res!74842) (not e!59705))))

(assert (=> b!90731 (= res!74842 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137365))))

(declare-fun b!90732 () Bool)

(declare-fun lt!137367 () (_ BitVec 64))

(assert (=> b!90732 (= e!59705 (bvsle lt!137365 (bvmul lt!137367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90732 (or (= lt!137367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137367)))))

(assert (=> b!90732 (= lt!137367 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))))))

(assert (= (and d!28244 res!74843) b!90731))

(assert (= (and b!90731 res!74842) b!90732))

(declare-fun m!135103 () Bool)

(assert (=> d!28244 m!135103))

(assert (=> d!28244 m!134881))

(assert (=> b!90401 d!28244))

(declare-fun d!28246 () Bool)

(declare-fun e!59706 () Bool)

(assert (=> d!28246 e!59706))

(declare-fun res!74845 () Bool)

(assert (=> d!28246 (=> (not res!74845) (not e!59706))))

(declare-fun lt!137375 () (_ BitVec 64))

(declare-fun lt!137371 () (_ BitVec 64))

(declare-fun lt!137374 () (_ BitVec 64))

(assert (=> d!28246 (= res!74845 (= lt!137371 (bvsub lt!137374 lt!137375)))))

(assert (=> d!28246 (or (= (bvand lt!137374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137374 lt!137375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28246 (= lt!137375 (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 (_1!4013 lt!137139)))) ((_ sign_extend 32) (currentByte!4575 (_1!4013 lt!137139))) ((_ sign_extend 32) (currentBit!4570 (_1!4013 lt!137139)))))))

(declare-fun lt!137372 () (_ BitVec 64))

(declare-fun lt!137376 () (_ BitVec 64))

(assert (=> d!28246 (= lt!137374 (bvmul lt!137372 lt!137376))))

(assert (=> d!28246 (or (= lt!137372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137376 (bvsdiv (bvmul lt!137372 lt!137376) lt!137372)))))

(assert (=> d!28246 (= lt!137376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28246 (= lt!137372 ((_ sign_extend 32) (size!1913 (buf!2303 (_1!4013 lt!137139)))))))

(assert (=> d!28246 (= lt!137371 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4575 (_1!4013 lt!137139))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4570 (_1!4013 lt!137139)))))))

(assert (=> d!28246 (invariant!0 (currentBit!4570 (_1!4013 lt!137139)) (currentByte!4575 (_1!4013 lt!137139)) (size!1913 (buf!2303 (_1!4013 lt!137139))))))

(assert (=> d!28246 (= (bitIndex!0 (size!1913 (buf!2303 (_1!4013 lt!137139))) (currentByte!4575 (_1!4013 lt!137139)) (currentBit!4570 (_1!4013 lt!137139))) lt!137371)))

(declare-fun b!90733 () Bool)

(declare-fun res!74844 () Bool)

(assert (=> b!90733 (=> (not res!74844) (not e!59706))))

(assert (=> b!90733 (= res!74844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137371))))

(declare-fun b!90734 () Bool)

(declare-fun lt!137373 () (_ BitVec 64))

(assert (=> b!90734 (= e!59706 (bvsle lt!137371 (bvmul lt!137373 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90734 (or (= lt!137373 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137373 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137373)))))

(assert (=> b!90734 (= lt!137373 ((_ sign_extend 32) (size!1913 (buf!2303 (_1!4013 lt!137139)))))))

(assert (= (and d!28246 res!74845) b!90733))

(assert (= (and b!90733 res!74844) b!90734))

(declare-fun m!135105 () Bool)

(assert (=> d!28246 m!135105))

(declare-fun m!135107 () Bool)

(assert (=> d!28246 m!135107))

(assert (=> b!90391 d!28246))

(declare-fun d!28248 () Bool)

(assert (=> d!28248 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))) ((_ sign_extend 32) (currentByte!4575 thiss!1151)) ((_ sign_extend 32) (currentBit!4570 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1151))) ((_ sign_extend 32) (currentByte!4575 thiss!1151)) ((_ sign_extend 32) (currentBit!4570 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6980 () Bool)

(assert (= bs!6980 d!28248))

(assert (=> bs!6980 m!135103))

(assert (=> b!90397 d!28248))

(declare-fun d!28250 () Bool)

(assert (=> d!28250 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152) (size!1913 (buf!2303 thiss!1152))))))

(declare-fun bs!6981 () Bool)

(assert (= bs!6981 d!28250))

(assert (=> bs!6981 m!134883))

(assert (=> start!18250 d!28250))

(declare-fun d!28252 () Bool)

(assert (=> d!28252 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4570 thiss!1151) (currentByte!4575 thiss!1151) (size!1913 (buf!2303 thiss!1151))))))

(declare-fun bs!6982 () Bool)

(assert (= bs!6982 d!28252))

(assert (=> bs!6982 m!134881))

(assert (=> start!18250 d!28252))

(declare-fun d!28254 () Bool)

(assert (=> d!28254 (= (array_inv!1759 (buf!2303 thiss!1152)) (bvsge (size!1913 (buf!2303 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90398 d!28254))

(declare-fun d!28256 () Bool)

(assert (=> d!28256 (= (array_inv!1759 (buf!2303 thiss!1151)) (bvsge (size!1913 (buf!2303 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90388 d!28256))

(declare-fun d!28258 () Bool)

(assert (=> d!28258 (= (invariant!0 (currentBit!4570 (_2!4012 lt!137137)) (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137)))) (and (bvsge (currentBit!4570 (_2!4012 lt!137137)) #b00000000000000000000000000000000) (bvslt (currentBit!4570 (_2!4012 lt!137137)) #b00000000000000000000000000001000) (bvsge (currentByte!4575 (_2!4012 lt!137137)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137)))) (and (= (currentBit!4570 (_2!4012 lt!137137)) #b00000000000000000000000000000000) (= (currentByte!4575 (_2!4012 lt!137137)) (size!1913 (buf!2303 (_2!4012 lt!137137))))))))))

(assert (=> b!90399 d!28258))

(declare-fun d!28260 () Bool)

(declare-fun e!59718 () Bool)

(assert (=> d!28260 e!59718))

(declare-fun res!74868 () Bool)

(assert (=> d!28260 (=> (not res!74868) (not e!59718))))

(declare-fun lt!137397 () tuple2!7540)

(assert (=> d!28260 (= res!74868 (= (size!1913 (buf!2303 thiss!1152)) (size!1913 (buf!2303 (_2!4012 lt!137397)))))))

(declare-fun choose!16 (BitStream!3388 Bool) tuple2!7540)

(assert (=> d!28260 (= lt!137397 (choose!16 thiss!1152 lt!137136))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28260 (validate_offset_bit!0 ((_ sign_extend 32) (size!1913 (buf!2303 thiss!1152))) ((_ sign_extend 32) (currentByte!4575 thiss!1152)) ((_ sign_extend 32) (currentBit!4570 thiss!1152)))))

(assert (=> d!28260 (= (appendBit!0 thiss!1152 lt!137136) lt!137397)))

(declare-fun b!90759 () Bool)

(declare-fun e!59717 () Bool)

(assert (=> b!90759 (= e!59718 e!59717)))

(declare-fun res!74867 () Bool)

(assert (=> b!90759 (=> (not res!74867) (not e!59717))))

(declare-fun lt!137399 () tuple2!7542)

(assert (=> b!90759 (= res!74867 (and (= (_2!4013 lt!137399) lt!137136) (= (_1!4013 lt!137399) (_2!4012 lt!137397))))))

(assert (=> b!90759 (= lt!137399 (readBitPure!0 (readerFrom!0 (_2!4012 lt!137397) (currentBit!4570 thiss!1152) (currentByte!4575 thiss!1152))))))

(declare-fun b!90757 () Bool)

(declare-fun res!74866 () Bool)

(assert (=> b!90757 (=> (not res!74866) (not e!59718))))

(declare-fun lt!137400 () (_ BitVec 64))

(declare-fun lt!137398 () (_ BitVec 64))

(assert (=> b!90757 (= res!74866 (= (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137397))) (currentByte!4575 (_2!4012 lt!137397)) (currentBit!4570 (_2!4012 lt!137397))) (bvadd lt!137398 lt!137400)))))

(assert (=> b!90757 (or (not (= (bvand lt!137398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137400 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137398 lt!137400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90757 (= lt!137400 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90757 (= lt!137398 (bitIndex!0 (size!1913 (buf!2303 thiss!1152)) (currentByte!4575 thiss!1152) (currentBit!4570 thiss!1152)))))

(declare-fun b!90758 () Bool)

(declare-fun res!74869 () Bool)

(assert (=> b!90758 (=> (not res!74869) (not e!59718))))

(assert (=> b!90758 (= res!74869 (isPrefixOf!0 thiss!1152 (_2!4012 lt!137397)))))

(declare-fun b!90760 () Bool)

(assert (=> b!90760 (= e!59717 (= (bitIndex!0 (size!1913 (buf!2303 (_1!4013 lt!137399))) (currentByte!4575 (_1!4013 lt!137399)) (currentBit!4570 (_1!4013 lt!137399))) (bitIndex!0 (size!1913 (buf!2303 (_2!4012 lt!137397))) (currentByte!4575 (_2!4012 lt!137397)) (currentBit!4570 (_2!4012 lt!137397)))))))

(assert (= (and d!28260 res!74868) b!90757))

(assert (= (and b!90757 res!74866) b!90758))

(assert (= (and b!90758 res!74869) b!90759))

(assert (= (and b!90759 res!74867) b!90760))

(declare-fun m!135123 () Bool)

(assert (=> d!28260 m!135123))

(declare-fun m!135125 () Bool)

(assert (=> d!28260 m!135125))

(declare-fun m!135127 () Bool)

(assert (=> b!90760 m!135127))

(declare-fun m!135129 () Bool)

(assert (=> b!90760 m!135129))

(assert (=> b!90757 m!135129))

(assert (=> b!90757 m!134877))

(declare-fun m!135131 () Bool)

(assert (=> b!90758 m!135131))

(declare-fun m!135133 () Bool)

(assert (=> b!90759 m!135133))

(assert (=> b!90759 m!135133))

(declare-fun m!135135 () Bool)

(assert (=> b!90759 m!135135))

(assert (=> b!90399 d!28260))

(push 1)

(assert (not b!90757))

(assert (not b!90681))

(assert (not b!90719))

(assert (not b!90680))

(assert (not d!28250))

(assert (not b!90685))

(assert (not b!90688))

(assert (not d!28208))

(assert (not b!90728))

(assert (not d!28160))

(assert (not b!90693))

(assert (not d!28252))

(assert (not b!90683))

(assert (not d!28260))

(assert (not d!28246))

(assert (not b!90692))

(assert (not b!90760))

(assert (not b!90694))

(assert (not b!90759))

(assert (not d!28164))

(assert (not d!28244))

(assert (not d!28222))

(assert (not b!90691))

(assert (not d!28224))

(assert (not b!90690))

(assert (not b!90682))

(assert (not b!90726))

(assert (not d!28242))

(assert (not d!28248))

(assert (not b!90758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

