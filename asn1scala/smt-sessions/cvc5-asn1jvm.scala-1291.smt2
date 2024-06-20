; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36724 () Bool)

(assert start!36724)

(declare-datatypes ((array!8757 0))(
  ( (array!8758 (arr!4807 (Array (_ BitVec 32) (_ BitVec 8))) (size!3886 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6928 0))(
  ( (BitStream!6929 (buf!4338 array!8757) (currentByte!8214 (_ BitVec 32)) (currentBit!8209 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11708 0))(
  ( (Unit!11709) )
))
(declare-datatypes ((tuple3!954 0))(
  ( (tuple3!955 (_1!7921 Unit!11708) (_2!7921 (_ BitVec 8)) (_3!603 BitStream!6928)) )
))
(declare-fun e!116980 () tuple3!954)

(declare-fun b!168379 () Bool)

(declare-fun thiss!1894 () BitStream!6928)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((tuple2!14636 0))(
  ( (tuple2!14637 (_1!7922 Unit!11708) (_2!7922 BitStream!6928)) )
))
(declare-fun lt!261660 () tuple2!14636)

(assert (=> b!168379 (= e!116980 (tuple3!955 (_1!7922 lt!261660) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4807 (buf!4338 thiss!1894)) (currentByte!8214 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8209 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7922 lt!261660)))))

(declare-fun moveBitIndex!0 (BitStream!6928 (_ BitVec 64)) tuple2!14636)

(assert (=> b!168379 (= lt!261660 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun lt!261661 () (_ BitVec 32))

(declare-fun b!168380 () Bool)

(declare-fun Unit!11710 () Unit!11708)

(assert (=> b!168380 (= e!116980 (tuple3!955 Unit!11710 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4807 (buf!4338 thiss!1894)) (currentByte!8214 thiss!1894))) lt!261661))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4807 (buf!4338 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8214 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261661))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6929 (buf!4338 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8214 thiss!1894)) lt!261661)))))

