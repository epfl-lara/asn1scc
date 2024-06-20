; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18382 () Bool)

(assert start!18382)

(declare-fun b!91216 () Bool)

(declare-fun e!59988 () Bool)

(declare-datatypes ((array!4266 0))(
  ( (array!4267 (arr!2559 (Array (_ BitVec 32) (_ BitVec 8))) (size!1922 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3406 0))(
  ( (BitStream!3407 (buf!2312 array!4266) (currentByte!4602 (_ BitVec 32)) (currentBit!4597 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7588 0))(
  ( (tuple2!7589 (_1!4039 BitStream!3406) (_2!4039 Bool)) )
))
(declare-fun lt!137676 () tuple2!7588)

(declare-fun lt!137677 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91216 (= e!59988 (= (bitIndex!0 (size!1922 (buf!2312 (_1!4039 lt!137676))) (currentByte!4602 (_1!4039 lt!137676)) (currentBit!4597 (_1!4039 lt!137676))) lt!137677))))

(declare-fun b!91217 () Bool)

(declare-fun res!75285 () Bool)

(declare-fun e!59992 () Bool)

(assert (=> b!91217 (=> res!75285 e!59992)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!91217 (= res!75285 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!91218 () Bool)

(declare-fun res!75296 () Bool)

(declare-fun e!59986 () Bool)

(assert (=> b!91218 (=> (not res!75296) (not e!59986))))

(declare-fun thiss!1152 () BitStream!3406)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91218 (= res!75296 (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))) ((_ sign_extend 32) (currentByte!4602 thiss!1152)) ((_ sign_extend 32) (currentBit!4597 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91219 () Bool)

(declare-fun res!75290 () Bool)

(declare-fun e!59987 () Bool)

(assert (=> b!91219 (=> (not res!75290) (not e!59987))))

(declare-fun thiss!1151 () BitStream!3406)

(assert (=> b!91219 (= res!75290 (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))) ((_ sign_extend 32) (currentByte!4602 thiss!1151)) ((_ sign_extend 32) (currentBit!4597 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91220 () Bool)

(declare-fun e!59991 () Bool)

(assert (=> b!91220 (= e!59991 e!59988)))

(declare-fun res!75301 () Bool)

(assert (=> b!91220 (=> (not res!75301) (not e!59988))))

(declare-datatypes ((Unit!5836 0))(
  ( (Unit!5837) )
))
(declare-datatypes ((tuple2!7590 0))(
  ( (tuple2!7591 (_1!4040 Unit!5836) (_2!4040 BitStream!3406)) )
))
(declare-fun lt!137679 () tuple2!7590)

(declare-fun lt!137678 () Bool)

(assert (=> b!91220 (= res!75301 (and (= (_2!4039 lt!137676) lt!137678) (= (_1!4039 lt!137676) (_2!4040 lt!137679))))))

(declare-fun readBitPure!0 (BitStream!3406) tuple2!7588)

(declare-fun readerFrom!0 (BitStream!3406 (_ BitVec 32) (_ BitVec 32)) BitStream!3406)

(assert (=> b!91220 (= lt!137676 (readBitPure!0 (readerFrom!0 (_2!4040 lt!137679) (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152))))))

(declare-fun b!91221 () Bool)

(declare-fun e!59984 () Bool)

(declare-fun array_inv!1768 (array!4266) Bool)

(assert (=> b!91221 (= e!59984 (array_inv!1768 (buf!2312 thiss!1151)))))

(declare-fun res!75295 () Bool)

(assert (=> start!18382 (=> (not res!75295) (not e!59987))))

(assert (=> start!18382 (= res!75295 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18382 e!59987))

(declare-fun e!59985 () Bool)

(declare-fun inv!12 (BitStream!3406) Bool)

(assert (=> start!18382 (and (inv!12 thiss!1152) e!59985)))

(assert (=> start!18382 (and (inv!12 thiss!1151) e!59984)))

(assert (=> start!18382 true))

(declare-fun b!91222 () Bool)

(declare-fun res!75291 () Bool)

(assert (=> b!91222 (=> (not res!75291) (not e!59991))))

(declare-fun isPrefixOf!0 (BitStream!3406 BitStream!3406) Bool)

(assert (=> b!91222 (= res!75291 (isPrefixOf!0 thiss!1152 (_2!4040 lt!137679)))))

(declare-fun b!91223 () Bool)

(declare-fun res!75297 () Bool)

(assert (=> b!91223 (=> (not res!75297) (not e!59987))))

(assert (=> b!91223 (= res!75297 (and (bvsle i!576 nBits!336) (= (size!1922 (buf!2312 thiss!1152)) (size!1922 (buf!2312 thiss!1151)))))))

(declare-fun b!91224 () Bool)

(assert (=> b!91224 (= e!59986 (not e!59992))))

(declare-fun res!75292 () Bool)

(assert (=> b!91224 (=> res!75292 e!59992)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91224 (= res!75292 (not (invariant!0 (currentBit!4597 (_2!4040 lt!137679)) (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679))))))))

(declare-fun e!59994 () Bool)

(assert (=> b!91224 e!59994))

(declare-fun res!75289 () Bool)

(assert (=> b!91224 (=> (not res!75289) (not e!59994))))

(assert (=> b!91224 (= res!75289 (= (size!1922 (buf!2312 thiss!1152)) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(declare-fun appendBit!0 (BitStream!3406 Bool) tuple2!7590)

(assert (=> b!91224 (= lt!137679 (appendBit!0 thiss!1152 lt!137678))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91224 (= lt!137678 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91225 () Bool)

(declare-fun res!75300 () Bool)

(assert (=> b!91225 (=> (not res!75300) (not e!59987))))

(assert (=> b!91225 (= res!75300 (invariant!0 (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152))))))

(declare-fun b!91226 () Bool)

(declare-fun e!59989 () Bool)

(assert (=> b!91226 (= e!59989 (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))) ((_ sign_extend 32) (currentByte!4602 (_2!4040 lt!137679))) ((_ sign_extend 32) (currentBit!4597 (_2!4040 lt!137679))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91227 () Bool)

(declare-fun res!75287 () Bool)

(assert (=> b!91227 (=> (not res!75287) (not e!59986))))

(assert (=> b!91227 (= res!75287 (bvslt i!576 nBits!336))))

(declare-fun b!91228 () Bool)

(assert (=> b!91228 (= e!59994 e!59991)))

(declare-fun res!75288 () Bool)

(assert (=> b!91228 (=> (not res!75288) (not e!59991))))

(declare-fun lt!137674 () (_ BitVec 64))

(assert (=> b!91228 (= res!75288 (= lt!137677 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137674)))))

(assert (=> b!91228 (= lt!137677 (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137679))) (currentByte!4602 (_2!4040 lt!137679)) (currentBit!4597 (_2!4040 lt!137679))))))

(declare-fun b!91229 () Bool)

(assert (=> b!91229 (= e!59985 (array_inv!1768 (buf!2312 thiss!1152)))))

(declare-fun b!91230 () Bool)

(assert (=> b!91230 (= e!59992 e!59989)))

(declare-fun res!75294 () Bool)

(assert (=> b!91230 (=> (not res!75294) (not e!59989))))

(assert (=> b!91230 (= res!75294 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1922 (buf!2312 (_2!4040 lt!137679))) (size!1922 (buf!2312 thiss!1151)))))))

(declare-fun b!91231 () Bool)

(declare-fun res!75298 () Bool)

(assert (=> b!91231 (=> (not res!75298) (not e!59989))))

(declare-fun lt!137675 () (_ BitVec 64))

(assert (=> b!91231 (= res!75298 (= (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137679))) (currentByte!4602 (_2!4040 lt!137679)) (currentBit!4597 (_2!4040 lt!137679))) (bvadd lt!137675 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91232 () Bool)

(declare-fun res!75299 () Bool)

(assert (=> b!91232 (=> (not res!75299) (not e!59987))))

(assert (=> b!91232 (= res!75299 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91233 () Bool)

(declare-fun res!75293 () Bool)

(assert (=> b!91233 (=> (not res!75293) (not e!59987))))

(assert (=> b!91233 (= res!75293 (invariant!0 (currentBit!4597 thiss!1151) (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151))))))

(declare-fun b!91234 () Bool)

(assert (=> b!91234 (= e!59987 e!59986)))

(declare-fun res!75286 () Bool)

(assert (=> b!91234 (=> (not res!75286) (not e!59986))))

(assert (=> b!91234 (= res!75286 (= lt!137674 (bvadd lt!137675 ((_ sign_extend 32) i!576))))))

(assert (=> b!91234 (= lt!137674 (bitIndex!0 (size!1922 (buf!2312 thiss!1152)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152)))))

(assert (=> b!91234 (= lt!137675 (bitIndex!0 (size!1922 (buf!2312 thiss!1151)) (currentByte!4602 thiss!1151) (currentBit!4597 thiss!1151)))))

(assert (= (and start!18382 res!75295) b!91219))

(assert (= (and b!91219 res!75290) b!91233))

(assert (= (and b!91233 res!75293) b!91232))

(assert (= (and b!91232 res!75299) b!91225))

(assert (= (and b!91225 res!75300) b!91223))

(assert (= (and b!91223 res!75297) b!91234))

(assert (= (and b!91234 res!75286) b!91218))

(assert (= (and b!91218 res!75296) b!91227))

(assert (= (and b!91227 res!75287) b!91224))

(assert (= (and b!91224 res!75289) b!91228))

(assert (= (and b!91228 res!75288) b!91222))

(assert (= (and b!91222 res!75291) b!91220))

(assert (= (and b!91220 res!75301) b!91216))

(assert (= (and b!91224 (not res!75292)) b!91217))

(assert (= (and b!91217 (not res!75285)) b!91230))

(assert (= (and b!91230 res!75294) b!91231))

(assert (= (and b!91231 res!75298) b!91226))

(assert (= start!18382 b!91229))

(assert (= start!18382 b!91221))

(declare-fun m!135431 () Bool)

(assert (=> start!18382 m!135431))

(declare-fun m!135433 () Bool)

(assert (=> start!18382 m!135433))

(declare-fun m!135435 () Bool)

(assert (=> b!91222 m!135435))

(declare-fun m!135437 () Bool)

(assert (=> b!91216 m!135437))

(declare-fun m!135439 () Bool)

(assert (=> b!91218 m!135439))

(declare-fun m!135441 () Bool)

(assert (=> b!91219 m!135441))

(declare-fun m!135443 () Bool)

(assert (=> b!91225 m!135443))

(declare-fun m!135445 () Bool)

(assert (=> b!91226 m!135445))

(declare-fun m!135447 () Bool)

(assert (=> b!91233 m!135447))

(declare-fun m!135449 () Bool)

(assert (=> b!91228 m!135449))

(declare-fun m!135451 () Bool)

(assert (=> b!91221 m!135451))

(declare-fun m!135453 () Bool)

(assert (=> b!91220 m!135453))

(assert (=> b!91220 m!135453))

(declare-fun m!135455 () Bool)

(assert (=> b!91220 m!135455))

(declare-fun m!135457 () Bool)

(assert (=> b!91224 m!135457))

(declare-fun m!135459 () Bool)

(assert (=> b!91224 m!135459))

(declare-fun m!135461 () Bool)

(assert (=> b!91234 m!135461))

(declare-fun m!135463 () Bool)

(assert (=> b!91234 m!135463))

(declare-fun m!135465 () Bool)

(assert (=> b!91229 m!135465))

(assert (=> b!91231 m!135449))

(push 1)

(assert (not b!91220))

(assert (not b!91221))

(assert (not b!91231))

(assert (not b!91216))

(assert (not b!91228))

(assert (not start!18382))

(assert (not b!91226))

(assert (not b!91225))

(assert (not b!91224))

(assert (not b!91219))

(assert (not b!91218))

(assert (not b!91234))

(assert (not b!91233))

(assert (not b!91222))

(assert (not b!91229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28414 () Bool)

(assert (=> d!28414 (= (array_inv!1768 (buf!2312 thiss!1151)) (bvsge (size!1922 (buf!2312 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!91221 d!28414))

(declare-fun d!28416 () Bool)

(declare-datatypes ((tuple2!7602 0))(
  ( (tuple2!7603 (_1!4046 Bool) (_2!4046 BitStream!3406)) )
))
(declare-fun lt!137772 () tuple2!7602)

(declare-fun readBit!0 (BitStream!3406) tuple2!7602)

(assert (=> d!28416 (= lt!137772 (readBit!0 (readerFrom!0 (_2!4040 lt!137679) (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152))))))

(assert (=> d!28416 (= (readBitPure!0 (readerFrom!0 (_2!4040 lt!137679) (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152))) (tuple2!7589 (_2!4046 lt!137772) (_1!4046 lt!137772)))))

(declare-fun bs!7015 () Bool)

(assert (= bs!7015 d!28416))

(assert (=> bs!7015 m!135453))

(declare-fun m!135575 () Bool)

(assert (=> bs!7015 m!135575))

(assert (=> b!91220 d!28416))

(declare-fun d!28424 () Bool)

(declare-fun e!60087 () Bool)

(assert (=> d!28424 e!60087))

(declare-fun res!75448 () Bool)

(assert (=> d!28424 (=> (not res!75448) (not e!60087))))

(assert (=> d!28424 (= res!75448 (invariant!0 (currentBit!4597 (_2!4040 lt!137679)) (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(assert (=> d!28424 (= (readerFrom!0 (_2!4040 lt!137679) (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152)) (BitStream!3407 (buf!2312 (_2!4040 lt!137679)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152)))))

(declare-fun b!91391 () Bool)

(assert (=> b!91391 (= e!60087 (invariant!0 (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(assert (= (and d!28424 res!75448) b!91391))

(assert (=> d!28424 m!135457))

(declare-fun m!135577 () Bool)

(assert (=> b!91391 m!135577))

(assert (=> b!91220 d!28424))

(declare-fun d!28426 () Bool)

(declare-fun e!60103 () Bool)

(assert (=> d!28426 e!60103))

(declare-fun res!75478 () Bool)

(assert (=> d!28426 (=> (not res!75478) (not e!60103))))

(declare-fun lt!137816 () (_ BitVec 64))

(declare-fun lt!137820 () (_ BitVec 64))

(declare-fun lt!137819 () (_ BitVec 64))

(assert (=> d!28426 (= res!75478 (= lt!137819 (bvsub lt!137816 lt!137820)))))

(assert (=> d!28426 (or (= (bvand lt!137816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137816 lt!137820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28426 (= lt!137820 (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))) ((_ sign_extend 32) (currentByte!4602 (_2!4040 lt!137679))) ((_ sign_extend 32) (currentBit!4597 (_2!4040 lt!137679)))))))

(declare-fun lt!137815 () (_ BitVec 64))

(declare-fun lt!137817 () (_ BitVec 64))

(assert (=> d!28426 (= lt!137816 (bvmul lt!137815 lt!137817))))

(assert (=> d!28426 (or (= lt!137815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137817 (bvsdiv (bvmul lt!137815 lt!137817) lt!137815)))))

(assert (=> d!28426 (= lt!137817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28426 (= lt!137815 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(assert (=> d!28426 (= lt!137819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4602 (_2!4040 lt!137679))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4597 (_2!4040 lt!137679)))))))

(assert (=> d!28426 (invariant!0 (currentBit!4597 (_2!4040 lt!137679)) (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679))))))

(assert (=> d!28426 (= (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137679))) (currentByte!4602 (_2!4040 lt!137679)) (currentBit!4597 (_2!4040 lt!137679))) lt!137819)))

(declare-fun b!91421 () Bool)

(declare-fun res!75477 () Bool)

(assert (=> b!91421 (=> (not res!75477) (not e!60103))))

(assert (=> b!91421 (= res!75477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137819))))

(declare-fun b!91422 () Bool)

(declare-fun lt!137818 () (_ BitVec 64))

(assert (=> b!91422 (= e!60103 (bvsle lt!137819 (bvmul lt!137818 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91422 (or (= lt!137818 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137818 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137818)))))

(assert (=> b!91422 (= lt!137818 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(assert (= (and d!28426 res!75478) b!91421))

(assert (= (and b!91421 res!75477) b!91422))

(declare-fun m!135597 () Bool)

(assert (=> d!28426 m!135597))

(assert (=> d!28426 m!135457))

(assert (=> b!91231 d!28426))

(declare-fun d!28440 () Bool)

(declare-fun e!60104 () Bool)

(assert (=> d!28440 e!60104))

(declare-fun res!75480 () Bool)

(assert (=> d!28440 (=> (not res!75480) (not e!60104))))

(declare-fun lt!137822 () (_ BitVec 64))

(declare-fun lt!137825 () (_ BitVec 64))

(declare-fun lt!137826 () (_ BitVec 64))

(assert (=> d!28440 (= res!75480 (= lt!137825 (bvsub lt!137822 lt!137826)))))

(assert (=> d!28440 (or (= (bvand lt!137822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137822 lt!137826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28440 (= lt!137826 (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))) ((_ sign_extend 32) (currentByte!4602 thiss!1152)) ((_ sign_extend 32) (currentBit!4597 thiss!1152))))))

(declare-fun lt!137821 () (_ BitVec 64))

(declare-fun lt!137823 () (_ BitVec 64))

(assert (=> d!28440 (= lt!137822 (bvmul lt!137821 lt!137823))))

(assert (=> d!28440 (or (= lt!137821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137823 (bvsdiv (bvmul lt!137821 lt!137823) lt!137821)))))

(assert (=> d!28440 (= lt!137823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28440 (= lt!137821 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))))))

(assert (=> d!28440 (= lt!137825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4602 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4597 thiss!1152))))))

(assert (=> d!28440 (invariant!0 (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152)))))

(assert (=> d!28440 (= (bitIndex!0 (size!1922 (buf!2312 thiss!1152)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152)) lt!137825)))

(declare-fun b!91423 () Bool)

(declare-fun res!75479 () Bool)

(assert (=> b!91423 (=> (not res!75479) (not e!60104))))

(assert (=> b!91423 (= res!75479 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137825))))

(declare-fun b!91424 () Bool)

(declare-fun lt!137824 () (_ BitVec 64))

(assert (=> b!91424 (= e!60104 (bvsle lt!137825 (bvmul lt!137824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91424 (or (= lt!137824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137824)))))

(assert (=> b!91424 (= lt!137824 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))))))

(assert (= (and d!28440 res!75480) b!91423))

(assert (= (and b!91423 res!75479) b!91424))

(declare-fun m!135599 () Bool)

(assert (=> d!28440 m!135599))

(assert (=> d!28440 m!135443))

(assert (=> b!91234 d!28440))

(declare-fun d!28442 () Bool)

(declare-fun e!60105 () Bool)

(assert (=> d!28442 e!60105))

(declare-fun res!75482 () Bool)

(assert (=> d!28442 (=> (not res!75482) (not e!60105))))

(declare-fun lt!137832 () (_ BitVec 64))

(declare-fun lt!137831 () (_ BitVec 64))

(declare-fun lt!137828 () (_ BitVec 64))

(assert (=> d!28442 (= res!75482 (= lt!137831 (bvsub lt!137828 lt!137832)))))

(assert (=> d!28442 (or (= (bvand lt!137828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137832 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137828 lt!137832) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28442 (= lt!137832 (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))) ((_ sign_extend 32) (currentByte!4602 thiss!1151)) ((_ sign_extend 32) (currentBit!4597 thiss!1151))))))

(declare-fun lt!137827 () (_ BitVec 64))

(declare-fun lt!137829 () (_ BitVec 64))

(assert (=> d!28442 (= lt!137828 (bvmul lt!137827 lt!137829))))

(assert (=> d!28442 (or (= lt!137827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137829 (bvsdiv (bvmul lt!137827 lt!137829) lt!137827)))))

(assert (=> d!28442 (= lt!137829 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28442 (= lt!137827 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))))))

(assert (=> d!28442 (= lt!137831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4602 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4597 thiss!1151))))))

(assert (=> d!28442 (invariant!0 (currentBit!4597 thiss!1151) (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151)))))

(assert (=> d!28442 (= (bitIndex!0 (size!1922 (buf!2312 thiss!1151)) (currentByte!4602 thiss!1151) (currentBit!4597 thiss!1151)) lt!137831)))

(declare-fun b!91425 () Bool)

(declare-fun res!75481 () Bool)

(assert (=> b!91425 (=> (not res!75481) (not e!60105))))

(assert (=> b!91425 (= res!75481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137831))))

(declare-fun b!91426 () Bool)

(declare-fun lt!137830 () (_ BitVec 64))

(assert (=> b!91426 (= e!60105 (bvsle lt!137831 (bvmul lt!137830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91426 (or (= lt!137830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137830)))))

(assert (=> b!91426 (= lt!137830 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))))))

(assert (= (and d!28442 res!75482) b!91425))

(assert (= (and b!91425 res!75481) b!91426))

(declare-fun m!135601 () Bool)

(assert (=> d!28442 m!135601))

(assert (=> d!28442 m!135447))

(assert (=> b!91234 d!28442))

(declare-fun d!28444 () Bool)

(assert (=> d!28444 (= (invariant!0 (currentBit!4597 (_2!4040 lt!137679)) (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679)))) (and (bvsge (currentBit!4597 (_2!4040 lt!137679)) #b00000000000000000000000000000000) (bvslt (currentBit!4597 (_2!4040 lt!137679)) #b00000000000000000000000000001000) (bvsge (currentByte!4602 (_2!4040 lt!137679)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679)))) (and (= (currentBit!4597 (_2!4040 lt!137679)) #b00000000000000000000000000000000) (= (currentByte!4602 (_2!4040 lt!137679)) (size!1922 (buf!2312 (_2!4040 lt!137679))))))))))

(assert (=> b!91224 d!28444))

(declare-fun b!91447 () Bool)

(declare-fun e!60116 () Bool)

(declare-fun e!60115 () Bool)

(assert (=> b!91447 (= e!60116 e!60115)))

(declare-fun res!75503 () Bool)

(assert (=> b!91447 (=> (not res!75503) (not e!60115))))

(declare-fun lt!137861 () tuple2!7588)

(declare-fun lt!137862 () tuple2!7590)

(assert (=> b!91447 (= res!75503 (and (= (_2!4039 lt!137861) lt!137678) (= (_1!4039 lt!137861) (_2!4040 lt!137862))))))

(assert (=> b!91447 (= lt!137861 (readBitPure!0 (readerFrom!0 (_2!4040 lt!137862) (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152))))))

(declare-fun b!91445 () Bool)

(declare-fun res!75501 () Bool)

(assert (=> b!91445 (=> (not res!75501) (not e!60116))))

(declare-fun lt!137859 () (_ BitVec 64))

(declare-fun lt!137860 () (_ BitVec 64))

(assert (=> b!91445 (= res!75501 (= (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137862))) (currentByte!4602 (_2!4040 lt!137862)) (currentBit!4597 (_2!4040 lt!137862))) (bvadd lt!137859 lt!137860)))))

(assert (=> b!91445 (or (not (= (bvand lt!137859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137859 lt!137860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91445 (= lt!137860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!91445 (= lt!137859 (bitIndex!0 (size!1922 (buf!2312 thiss!1152)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152)))))

(declare-fun b!91446 () Bool)

(declare-fun res!75502 () Bool)

(assert (=> b!91446 (=> (not res!75502) (not e!60116))))

(assert (=> b!91446 (= res!75502 (isPrefixOf!0 thiss!1152 (_2!4040 lt!137862)))))

(declare-fun b!91448 () Bool)

(assert (=> b!91448 (= e!60115 (= (bitIndex!0 (size!1922 (buf!2312 (_1!4039 lt!137861))) (currentByte!4602 (_1!4039 lt!137861)) (currentBit!4597 (_1!4039 lt!137861))) (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137862))) (currentByte!4602 (_2!4040 lt!137862)) (currentBit!4597 (_2!4040 lt!137862)))))))

(declare-fun d!28450 () Bool)

(assert (=> d!28450 e!60116))

(declare-fun res!75500 () Bool)

(assert (=> d!28450 (=> (not res!75500) (not e!60116))))

(assert (=> d!28450 (= res!75500 (= (size!1922 (buf!2312 thiss!1152)) (size!1922 (buf!2312 (_2!4040 lt!137862)))))))

(declare-fun choose!16 (BitStream!3406 Bool) tuple2!7590)

(assert (=> d!28450 (= lt!137862 (choose!16 thiss!1152 lt!137678))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28450 (validate_offset_bit!0 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))) ((_ sign_extend 32) (currentByte!4602 thiss!1152)) ((_ sign_extend 32) (currentBit!4597 thiss!1152)))))

(assert (=> d!28450 (= (appendBit!0 thiss!1152 lt!137678) lt!137862)))

(assert (= (and d!28450 res!75500) b!91445))

(assert (= (and b!91445 res!75501) b!91446))

(assert (= (and b!91446 res!75502) b!91447))

(assert (= (and b!91447 res!75503) b!91448))

(declare-fun m!135609 () Bool)

(assert (=> b!91447 m!135609))

(assert (=> b!91447 m!135609))

(declare-fun m!135611 () Bool)

(assert (=> b!91447 m!135611))

(declare-fun m!135613 () Bool)

(assert (=> b!91446 m!135613))

(declare-fun m!135615 () Bool)

(assert (=> d!28450 m!135615))

(declare-fun m!135617 () Bool)

(assert (=> d!28450 m!135617))

(declare-fun m!135619 () Bool)

(assert (=> b!91448 m!135619))

(declare-fun m!135621 () Bool)

(assert (=> b!91448 m!135621))

(assert (=> b!91445 m!135621))

(assert (=> b!91445 m!135461))

(assert (=> b!91224 d!28450))

(declare-fun d!28458 () Bool)

(assert (=> d!28458 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152))))))

