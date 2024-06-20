; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36782 () Bool)

(assert start!36782)

(declare-fun b!168523 () Bool)

(declare-fun e!117084 () Bool)

(declare-datatypes ((array!8770 0))(
  ( (array!8771 (arr!4812 (Array (_ BitVec 32) (_ BitVec 8))) (size!3891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6938 0))(
  ( (BitStream!6939 (buf!4343 array!8770) (currentByte!8231 (_ BitVec 32)) (currentBit!8226 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6938)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168523 (= e!117084 (not (invariant!0 (currentBit!8226 thiss!1894) (currentByte!8231 thiss!1894) (size!3891 (buf!4343 thiss!1894)))))))

(declare-fun res!140233 () Bool)

(assert (=> start!36782 (=> (not res!140233) (not e!117084))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36782 (= res!140233 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36782 e!117084))

(assert (=> start!36782 true))

(declare-fun e!117087 () Bool)

(declare-fun inv!12 (BitStream!6938) Bool)

(assert (=> start!36782 (and (inv!12 thiss!1894) e!117087)))

(declare-fun b!168524 () Bool)

(declare-fun array_inv!3632 (array!8770) Bool)

(assert (=> b!168524 (= e!117087 (array_inv!3632 (buf!4343 thiss!1894)))))

(declare-fun b!168525 () Bool)

(declare-datatypes ((Unit!11741 0))(
  ( (Unit!11742) )
))
(declare-datatypes ((tuple3!964 0))(
  ( (tuple3!965 (_1!7931 Unit!11741) (_2!7931 (_ BitVec 8)) (_3!608 BitStream!6938)) )
))
(declare-fun e!117086 () tuple3!964)

(declare-datatypes ((tuple2!14646 0))(
  ( (tuple2!14647 (_1!7932 Unit!11741) (_2!7932 BitStream!6938)) )
))
(declare-fun lt!261831 () tuple2!14646)

(assert (=> b!168525 (= e!117086 (tuple3!965 (_1!7932 lt!261831) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4812 (buf!4343 thiss!1894)) (currentByte!8231 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8226 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7932 lt!261831)))))

(declare-fun moveBitIndex!0 (BitStream!6938 (_ BitVec 64)) tuple2!14646)

(assert (=> b!168525 (= lt!261831 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168526 () Bool)

(declare-fun res!140234 () Bool)

(assert (=> b!168526 (=> (not res!140234) (not e!117084))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168526 (= res!140234 (validate_offset_bits!1 ((_ sign_extend 32) (size!3891 (buf!4343 thiss!1894))) ((_ sign_extend 32) (currentByte!8231 thiss!1894)) ((_ sign_extend 32) (currentBit!8226 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168527 () Bool)

(declare-fun res!140232 () Bool)

(assert (=> b!168527 (=> (not res!140232) (not e!117084))))

(assert (=> b!168527 (= res!140232 (= (buf!4343 (_3!608 e!117086)) (buf!4343 thiss!1894)))))

(declare-fun c!8705 () Bool)

(assert (=> b!168527 (= c!8705 (bvsle (bvadd (currentBit!8226 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168528 () Bool)

(declare-fun lt!261832 () (_ BitVec 32))

(declare-fun Unit!11743 () Unit!11741)

(assert (=> b!168528 (= e!117086 (tuple3!965 Unit!11743 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4812 (buf!4343 thiss!1894)) (currentByte!8231 thiss!1894))) lt!261832))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4812 (buf!4343 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8231 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261832))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6939 (buf!4343 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8231 thiss!1894)) lt!261832)))))

(assert (=> b!168528 (= lt!261832 (bvsub (bvadd (currentBit!8226 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(assert (= (and start!36782 res!140233) b!168526))

(assert (= (and b!168526 res!140234) b!168527))

(assert (= (and b!168527 c!8705) b!168525))

(assert (= (and b!168527 (not c!8705)) b!168528))

(assert (= (and b!168527 res!140232) b!168523))

(assert (= start!36782 b!168524))

(declare-fun m!268103 () Bool)

(assert (=> b!168523 m!268103))

(declare-fun m!268105 () Bool)

(assert (=> b!168528 m!268105))

(declare-fun m!268107 () Bool)

(assert (=> b!168528 m!268107))

(declare-fun m!268109 () Bool)

(assert (=> b!168528 m!268109))

(declare-fun m!268111 () Bool)

(assert (=> b!168524 m!268111))

(declare-fun m!268113 () Bool)

(assert (=> b!168526 m!268113))

(declare-fun m!268115 () Bool)

(assert (=> start!36782 m!268115))

(assert (=> b!168525 m!268105))

(assert (=> b!168525 m!268109))

(declare-fun m!268117 () Bool)

(assert (=> b!168525 m!268117))

(push 1)

(assert (not start!36782))

(assert (not b!168524))

(assert (not b!168523))

(assert (not b!168525))

(assert (not b!168526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59377 () Bool)

(declare-fun lt!261881 () (_ BitVec 32))

(assert (=> d!59377 (= lt!261881 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261882 () (_ BitVec 32))

(assert (=> d!59377 (= lt!261882 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117105 () Bool)

(assert (=> d!59377 e!117105))

(declare-fun res!140251 () Bool)

(assert (=> d!59377 (=> (not res!140251) (not e!117105))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6938 (_ BitVec 64)) Bool)

(assert (=> d!59377 (= res!140251 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11756 () Unit!11741)

(declare-fun Unit!11757 () Unit!11741)

(declare-fun Unit!11758 () Unit!11741)

(assert (=> d!59377 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8226 thiss!1894) lt!261881) #b00000000000000000000000000000000) (tuple2!14647 Unit!11756 (BitStream!6939 (buf!4343 thiss!1894) (bvsub (bvadd (currentByte!8231 thiss!1894) lt!261882) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261881 (currentBit!8226 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8226 thiss!1894) lt!261881) #b00000000000000000000000000001000) (tuple2!14647 Unit!11757 (BitStream!6939 (buf!4343 thiss!1894) (bvadd (currentByte!8231 thiss!1894) lt!261882 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8226 thiss!1894) lt!261881) #b00000000000000000000000000001000))) (tuple2!14647 Unit!11758 (BitStream!6939 (buf!4343 thiss!1894) (bvadd (currentByte!8231 thiss!1894) lt!261882) (bvadd (currentBit!8226 thiss!1894) lt!261881))))))))

(declare-fun b!168545 () Bool)

(declare-fun e!117104 () Bool)

(assert (=> b!168545 (= e!117105 e!117104)))

(declare-fun res!140252 () Bool)

(assert (=> b!168545 (=> (not res!140252) (not e!117104))))

(declare-fun lt!261883 () (_ BitVec 64))

(declare-fun lt!261885 () tuple2!14646)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168545 (= res!140252 (= (bvadd lt!261883 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3891 (buf!4343 (_2!7932 lt!261885))) (currentByte!8231 (_2!7932 lt!261885)) (currentBit!8226 (_2!7932 lt!261885)))))))