(assert (=> b!168380 (= lt!261661 (bvsub (bvadd (currentBit!8209 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168381 () Bool)

(declare-fun res!140136 () Bool)

(declare-fun e!116979 () Bool)

(assert (=> b!168381 (=> (not res!140136) (not e!116979))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168381 (= res!140136 (validate_offset_bits!1 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) ((_ sign_extend 32) (currentByte!8214 thiss!1894)) ((_ sign_extend 32) (currentBit!8209 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168382 () Bool)

(declare-fun e!116982 () Bool)

(assert (=> b!168382 (= e!116979 e!116982)))

(declare-fun res!140138 () Bool)

(assert (=> b!168382 (=> (not res!140138) (not e!116982))))

(declare-fun lt!261659 () tuple3!954)

(assert (=> b!168382 (= res!140138 (= (buf!4338 (_3!603 lt!261659)) (buf!4338 thiss!1894)))))

(assert (=> b!168382 (= lt!261659 e!116980)))

(declare-fun c!8690 () Bool)

(assert (=> b!168382 (= c!8690 (bvsle (bvadd (currentBit!8209 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun res!140137 () Bool)

(assert (=> start!36724 (=> (not res!140137) (not e!116979))))

(assert (=> start!36724 (= res!140137 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36724 e!116979))

(assert (=> start!36724 true))

(declare-fun e!116981 () Bool)

(declare-fun inv!12 (BitStream!6928) Bool)

(assert (=> start!36724 (and (inv!12 thiss!1894) e!116981)))

(declare-fun b!168383 () Bool)

(declare-fun array_inv!3627 (array!8757) Bool)

(assert (=> b!168383 (= e!116981 (array_inv!3627 (buf!4338 thiss!1894)))))

(declare-fun b!168384 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168384 (= e!116982 (not (invariant!0 (currentBit!8209 (_3!603 lt!261659)) (currentByte!8214 (_3!603 lt!261659)) (size!3886 (buf!4338 (_3!603 lt!261659))))))))

(assert (= (and start!36724 res!140137) b!168381))

(assert (= (and b!168381 res!140136) b!168382))

(assert (= (and b!168382 c!8690) b!168379))

(assert (= (and b!168382 (not c!8690)) b!168380))

(assert (= (and b!168382 res!140138) b!168384))

(assert (= start!36724 b!168383))

(declare-fun m!267981 () Bool)

(assert (=> b!168381 m!267981))

(declare-fun m!267983 () Bool)

(assert (=> b!168383 m!267983))

(declare-fun m!267985 () Bool)

(assert (=> b!168379 m!267985))

(declare-fun m!267987 () Bool)

(assert (=> b!168379 m!267987))

(declare-fun m!267989 () Bool)

(assert (=> b!168379 m!267989))

(declare-fun m!267991 () Bool)

(assert (=> b!168384 m!267991))

(assert (=> b!168380 m!267985))

(declare-fun m!267993 () Bool)

(assert (=> b!168380 m!267993))

(assert (=> b!168380 m!267987))

(declare-fun m!267995 () Bool)

(assert (=> start!36724 m!267995))

(push 1)

(assert (not b!168384))

(assert (not b!168383))

(assert (not b!168379))

(assert (not start!36724))

(assert (not b!168381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59299 () Bool)

(assert (=> d!59299 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8209 thiss!1894) (currentByte!8214 thiss!1894) (size!3886 (buf!4338 thiss!1894))))))

(declare-fun bs!14694 () Bool)

(assert (= bs!14694 d!59299))

(declare-fun m!268029 () Bool)

(assert (=> bs!14694 m!268029))

(assert (=> start!36724 d!59299))

(declare-fun d!59303 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59303 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) ((_ sign_extend 32) (currentByte!8214 thiss!1894)) ((_ sign_extend 32) (currentBit!8209 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) ((_ sign_extend 32) (currentByte!8214 thiss!1894)) ((_ sign_extend 32) (currentBit!8209 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14696 () Bool)

(assert (= bs!14696 d!59303))

(declare-fun m!268033 () Bool)

(assert (=> bs!14696 m!268033))

(assert (=> b!168381 d!59303))

(declare-fun d!59309 () Bool)

(declare-fun lt!261719 () (_ BitVec 32))

(assert (=> d!59309 (= lt!261719 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261720 () (_ BitVec 32))

(assert (=> d!59309 (= lt!261720 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117026 () Bool)

(assert (=> d!59309 e!117026))

(declare-fun res!140169 () Bool)

(assert (=> d!59309 (=> (not res!140169) (not e!117026))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6928 (_ BitVec 64)) Bool)

(assert (=> d!59309 (= res!140169 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11717 () Unit!11708)

(declare-fun Unit!11718 () Unit!11708)

(declare-fun Unit!11719 () Unit!11708)

(assert (=> d!59309 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8209 thiss!1894) lt!261719) #b00000000000000000000000000000000) (tuple2!14637 Unit!11717 (BitStream!6929 (buf!4338 thiss!1894) (bvsub (bvadd (currentByte!8214 thiss!1894) lt!261720) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261719 (currentBit!8209 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8209 thiss!1894) lt!261719) #b00000000000000000000000000001000) (tuple2!14637 Unit!11718 (BitStream!6929 (buf!4338 thiss!1894) (bvadd (currentByte!8214 thiss!1894) lt!261720 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8209 thiss!1894) lt!261719) #b00000000000000000000000000001000))) (tuple2!14637 Unit!11719 (BitStream!6929 (buf!4338 thiss!1894) (bvadd (currentByte!8214 thiss!1894) lt!261720) (bvadd (currentBit!8209 thiss!1894) lt!261719))))))))

(declare-fun b!168433 () Bool)

(declare-fun e!117025 () Bool)

(assert (=> b!168433 (= e!117026 e!117025)))

(declare-fun res!140170 () Bool)

(assert (=> b!168433 (=> (not res!140170) (not e!117025))))

(declare-fun lt!261717 () tuple2!14636)

(declare-fun lt!261721 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168433 (= res!140170 (= (bvadd lt!261721 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3886 (buf!4338 (_2!7922 lt!261717))) (currentByte!8214 (_2!7922 lt!261717)) (currentBit!8209 (_2!7922 lt!261717)))))))

(assert (=> b!168433 (or (not (= (bvand lt!261721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261721 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168433 (= lt!261721 (bitIndex!0 (size!3886 (buf!4338 thiss!1894)) (currentByte!8214 thiss!1894) (currentBit!8209 thiss!1894)))))

(declare-fun lt!261716 () (_ BitVec 32))

(declare-fun lt!261718 () (_ BitVec 32))

(declare-fun Unit!11726 () Unit!11708)

(declare-fun Unit!11727 () Unit!11708)

(declare-fun Unit!11728 () Unit!11708)

(assert (=> b!168433 (= lt!261717 (ite (bvslt (bvadd (currentBit!8209 thiss!1894) lt!261718) #b00000000000000000000000000000000) (tuple2!14637 Unit!11726 (BitStream!6929 (buf!4338 thiss!1894) (bvsub (bvadd (currentByte!8214 thiss!1894) lt!261716) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261718 (currentBit!8209 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8209 thiss!1894) lt!261718) #b00000000000000000000000000001000) (tuple2!14637 Unit!11727 (BitStream!6929 (buf!4338 thiss!1894) (bvadd (currentByte!8214 thiss!1894) lt!261716 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8209 thiss!1894) lt!261718) #b00000000000000000000000000001000))) (tuple2!14637 Unit!11728 (BitStream!6929 (buf!4338 thiss!1894) (bvadd (currentByte!8214 thiss!1894) lt!261716) (bvadd (currentBit!8209 thiss!1894) lt!261718))))))))

(assert (=> b!168433 (= lt!261718 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168433 (= lt!261716 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168434 () Bool)

(assert (=> b!168434 (= e!117025 (and (= (size!3886 (buf!4338 thiss!1894)) (size!3886 (buf!4338 (_2!7922 lt!261717)))) (= (buf!4338 thiss!1894) (buf!4338 (_2!7922 lt!261717)))))))

(assert (= (and d!59309 res!140169) b!168433))

(assert (= (and b!168433 res!140170) b!168434))

(declare-fun m!268037 () Bool)

(assert (=> d!59309 m!268037))

(declare-fun m!268039 () Bool)

(assert (=> b!168433 m!268039))

(declare-fun m!268041 () Bool)

(assert (=> b!168433 m!268041))

(assert (=> b!168379 d!59309))

(declare-fun d!59323 () Bool)

(assert (=> d!59323 (= (invariant!0 (currentBit!8209 (_3!603 lt!261659)) (currentByte!8214 (_3!603 lt!261659)) (size!3886 (buf!4338 (_3!603 lt!261659)))) (and (bvsge (currentBit!8209 (_3!603 lt!261659)) #b00000000000000000000000000000000) (bvslt (currentBit!8209 (_3!603 lt!261659)) #b00000000000000000000000000001000) (bvsge (currentByte!8214 (_3!603 lt!261659)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8214 (_3!603 lt!261659)) (size!3886 (buf!4338 (_3!603 lt!261659)))) (and (= (currentBit!8209 (_3!603 lt!261659)) #b00000000000000000000000000000000) (= (currentByte!8214 (_3!603 lt!261659)) (size!3886 (buf!4338 (_3!603 lt!261659))))))))))

(assert (=> b!168384 d!59323))

(declare-fun d!59327 () Bool)

(assert (=> d!59327 (= (array_inv!3627 (buf!4338 thiss!1894)) (bvsge (size!3886 (buf!4338 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168383 d!59327))

(push 1)

(assert (not d!59299))

(assert (not d!59309))

(assert (not d!59303))

(assert (not b!168433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59337 () Bool)

(assert (=> d!59337 (= (invariant!0 (currentBit!8209 thiss!1894) (currentByte!8214 thiss!1894) (size!3886 (buf!4338 thiss!1894))) (and (bvsge (currentBit!8209 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8209 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8214 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8214 thiss!1894) (size!3886 (buf!4338 thiss!1894))) (and (= (currentBit!8209 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8214 thiss!1894) (size!3886 (buf!4338 thiss!1894)))))))))

(assert (=> d!59299 d!59337))

(declare-fun d!59339 () Bool)

(declare-fun res!140183 () Bool)

(declare-fun e!117036 () Bool)

(assert (=> d!59339 (=> (not res!140183) (not e!117036))))

(assert (=> d!59339 (= res!140183 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894)))))))))

(assert (=> d!59339 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!117036)))

(declare-fun b!168448 () Bool)

(declare-fun lt!261754 () (_ BitVec 64))

(assert (=> b!168448 (= e!117036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261754) (bvsle lt!261754 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894)))))))))

(assert (=> b!168448 (= lt!261754 (bvadd (bitIndex!0 (size!3886 (buf!4338 thiss!1894)) (currentByte!8214 thiss!1894) (currentBit!8209 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59339 res!140183) b!168448))

(assert (=> b!168448 m!268041))

(assert (=> d!59309 d!59339))

(declare-fun d!59343 () Bool)

(assert (=> d!59343 (= (remainingBits!0 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) ((_ sign_extend 32) (currentByte!8214 thiss!1894)) ((_ sign_extend 32) (currentBit!8209 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8214 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8209 thiss!1894)))))))

(assert (=> d!59303 d!59343))

(declare-fun d!59349 () Bool)

(declare-fun e!117043 () Bool)

(assert (=> d!59349 e!117043))

(declare-fun res!140194 () Bool)

(assert (=> d!59349 (=> (not res!140194) (not e!117043))))

(declare-fun lt!261779 () (_ BitVec 64))

(declare-fun lt!261778 () (_ BitVec 64))

(declare-fun lt!261776 () (_ BitVec 64))

(assert (=> d!59349 (= res!140194 (= lt!261778 (bvsub lt!261779 lt!261776)))))

(assert (=> d!59349 (or (= (bvand lt!261779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261779 lt!261776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59349 (= lt!261776 (remainingBits!0 ((_ sign_extend 32) (size!3886 (buf!4338 (_2!7922 lt!261717)))) ((_ sign_extend 32) (currentByte!8214 (_2!7922 lt!261717))) ((_ sign_extend 32) (currentBit!8209 (_2!7922 lt!261717)))))))

(declare-fun lt!261777 () (_ BitVec 64))

(declare-fun lt!261780 () (_ BitVec 64))

(assert (=> d!59349 (= lt!261779 (bvmul lt!261777 lt!261780))))

(assert (=> d!59349 (or (= lt!261777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261780 (bvsdiv (bvmul lt!261777 lt!261780) lt!261777)))))

(assert (=> d!59349 (= lt!261780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59349 (= lt!261777 ((_ sign_extend 32) (size!3886 (buf!4338 (_2!7922 lt!261717)))))))

(assert (=> d!59349 (= lt!261778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8214 (_2!7922 lt!261717))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8209 (_2!7922 lt!261717)))))))

(assert (=> d!59349 (invariant!0 (currentBit!8209 (_2!7922 lt!261717)) (currentByte!8214 (_2!7922 lt!261717)) (size!3886 (buf!4338 (_2!7922 lt!261717))))))

(assert (=> d!59349 (= (bitIndex!0 (size!3886 (buf!4338 (_2!7922 lt!261717))) (currentByte!8214 (_2!7922 lt!261717)) (currentBit!8209 (_2!7922 lt!261717))) lt!261778)))

(declare-fun b!168459 () Bool)

(declare-fun res!140193 () Bool)

(assert (=> b!168459 (=> (not res!140193) (not e!117043))))

(assert (=> b!168459 (= res!140193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261778))))

(declare-fun b!168460 () Bool)

(declare-fun lt!261781 () (_ BitVec 64))

(assert (=> b!168460 (= e!117043 (bvsle lt!261778 (bvmul lt!261781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168460 (or (= lt!261781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261781)))))

(assert (=> b!168460 (= lt!261781 ((_ sign_extend 32) (size!3886 (buf!4338 (_2!7922 lt!261717)))))))

(assert (= (and d!59349 res!140194) b!168459))

(assert (= (and b!168459 res!140193) b!168460))

(declare-fun m!268063 () Bool)

(assert (=> d!59349 m!268063))

(declare-fun m!268065 () Bool)

(assert (=> d!59349 m!268065))

(assert (=> b!168433 d!59349))

(declare-fun d!59355 () Bool)

(declare-fun e!117044 () Bool)

(assert (=> d!59355 e!117044))

(declare-fun res!140196 () Bool)

(assert (=> d!59355 (=> (not res!140196) (not e!117044))))

(declare-fun lt!261782 () (_ BitVec 64))

(declare-fun lt!261784 () (_ BitVec 64))

(declare-fun lt!261785 () (_ BitVec 64))

(assert (=> d!59355 (= res!140196 (= lt!261784 (bvsub lt!261785 lt!261782)))))

(assert (=> d!59355 (or (= (bvand lt!261785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261785 lt!261782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59355 (= lt!261782 (remainingBits!0 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))) ((_ sign_extend 32) (currentByte!8214 thiss!1894)) ((_ sign_extend 32) (currentBit!8209 thiss!1894))))))

(declare-fun lt!261783 () (_ BitVec 64))

(declare-fun lt!261786 () (_ BitVec 64))

(assert (=> d!59355 (= lt!261785 (bvmul lt!261783 lt!261786))))

(assert (=> d!59355 (or (= lt!261783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261786 (bvsdiv (bvmul lt!261783 lt!261786) lt!261783)))))

(assert (=> d!59355 (= lt!261786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59355 (= lt!261783 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))))))

(assert (=> d!59355 (= lt!261784 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8214 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8209 thiss!1894))))))

(assert (=> d!59355 (invariant!0 (currentBit!8209 thiss!1894) (currentByte!8214 thiss!1894) (size!3886 (buf!4338 thiss!1894)))))

(assert (=> d!59355 (= (bitIndex!0 (size!3886 (buf!4338 thiss!1894)) (currentByte!8214 thiss!1894) (currentBit!8209 thiss!1894)) lt!261784)))

(declare-fun b!168461 () Bool)

(declare-fun res!140195 () Bool)

(assert (=> b!168461 (=> (not res!140195) (not e!117044))))

(assert (=> b!168461 (= res!140195 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261784))))

(declare-fun b!168462 () Bool)

(declare-fun lt!261787 () (_ BitVec 64))

(assert (=> b!168462 (= e!117044 (bvsle lt!261784 (bvmul lt!261787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168462 (or (= lt!261787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261787)))))

(assert (=> b!168462 (= lt!261787 ((_ sign_extend 32) (size!3886 (buf!4338 thiss!1894))))))

(assert (= (and d!59355 res!140196) b!168461))

(assert (= (and b!168461 res!140195) b!168462))

(assert (=> d!59355 m!268033))

(assert (=> d!59355 m!268029))

(assert (=> b!168433 d!59355))

(push 1)

(assert (not b!168448))

(assert (not d!59355))

(assert (not d!59349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

