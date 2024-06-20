; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34264 () Bool)

(assert start!34264)

(declare-fun res!135897 () Bool)

(declare-fun e!112632 () Bool)

(assert (=> start!34264 (=> (not res!135897) (not e!112632))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34264 (= res!135897 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34264 e!112632))

(assert (=> start!34264 true))

(declare-datatypes ((array!8111 0))(
  ( (array!8112 (arr!4556 (Array (_ BitVec 32) (_ BitVec 8))) (size!3635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6426 0))(
  ( (BitStream!6427 (buf!4087 array!8111) (currentByte!7611 (_ BitVec 32)) (currentBit!7606 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6426)

(declare-fun e!112630 () Bool)

(declare-fun inv!12 (BitStream!6426) Bool)

(assert (=> start!34264 (and (inv!12 thiss!1577) e!112630)))

(declare-fun b!163125 () Bool)

(declare-fun e!112633 () Bool)

(assert (=> b!163125 (= e!112632 (not e!112633))))

(declare-fun res!135895 () Bool)

(assert (=> b!163125 (=> res!135895 e!112633)))

(declare-fun lt!256227 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163125 (= res!135895 (not (byteRangesEq!0 (select (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577)) lt!256227 #b00000000000000000000000000000000 (currentBit!7606 thiss!1577))))))

(declare-fun lt!256229 () array!8111)

(declare-fun arrayRangesEq!569 (array!8111 array!8111 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163125 (arrayRangesEq!569 (buf!4087 thiss!1577) lt!256229 #b00000000000000000000000000000000 (currentByte!7611 thiss!1577))))

(declare-datatypes ((Unit!11302 0))(
  ( (Unit!11303) )
))
(declare-fun lt!256230 () Unit!11302)

(declare-fun arrayUpdatedAtPrefixLemma!177 (array!8111 (_ BitVec 32) (_ BitVec 8)) Unit!11302)

(assert (=> b!163125 (= lt!256230 (arrayUpdatedAtPrefixLemma!177 (buf!4087 thiss!1577) (currentByte!7611 thiss!1577) lt!256227))))

(assert (=> b!163125 (= lt!256229 (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577))))))

(declare-fun lt!256228 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163125 (= lt!256227 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7606 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256228)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256228))))))

(assert (=> b!163125 (= lt!256228 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7606 thiss!1577) nBits!511)))))

(declare-fun b!163126 () Bool)

(declare-fun res!135894 () Bool)

(assert (=> b!163126 (=> (not res!135894) (not e!112632))))

(assert (=> b!163126 (= res!135894 (bvsle (bvadd (currentBit!7606 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163127 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!6426 (_ BitVec 64)) Bool)

(assert (=> b!163127 (= e!112633 (moveBitIndexPrecond!0 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163128 () Bool)

(declare-fun array_inv!3376 (array!8111) Bool)

(assert (=> b!163128 (= e!112630 (array_inv!3376 (buf!4087 thiss!1577)))))

(declare-fun b!163129 () Bool)

(declare-fun res!135896 () Bool)

(assert (=> b!163129 (=> (not res!135896) (not e!112632))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163129 (= res!135896 (validate_offset_bits!1 ((_ sign_extend 32) (size!3635 (buf!4087 thiss!1577))) ((_ sign_extend 32) (currentByte!7611 thiss!1577)) ((_ sign_extend 32) (currentBit!7606 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34264 res!135897) b!163129))

(assert (= (and b!163129 res!135896) b!163126))

(assert (= (and b!163126 res!135894) b!163125))

(assert (= (and b!163125 (not res!135895)) b!163127))

(assert (= start!34264 b!163128))

(declare-fun m!259009 () Bool)

(assert (=> b!163129 m!259009))

(declare-fun m!259011 () Bool)

(assert (=> b!163125 m!259011))

(declare-fun m!259013 () Bool)

(assert (=> b!163125 m!259013))

(declare-fun m!259015 () Bool)

(assert (=> b!163125 m!259015))

(assert (=> b!163125 m!259011))

(declare-fun m!259017 () Bool)

(assert (=> b!163125 m!259017))

(declare-fun m!259019 () Bool)

(assert (=> b!163125 m!259019))

(declare-fun m!259021 () Bool)

(assert (=> b!163125 m!259021))

(declare-fun m!259023 () Bool)

(assert (=> b!163125 m!259023))

(declare-fun m!259025 () Bool)

(assert (=> b!163125 m!259025))

(declare-fun m!259027 () Bool)

(assert (=> b!163127 m!259027))

(declare-fun m!259029 () Bool)

(assert (=> start!34264 m!259029))

(declare-fun m!259031 () Bool)

(assert (=> b!163128 m!259031))

(check-sat (not b!163127) (not b!163128) (not b!163125) (not start!34264) (not b!163129))
(check-sat)
(get-model)

(declare-fun d!56213 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56213 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7606 thiss!1577) (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577))))))

(declare-fun bs!13934 () Bool)

(assert (= bs!13934 d!56213))

(declare-fun m!259057 () Bool)

(assert (=> bs!13934 m!259057))

(assert (=> start!34264 d!56213))

(declare-fun d!56215 () Bool)

(assert (=> d!56215 (= (byteRangesEq!0 (select (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577)) lt!256227 #b00000000000000000000000000000000 (currentBit!7606 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7606 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7606 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256227) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7606 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13935 () Bool)

(assert (= bs!13935 d!56215))

(declare-fun m!259059 () Bool)

(assert (=> bs!13935 m!259059))

(declare-fun m!259061 () Bool)

(assert (=> bs!13935 m!259061))

(assert (=> b!163125 d!56215))

(declare-fun d!56217 () Bool)

(declare-fun res!135914 () Bool)

(declare-fun e!112650 () Bool)

(assert (=> d!56217 (=> res!135914 e!112650)))

(assert (=> d!56217 (= res!135914 (= #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)))))

(assert (=> d!56217 (= (arrayRangesEq!569 (buf!4087 thiss!1577) lt!256229 #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)) e!112650)))

(declare-fun b!163149 () Bool)

(declare-fun e!112651 () Bool)

(assert (=> b!163149 (= e!112650 e!112651)))

(declare-fun res!135915 () Bool)

(assert (=> b!163149 (=> (not res!135915) (not e!112651))))

(assert (=> b!163149 (= res!135915 (= (select (arr!4556 (buf!4087 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4556 lt!256229) #b00000000000000000000000000000000)))))

(declare-fun b!163150 () Bool)

(assert (=> b!163150 (= e!112651 (arrayRangesEq!569 (buf!4087 thiss!1577) lt!256229 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7611 thiss!1577)))))

(assert (= (and d!56217 (not res!135914)) b!163149))

(assert (= (and b!163149 res!135915) b!163150))

(declare-fun m!259063 () Bool)

(assert (=> b!163149 m!259063))

(declare-fun m!259065 () Bool)

(assert (=> b!163149 m!259065))

(declare-fun m!259067 () Bool)

(assert (=> b!163150 m!259067))

(assert (=> b!163125 d!56217))

(declare-fun d!56219 () Bool)

(declare-fun e!112654 () Bool)

(assert (=> d!56219 e!112654))

(declare-fun res!135918 () Bool)

(assert (=> d!56219 (=> (not res!135918) (not e!112654))))

(assert (=> d!56219 (= res!135918 (and (bvsge (currentByte!7611 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577)))))))

(declare-fun lt!256245 () Unit!11302)

(declare-fun choose!185 (array!8111 (_ BitVec 32) (_ BitVec 8)) Unit!11302)

(assert (=> d!56219 (= lt!256245 (choose!185 (buf!4087 thiss!1577) (currentByte!7611 thiss!1577) lt!256227))))

(assert (=> d!56219 (and (bvsle #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)) (bvslt (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577))))))

(assert (=> d!56219 (= (arrayUpdatedAtPrefixLemma!177 (buf!4087 thiss!1577) (currentByte!7611 thiss!1577) lt!256227) lt!256245)))

(declare-fun b!163153 () Bool)

(assert (=> b!163153 (= e!112654 (arrayRangesEq!569 (buf!4087 thiss!1577) (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)))))

(assert (= (and d!56219 res!135918) b!163153))

(declare-fun m!259069 () Bool)

(assert (=> d!56219 m!259069))

(assert (=> b!163153 m!259021))

(declare-fun m!259071 () Bool)

(assert (=> b!163153 m!259071))

(assert (=> b!163125 d!56219))

(declare-fun d!56221 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56221 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3635 (buf!4087 thiss!1577))) ((_ sign_extend 32) (currentByte!7611 thiss!1577)) ((_ sign_extend 32) (currentBit!7606 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3635 (buf!4087 thiss!1577))) ((_ sign_extend 32) (currentByte!7611 thiss!1577)) ((_ sign_extend 32) (currentBit!7606 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13936 () Bool)

(assert (= bs!13936 d!56221))

(declare-fun m!259073 () Bool)

(assert (=> bs!13936 m!259073))

(assert (=> b!163129 d!56221))

(declare-fun d!56223 () Bool)

(assert (=> d!56223 (= (array_inv!3376 (buf!4087 thiss!1577)) (bvsge (size!3635 (buf!4087 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163128 d!56223))

(declare-fun d!56225 () Bool)

(declare-fun res!135921 () Bool)

(declare-fun e!112657 () Bool)

(assert (=> d!56225 (=> (not res!135921) (not e!112657))))

(assert (=> d!56225 (= res!135921 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))))))))))

(assert (=> d!56225 (= (moveBitIndexPrecond!0 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112657)))

(declare-fun lt!256248 () (_ BitVec 64))

(declare-fun b!163157 () Bool)

(assert (=> b!163157 (= e!112657 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256248) (bvsle lt!256248 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163157 (= lt!256248 (bvadd (bitIndex!0 (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) (currentByte!7611 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))) (currentBit!7606 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56225 res!135921) b!163157))

(declare-fun m!259075 () Bool)

(assert (=> b!163157 m!259075))

(assert (=> b!163127 d!56225))

(check-sat (not b!163157) (not d!56221) (not d!56219) (not d!56213) (not b!163150) (not b!163153))
(check-sat)
(get-model)

(declare-fun d!56247 () Bool)

(assert (=> d!56247 (arrayRangesEq!569 (buf!4087 thiss!1577) (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7611 thiss!1577))))

(assert (=> d!56247 true))

(declare-fun _$8!151 () Unit!11302)

(assert (=> d!56247 (= (choose!185 (buf!4087 thiss!1577) (currentByte!7611 thiss!1577) lt!256227) _$8!151)))

(declare-fun bs!13941 () Bool)

(assert (= bs!13941 d!56247))

(assert (=> bs!13941 m!259021))

(assert (=> bs!13941 m!259071))

(assert (=> d!56219 d!56247))

(declare-fun d!56251 () Bool)

(declare-fun res!135937 () Bool)

(declare-fun e!112673 () Bool)

(assert (=> d!56251 (=> res!135937 e!112673)))

(assert (=> d!56251 (= res!135937 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7611 thiss!1577)))))

(assert (=> d!56251 (= (arrayRangesEq!569 (buf!4087 thiss!1577) lt!256229 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7611 thiss!1577)) e!112673)))

(declare-fun b!163175 () Bool)

(declare-fun e!112674 () Bool)

(assert (=> b!163175 (= e!112673 e!112674)))

(declare-fun res!135938 () Bool)

(assert (=> b!163175 (=> (not res!135938) (not e!112674))))

(assert (=> b!163175 (= res!135938 (= (select (arr!4556 (buf!4087 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4556 lt!256229) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163176 () Bool)

(assert (=> b!163176 (= e!112674 (arrayRangesEq!569 (buf!4087 thiss!1577) lt!256229 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7611 thiss!1577)))))

(assert (= (and d!56251 (not res!135937)) b!163175))

(assert (= (and b!163175 res!135938) b!163176))

(declare-fun m!259103 () Bool)

(assert (=> b!163175 m!259103))

(declare-fun m!259105 () Bool)

(assert (=> b!163175 m!259105))

(declare-fun m!259107 () Bool)

(assert (=> b!163176 m!259107))

(assert (=> b!163150 d!56251))

(declare-fun d!56253 () Bool)

(declare-fun e!112686 () Bool)

(assert (=> d!56253 e!112686))

(declare-fun res!135952 () Bool)

(assert (=> d!56253 (=> (not res!135952) (not e!112686))))

(declare-fun lt!256278 () (_ BitVec 64))

(declare-fun lt!256273 () (_ BitVec 64))

(declare-fun lt!256274 () (_ BitVec 64))

(assert (=> d!56253 (= res!135952 (= lt!256278 (bvsub lt!256274 lt!256273)))))

(assert (=> d!56253 (or (= (bvand lt!256274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256274 lt!256273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56253 (= lt!256273 (remainingBits!0 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))))) ((_ sign_extend 32) (currentByte!7611 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) ((_ sign_extend 32) (currentBit!7606 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))))))))

(declare-fun lt!256275 () (_ BitVec 64))

(declare-fun lt!256277 () (_ BitVec 64))

(assert (=> d!56253 (= lt!256274 (bvmul lt!256275 lt!256277))))

(assert (=> d!56253 (or (= lt!256275 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256277 (bvsdiv (bvmul lt!256275 lt!256277) lt!256275)))))

(assert (=> d!56253 (= lt!256277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56253 (= lt!256275 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))))))))

(assert (=> d!56253 (= lt!256278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7611 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7606 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))))))))

(assert (=> d!56253 (invariant!0 (currentBit!7606 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))) (currentByte!7611 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))))))

(assert (=> d!56253 (= (bitIndex!0 (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) (currentByte!7611 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))) (currentBit!7606 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577)))) lt!256278)))

(declare-fun b!163190 () Bool)

(declare-fun res!135953 () Bool)

(assert (=> b!163190 (=> (not res!135953) (not e!112686))))

(assert (=> b!163190 (= res!135953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256278))))

(declare-fun b!163191 () Bool)

(declare-fun lt!256276 () (_ BitVec 64))

(assert (=> b!163191 (= e!112686 (bvsle lt!256278 (bvmul lt!256276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163191 (or (= lt!256276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256276)))))

(assert (=> b!163191 (= lt!256276 ((_ sign_extend 32) (size!3635 (buf!4087 (BitStream!6427 lt!256229 (currentByte!7611 thiss!1577) (currentBit!7606 thiss!1577))))))))

(assert (= (and d!56253 res!135952) b!163190))

(assert (= (and b!163190 res!135953) b!163191))

(declare-fun m!259123 () Bool)

(assert (=> d!56253 m!259123))

(declare-fun m!259125 () Bool)

(assert (=> d!56253 m!259125))

(assert (=> b!163157 d!56253))

(declare-fun d!56261 () Bool)

(assert (=> d!56261 (= (remainingBits!0 ((_ sign_extend 32) (size!3635 (buf!4087 thiss!1577))) ((_ sign_extend 32) (currentByte!7611 thiss!1577)) ((_ sign_extend 32) (currentBit!7606 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3635 (buf!4087 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7611 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7606 thiss!1577)))))))

(assert (=> d!56221 d!56261))

(declare-fun d!56263 () Bool)

(declare-fun res!135954 () Bool)

(declare-fun e!112687 () Bool)

(assert (=> d!56263 (=> res!135954 e!112687)))

(assert (=> d!56263 (= res!135954 (= #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)))))

(assert (=> d!56263 (= (arrayRangesEq!569 (buf!4087 thiss!1577) (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7611 thiss!1577)) e!112687)))

(declare-fun b!163192 () Bool)

(declare-fun e!112688 () Bool)

(assert (=> b!163192 (= e!112687 e!112688)))

(declare-fun res!135955 () Bool)

(assert (=> b!163192 (=> (not res!135955) (not e!112688))))

(assert (=> b!163192 (= res!135955 (= (select (arr!4556 (buf!4087 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4556 (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163193 () Bool)

(assert (=> b!163193 (= e!112688 (arrayRangesEq!569 (buf!4087 thiss!1577) (array!8112 (store (arr!4556 (buf!4087 thiss!1577)) (currentByte!7611 thiss!1577) lt!256227) (size!3635 (buf!4087 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7611 thiss!1577)))))

(assert (= (and d!56263 (not res!135954)) b!163192))

(assert (= (and b!163192 res!135955) b!163193))

(assert (=> b!163192 m!259063))

(declare-fun m!259127 () Bool)

(assert (=> b!163192 m!259127))

(declare-fun m!259129 () Bool)

(assert (=> b!163193 m!259129))

(assert (=> b!163153 d!56263))

(declare-fun d!56265 () Bool)

(assert (=> d!56265 (= (invariant!0 (currentBit!7606 thiss!1577) (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577))) (and (bvsge (currentBit!7606 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7606 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7611 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577))) (and (= (currentBit!7606 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7611 thiss!1577) (size!3635 (buf!4087 thiss!1577)))))))))

(assert (=> d!56213 d!56265))

(check-sat (not b!163176) (not b!163193) (not d!56253) (not d!56247))
(check-sat)