(declare-fun bs!7020 () Bool)

(assert (= bs!7020 d!28458))

(assert (=> bs!7020 m!135443))

(assert (=> start!18382 d!28458))

(declare-fun d!28460 () Bool)

(assert (=> d!28460 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4597 thiss!1151) (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151))))))

(declare-fun bs!7021 () Bool)

(assert (= bs!7021 d!28460))

(assert (=> bs!7021 m!135447))

(assert (=> start!18382 d!28460))

(declare-fun d!28462 () Bool)

(declare-fun res!75510 () Bool)

(declare-fun e!60122 () Bool)

(assert (=> d!28462 (=> (not res!75510) (not e!60122))))

(assert (=> d!28462 (= res!75510 (= (size!1922 (buf!2312 thiss!1152)) (size!1922 (buf!2312 (_2!4040 lt!137679)))))))

(assert (=> d!28462 (= (isPrefixOf!0 thiss!1152 (_2!4040 lt!137679)) e!60122)))

(declare-fun b!91455 () Bool)

(declare-fun res!75512 () Bool)

(assert (=> b!91455 (=> (not res!75512) (not e!60122))))

(assert (=> b!91455 (= res!75512 (bvsle (bitIndex!0 (size!1922 (buf!2312 thiss!1152)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152)) (bitIndex!0 (size!1922 (buf!2312 (_2!4040 lt!137679))) (currentByte!4602 (_2!4040 lt!137679)) (currentBit!4597 (_2!4040 lt!137679)))))))

