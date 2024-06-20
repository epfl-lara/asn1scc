; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34266 () Bool)

(assert start!34266)

(declare-fun b!163140 () Bool)

(declare-fun res!135908 () Bool)

(declare-fun e!112644 () Bool)

(assert (=> b!163140 (=> (not res!135908) (not e!112644))))

(declare-datatypes ((array!8113 0))(
  ( (array!8114 (arr!4557 (Array (_ BitVec 32) (_ BitVec 8))) (size!3636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6428 0))(
  ( (BitStream!6429 (buf!4088 array!8113) (currentByte!7612 (_ BitVec 32)) (currentBit!7607 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6428)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163140 (= res!135908 (bvsle (bvadd (currentBit!7607 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163141 () Bool)

(declare-fun res!135907 () Bool)

(assert (=> b!163141 (=> (not res!135907) (not e!112644))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163141 (= res!135907 (validate_offset_bits!1 ((_ sign_extend 32) (size!3636 (buf!4088 thiss!1577))) ((_ sign_extend 32) (currentByte!7612 thiss!1577)) ((_ sign_extend 32) (currentBit!7607 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!135906 () Bool)

(assert (=> start!34266 (=> (not res!135906) (not e!112644))))

(assert (=> start!34266 (= res!135906 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34266 e!112644))

(assert (=> start!34266 true))

(declare-fun e!112642 () Bool)

(declare-fun inv!12 (BitStream!6428) Bool)

(assert (=> start!34266 (and (inv!12 thiss!1577) e!112642)))

(declare-fun b!163142 () Bool)

(declare-fun e!112645 () Bool)

(assert (=> b!163142 (= e!112644 (not e!112645))))

(declare-fun res!135909 () Bool)

(assert (=> b!163142 (=> res!135909 e!112645)))

(declare-fun lt!256241 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163142 (= res!135909 (not (byteRangesEq!0 (select (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577)) lt!256241 #b00000000000000000000000000000000 (currentBit!7607 thiss!1577))))))

(declare-fun lt!256242 () array!8113)

(declare-fun arrayRangesEq!570 (array!8113 array!8113 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163142 (arrayRangesEq!570 (buf!4088 thiss!1577) lt!256242 #b00000000000000000000000000000000 (currentByte!7612 thiss!1577))))

(declare-datatypes ((Unit!11304 0))(
  ( (Unit!11305) )
))
(declare-fun lt!256240 () Unit!11304)

(declare-fun arrayUpdatedAtPrefixLemma!178 (array!8113 (_ BitVec 32) (_ BitVec 8)) Unit!11304)

(assert (=> b!163142 (= lt!256240 (arrayUpdatedAtPrefixLemma!178 (buf!4088 thiss!1577) (currentByte!7612 thiss!1577) lt!256241))))

(assert (=> b!163142 (= lt!256242 (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577))))))

(declare-fun lt!256239 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163142 (= lt!256241 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7607 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256239)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256239))))))

(assert (=> b!163142 (= lt!256239 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7607 thiss!1577) nBits!511)))))

(declare-fun b!163143 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!6428 (_ BitVec 64)) Bool)

(assert (=> b!163143 (= e!112645 (moveBitIndexPrecond!0 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163144 () Bool)

(declare-fun array_inv!3377 (array!8113) Bool)

(assert (=> b!163144 (= e!112642 (array_inv!3377 (buf!4088 thiss!1577)))))

(assert (= (and start!34266 res!135906) b!163141))

(assert (= (and b!163141 res!135907) b!163140))

(assert (= (and b!163140 res!135908) b!163142))

(assert (= (and b!163142 (not res!135909)) b!163143))

(assert (= start!34266 b!163144))

(declare-fun m!259033 () Bool)

(assert (=> b!163144 m!259033))

(declare-fun m!259035 () Bool)

(assert (=> b!163142 m!259035))

(declare-fun m!259037 () Bool)

(assert (=> b!163142 m!259037))

(declare-fun m!259039 () Bool)

(assert (=> b!163142 m!259039))

(declare-fun m!259041 () Bool)

(assert (=> b!163142 m!259041))

(declare-fun m!259043 () Bool)

(assert (=> b!163142 m!259043))

(declare-fun m!259045 () Bool)

(assert (=> b!163142 m!259045))

(assert (=> b!163142 m!259039))

(declare-fun m!259047 () Bool)

(assert (=> b!163142 m!259047))

(declare-fun m!259049 () Bool)

(assert (=> b!163142 m!259049))

(declare-fun m!259051 () Bool)

(assert (=> b!163141 m!259051))

(declare-fun m!259053 () Bool)

(assert (=> start!34266 m!259053))

(declare-fun m!259055 () Bool)

(assert (=> b!163143 m!259055))

(push 1)

(assert (not b!163141))

(assert (not start!34266))

(assert (not b!163144))

(assert (not b!163143))

(assert (not b!163142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56241 () Bool)

(assert (=> d!56241 (= (array_inv!3377 (buf!4088 thiss!1577)) (bvsge (size!3636 (buf!4088 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!163144 d!56241))

(declare-fun d!56243 () Bool)

(declare-fun res!135936 () Bool)

(declare-fun e!112672 () Bool)

(assert (=> d!56243 (=> (not res!135936) (not e!112672))))

(assert (=> d!56243 (= res!135936 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))))))))))

(assert (=> d!56243 (= (moveBitIndexPrecond!0 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!112672)))

(declare-fun b!163174 () Bool)

(declare-fun lt!256257 () (_ BitVec 64))

(assert (=> b!163174 (= e!112672 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256257) (bvsle lt!256257 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163174 (= lt!256257 (bvadd (bitIndex!0 (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) (currentByte!7612 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))) (currentBit!7607 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!56243 res!135936) b!163174))

(declare-fun m!259097 () Bool)

(assert (=> b!163174 m!259097))

(assert (=> b!163143 d!56243))

(declare-fun d!56245 () Bool)

(assert (=> d!56245 (= (byteRangesEq!0 (select (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577)) lt!256241 #b00000000000000000000000000000000 (currentBit!7607 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7607 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7607 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!256241) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7607 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13940 () Bool)

(assert (= bs!13940 d!56245))

(declare-fun m!259099 () Bool)

(assert (=> bs!13940 m!259099))

(declare-fun m!259101 () Bool)

(assert (=> bs!13940 m!259101))

(assert (=> b!163142 d!56245))

(declare-fun d!56249 () Bool)

(declare-fun res!135943 () Bool)

(declare-fun e!112679 () Bool)

(assert (=> d!56249 (=> res!135943 e!112679)))

(assert (=> d!56249 (= res!135943 (= #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)))))

(assert (=> d!56249 (= (arrayRangesEq!570 (buf!4088 thiss!1577) lt!256242 #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)) e!112679)))

(declare-fun b!163181 () Bool)

(declare-fun e!112680 () Bool)

(assert (=> b!163181 (= e!112679 e!112680)))

(declare-fun res!135944 () Bool)

(assert (=> b!163181 (=> (not res!135944) (not e!112680))))

(assert (=> b!163181 (= res!135944 (= (select (arr!4557 (buf!4088 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4557 lt!256242) #b00000000000000000000000000000000)))))

(declare-fun b!163182 () Bool)

(assert (=> b!163182 (= e!112680 (arrayRangesEq!570 (buf!4088 thiss!1577) lt!256242 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7612 thiss!1577)))))

(assert (= (and d!56249 (not res!135943)) b!163181))

(assert (= (and b!163181 res!135944) b!163182))

(declare-fun m!259109 () Bool)

(assert (=> b!163181 m!259109))

(declare-fun m!259111 () Bool)

(assert (=> b!163181 m!259111))

(declare-fun m!259113 () Bool)

(assert (=> b!163182 m!259113))

(assert (=> b!163142 d!56249))

(declare-fun d!56255 () Bool)

(declare-fun e!112683 () Bool)

(assert (=> d!56255 e!112683))

(declare-fun res!135947 () Bool)

(assert (=> d!56255 (=> (not res!135947) (not e!112683))))

(assert (=> d!56255 (= res!135947 (and (bvsge (currentByte!7612 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577)))))))

(declare-fun lt!256260 () Unit!11304)

(declare-fun choose!187 (array!8113 (_ BitVec 32) (_ BitVec 8)) Unit!11304)

(assert (=> d!56255 (= lt!256260 (choose!187 (buf!4088 thiss!1577) (currentByte!7612 thiss!1577) lt!256241))))

(assert (=> d!56255 (and (bvsle #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)) (bvslt (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577))))))

(assert (=> d!56255 (= (arrayUpdatedAtPrefixLemma!178 (buf!4088 thiss!1577) (currentByte!7612 thiss!1577) lt!256241) lt!256260)))

(declare-fun b!163185 () Bool)

(assert (=> b!163185 (= e!112683 (arrayRangesEq!570 (buf!4088 thiss!1577) (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)))))

(assert (= (and d!56255 res!135947) b!163185))

(declare-fun m!259115 () Bool)

(assert (=> d!56255 m!259115))

(assert (=> b!163185 m!259043))

(declare-fun m!259117 () Bool)

(assert (=> b!163185 m!259117))

(assert (=> b!163142 d!56255))

(declare-fun d!56257 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56257 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7607 thiss!1577) (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577))))))

(declare-fun bs!13942 () Bool)

(assert (= bs!13942 d!56257))

(declare-fun m!259119 () Bool)

(assert (=> bs!13942 m!259119))

(assert (=> start!34266 d!56257))

(declare-fun d!56259 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56259 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3636 (buf!4088 thiss!1577))) ((_ sign_extend 32) (currentByte!7612 thiss!1577)) ((_ sign_extend 32) (currentBit!7607 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3636 (buf!4088 thiss!1577))) ((_ sign_extend 32) (currentByte!7612 thiss!1577)) ((_ sign_extend 32) (currentBit!7607 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!13943 () Bool)

(assert (= bs!13943 d!56259))

(declare-fun m!259121 () Bool)

(assert (=> bs!13943 m!259121))

(assert (=> b!163141 d!56259))

(push 1)

(assert (not d!56259))

(assert (not d!56257))

(assert (not b!163182))

(assert (not d!56255))

(assert (not b!163174))

(assert (not b!163185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56279 () Bool)

(assert (=> d!56279 (= (invariant!0 (currentBit!7607 thiss!1577) (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577))) (and (bvsge (currentBit!7607 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7607 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7612 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577))) (and (= (currentBit!7607 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7612 thiss!1577) (size!3636 (buf!4088 thiss!1577)))))))))

(assert (=> d!56257 d!56279))

(declare-fun d!56281 () Bool)

(declare-fun res!135966 () Bool)

(declare-fun e!112696 () Bool)

(assert (=> d!56281 (=> res!135966 e!112696)))

(assert (=> d!56281 (= res!135966 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7612 thiss!1577)))))

(assert (=> d!56281 (= (arrayRangesEq!570 (buf!4088 thiss!1577) lt!256242 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7612 thiss!1577)) e!112696)))

(declare-fun b!163204 () Bool)

(declare-fun e!112697 () Bool)

(assert (=> b!163204 (= e!112696 e!112697)))

(declare-fun res!135967 () Bool)

(assert (=> b!163204 (=> (not res!135967) (not e!112697))))

(assert (=> b!163204 (= res!135967 (= (select (arr!4557 (buf!4088 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4557 lt!256242) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!163205 () Bool)

(assert (=> b!163205 (= e!112697 (arrayRangesEq!570 (buf!4088 thiss!1577) lt!256242 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7612 thiss!1577)))))

(assert (= (and d!56281 (not res!135966)) b!163204))

(assert (= (and b!163204 res!135967) b!163205))

(declare-fun m!259145 () Bool)

(assert (=> b!163204 m!259145))

(declare-fun m!259147 () Bool)

(assert (=> b!163204 m!259147))

(declare-fun m!259149 () Bool)

(assert (=> b!163205 m!259149))

(assert (=> b!163182 d!56281))

(declare-fun d!56283 () Bool)

(declare-fun res!135968 () Bool)

(declare-fun e!112698 () Bool)

(assert (=> d!56283 (=> res!135968 e!112698)))

(assert (=> d!56283 (= res!135968 (= #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)))))

(assert (=> d!56283 (= (arrayRangesEq!570 (buf!4088 thiss!1577) (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7612 thiss!1577)) e!112698)))

(declare-fun b!163206 () Bool)

(declare-fun e!112699 () Bool)

(assert (=> b!163206 (= e!112698 e!112699)))

(declare-fun res!135969 () Bool)

(assert (=> b!163206 (=> (not res!135969) (not e!112699))))

(assert (=> b!163206 (= res!135969 (= (select (arr!4557 (buf!4088 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4557 (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!163207 () Bool)

(assert (=> b!163207 (= e!112699 (arrayRangesEq!570 (buf!4088 thiss!1577) (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7612 thiss!1577)))))

(assert (= (and d!56283 (not res!135968)) b!163206))

(assert (= (and b!163206 res!135969) b!163207))

(assert (=> b!163206 m!259109))

(declare-fun m!259151 () Bool)

(assert (=> b!163206 m!259151))

(declare-fun m!259153 () Bool)

(assert (=> b!163207 m!259153))

(assert (=> b!163185 d!56283))

(declare-fun d!56285 () Bool)

(declare-fun e!112702 () Bool)

(assert (=> d!56285 e!112702))

(declare-fun res!135975 () Bool)

(assert (=> d!56285 (=> (not res!135975) (not e!112702))))

(declare-fun lt!256313 () (_ BitVec 64))

(declare-fun lt!256309 () (_ BitVec 64))

(declare-fun lt!256314 () (_ BitVec 64))

(assert (=> d!56285 (= res!135975 (= lt!256309 (bvsub lt!256314 lt!256313)))))

(assert (=> d!56285 (or (= (bvand lt!256314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!256313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!256314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!256314 lt!256313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56285 (= lt!256313 (remainingBits!0 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))))) ((_ sign_extend 32) (currentByte!7612 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) ((_ sign_extend 32) (currentBit!7607 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))))))))

(declare-fun lt!256310 () (_ BitVec 64))

(declare-fun lt!256311 () (_ BitVec 64))

(assert (=> d!56285 (= lt!256314 (bvmul lt!256310 lt!256311))))

(assert (=> d!56285 (or (= lt!256310 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!256311 (bvsdiv (bvmul lt!256310 lt!256311) lt!256310)))))

(assert (=> d!56285 (= lt!256311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!56285 (= lt!256310 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))))))))

(assert (=> d!56285 (= lt!256309 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7612 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7607 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))))))))

(assert (=> d!56285 (invariant!0 (currentBit!7607 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))) (currentByte!7612 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))))))

(assert (=> d!56285 (= (bitIndex!0 (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) (currentByte!7612 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))) (currentBit!7607 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577)))) lt!256309)))

(declare-fun b!163212 () Bool)

(declare-fun res!135974 () Bool)

(assert (=> b!163212 (=> (not res!135974) (not e!112702))))

(assert (=> b!163212 (= res!135974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!256309))))

(declare-fun b!163213 () Bool)

(declare-fun lt!256312 () (_ BitVec 64))

(assert (=> b!163213 (= e!112702 (bvsle lt!256309 (bvmul lt!256312 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!163213 (or (= lt!256312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!256312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!256312)))))

(assert (=> b!163213 (= lt!256312 ((_ sign_extend 32) (size!3636 (buf!4088 (BitStream!6429 lt!256242 (currentByte!7612 thiss!1577) (currentBit!7607 thiss!1577))))))))

(assert (= (and d!56285 res!135975) b!163212))

(assert (= (and b!163212 res!135974) b!163213))

(declare-fun m!259155 () Bool)

(assert (=> d!56285 m!259155))

(declare-fun m!259157 () Bool)

(assert (=> d!56285 m!259157))

(assert (=> b!163174 d!56285))

(declare-fun d!56287 () Bool)

(assert (=> d!56287 (= (remainingBits!0 ((_ sign_extend 32) (size!3636 (buf!4088 thiss!1577))) ((_ sign_extend 32) (currentByte!7612 thiss!1577)) ((_ sign_extend 32) (currentBit!7607 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3636 (buf!4088 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7612 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7607 thiss!1577)))))))

(assert (=> d!56259 d!56287))

(declare-fun d!56289 () Bool)

(assert (=> d!56289 (arrayRangesEq!570 (buf!4088 thiss!1577) (array!8114 (store (arr!4557 (buf!4088 thiss!1577)) (currentByte!7612 thiss!1577) lt!256241) (size!3636 (buf!4088 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7612 thiss!1577))))

(assert (=> d!56289 true))

(declare-fun _$8!157 () Unit!11304)

(assert (=> d!56289 (= (choose!187 (buf!4088 thiss!1577) (currentByte!7612 thiss!1577) lt!256241) _$8!157)))

(declare-fun bs!13945 () Bool)

(assert (= bs!13945 d!56289))

(assert (=> bs!13945 m!259043))

(assert (=> bs!13945 m!259117))

(assert (=> d!56255 d!56289))

(push 1)

(assert (not d!56289))

(assert (not b!163205))

(assert (not d!56285))

(assert (not b!163207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