(declare-fun b!91456 () Bool)

(declare-fun e!60121 () Bool)

(assert (=> b!91456 (= e!60122 e!60121)))

(declare-fun res!75511 () Bool)

(assert (=> b!91456 (=> res!75511 e!60121)))

(assert (=> b!91456 (= res!75511 (= (size!1922 (buf!2312 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!91457 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4266 array!4266 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91457 (= e!60121 (arrayBitRangesEq!0 (buf!2312 thiss!1152) (buf!2312 (_2!4040 lt!137679)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1922 (buf!2312 thiss!1152)) (currentByte!4602 thiss!1152) (currentBit!4597 thiss!1152))))))

(assert (= (and d!28462 res!75510) b!91455))

(assert (= (and b!91455 res!75512) b!91456))

(assert (= (and b!91456 (not res!75511)) b!91457))

(assert (=> b!91455 m!135461))

(assert (=> b!91455 m!135449))

(assert (=> b!91457 m!135461))

(assert (=> b!91457 m!135461))

(declare-fun m!135623 () Bool)

(assert (=> b!91457 m!135623))

(assert (=> b!91222 d!28462))

(declare-fun d!28464 () Bool)

(assert (=> d!28464 (= (invariant!0 (currentBit!4597 thiss!1151) (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151))) (and (bvsge (currentBit!4597 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4597 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4602 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151))) (and (= (currentBit!4597 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4602 thiss!1151) (size!1922 (buf!2312 thiss!1151)))))))))

(assert (=> b!91233 d!28464))

(declare-fun d!28466 () Bool)

(assert (=> d!28466 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))) ((_ sign_extend 32) (currentByte!4602 (_2!4040 lt!137679))) ((_ sign_extend 32) (currentBit!4597 (_2!4040 lt!137679))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 (_2!4040 lt!137679)))) ((_ sign_extend 32) (currentByte!4602 (_2!4040 lt!137679))) ((_ sign_extend 32) (currentBit!4597 (_2!4040 lt!137679)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!7022 () Bool)

(assert (= bs!7022 d!28466))

(assert (=> bs!7022 m!135597))

(assert (=> b!91226 d!28466))

(declare-fun d!28468 () Bool)

(declare-fun e!60123 () Bool)

(assert (=> d!28468 e!60123))

(declare-fun res!75514 () Bool)

(assert (=> d!28468 (=> (not res!75514) (not e!60123))))

(declare-fun lt!137868 () (_ BitVec 64))

(declare-fun lt!137867 () (_ BitVec 64))

(declare-fun lt!137864 () (_ BitVec 64))

(assert (=> d!28468 (= res!75514 (= lt!137867 (bvsub lt!137864 lt!137868)))))

(assert (=> d!28468 (or (= (bvand lt!137864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137864 lt!137868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28468 (= lt!137868 (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 (_1!4039 lt!137676)))) ((_ sign_extend 32) (currentByte!4602 (_1!4039 lt!137676))) ((_ sign_extend 32) (currentBit!4597 (_1!4039 lt!137676)))))))

(declare-fun lt!137863 () (_ BitVec 64))

(declare-fun lt!137865 () (_ BitVec 64))

(assert (=> d!28468 (= lt!137864 (bvmul lt!137863 lt!137865))))

(assert (=> d!28468 (or (= lt!137863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137865 (bvsdiv (bvmul lt!137863 lt!137865) lt!137863)))))

(assert (=> d!28468 (= lt!137865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28468 (= lt!137863 ((_ sign_extend 32) (size!1922 (buf!2312 (_1!4039 lt!137676)))))))

(assert (=> d!28468 (= lt!137867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4602 (_1!4039 lt!137676))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4597 (_1!4039 lt!137676)))))))

(assert (=> d!28468 (invariant!0 (currentBit!4597 (_1!4039 lt!137676)) (currentByte!4602 (_1!4039 lt!137676)) (size!1922 (buf!2312 (_1!4039 lt!137676))))))

(assert (=> d!28468 (= (bitIndex!0 (size!1922 (buf!2312 (_1!4039 lt!137676))) (currentByte!4602 (_1!4039 lt!137676)) (currentBit!4597 (_1!4039 lt!137676))) lt!137867)))

(declare-fun b!91458 () Bool)

(declare-fun res!75513 () Bool)

(assert (=> b!91458 (=> (not res!75513) (not e!60123))))

(assert (=> b!91458 (= res!75513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137867))))

(declare-fun b!91459 () Bool)

(declare-fun lt!137866 () (_ BitVec 64))

(assert (=> b!91459 (= e!60123 (bvsle lt!137867 (bvmul lt!137866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91459 (or (= lt!137866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137866)))))

(assert (=> b!91459 (= lt!137866 ((_ sign_extend 32) (size!1922 (buf!2312 (_1!4039 lt!137676)))))))

(assert (= (and d!28468 res!75514) b!91458))

(assert (= (and b!91458 res!75513) b!91459))

(declare-fun m!135625 () Bool)

(assert (=> d!28468 m!135625))

(declare-fun m!135627 () Bool)

(assert (=> d!28468 m!135627))

(assert (=> b!91216 d!28468))

(declare-fun d!28470 () Bool)

(assert (=> d!28470 (= (invariant!0 (currentBit!4597 thiss!1152) (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152))) (and (bvsge (currentBit!4597 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4597 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4602 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152))) (and (= (currentBit!4597 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4602 thiss!1152) (size!1922 (buf!2312 thiss!1152)))))))))

(assert (=> b!91225 d!28470))

(declare-fun d!28472 () Bool)

(assert (=> d!28472 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))) ((_ sign_extend 32) (currentByte!4602 thiss!1152)) ((_ sign_extend 32) (currentBit!4597 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1152))) ((_ sign_extend 32) (currentByte!4602 thiss!1152)) ((_ sign_extend 32) (currentBit!4597 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!7023 () Bool)

(assert (= bs!7023 d!28472))

(assert (=> bs!7023 m!135599))

(assert (=> b!91218 d!28472))

(declare-fun d!28474 () Bool)

(assert (=> d!28474 (= (array_inv!1768 (buf!2312 thiss!1152)) (bvsge (size!1922 (buf!2312 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!91229 d!28474))

(declare-fun d!28476 () Bool)

(assert (=> d!28476 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))) ((_ sign_extend 32) (currentByte!4602 thiss!1151)) ((_ sign_extend 32) (currentBit!4597 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1922 (buf!2312 thiss!1151))) ((_ sign_extend 32) (currentByte!4602 thiss!1151)) ((_ sign_extend 32) (currentBit!4597 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!7024 () Bool)

(assert (= bs!7024 d!28476))

(assert (=> bs!7024 m!135601))

(assert (=> b!91219 d!28476))

(assert (=> b!91228 d!28426))

(push 1)

(assert (not d!28466))

(assert (not d!28440))

(assert (not b!91391))

(assert (not d!28476))

(assert (not d!28450))

(assert (not b!91445))

(assert (not d!28460))

(assert (not d!28424))

(assert (not d!28416))

(assert (not d!28442))

(assert (not b!91447))

(assert (not b!91455))

(assert (not d!28468))

(assert (not d!28458))

(assert (not d!28472))

(assert (not b!91448))

(assert (not b!91446))

(assert (not b!91457))

(assert (not d!28426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

