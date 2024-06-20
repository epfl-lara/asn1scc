; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36256 () Bool)

(assert start!36256)

(declare-fun b!167154 () Bool)

(declare-fun res!139157 () Bool)

(declare-fun e!115928 () Bool)

(assert (=> b!167154 (=> (not res!139157) (not e!115928))))

(declare-datatypes ((array!8647 0))(
  ( (array!8648 (arr!4763 (Array (_ BitVec 32) (_ BitVec 8))) (size!3842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6840 0))(
  ( (BitStream!6841 (buf!4294 array!8647) (currentByte!8124 (_ BitVec 32)) (currentBit!8119 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6840)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167154 (= res!139157 (validate_offset_bits!1 ((_ sign_extend 32) (size!3842 (buf!4294 thiss!1577))) ((_ sign_extend 32) (currentByte!8124 thiss!1577)) ((_ sign_extend 32) (currentBit!8119 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167157 () Bool)

(declare-fun e!115927 () Bool)

(declare-fun array_inv!3583 (array!8647) Bool)

(assert (=> b!167157 (= e!115927 (array_inv!3583 (buf!4294 thiss!1577)))))

(declare-fun b!167156 () Bool)

(assert (=> b!167156 (= e!115928 (not (and (bvsge (currentByte!8124 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8124 thiss!1577) (size!3842 (buf!4294 thiss!1577))))))))

(declare-fun lt!260220 () array!8647)

(declare-fun arrayRangesEq!671 (array!8647 array!8647 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167156 (arrayRangesEq!671 (buf!4294 thiss!1577) lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577))))

(declare-fun lt!260213 () array!8647)

(declare-datatypes ((Unit!11632 0))(
  ( (Unit!11633) )
))
(declare-fun lt!260222 () Unit!11632)

(declare-fun arrayRangesEqTransitive!173 (array!8647 array!8647 array!8647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11632)

(assert (=> b!167156 (= lt!260222 (arrayRangesEqTransitive!173 (buf!4294 thiss!1577) lt!260213 lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (=> b!167156 (arrayRangesEq!671 lt!260213 lt!260220 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)))))

(declare-fun lt!260221 () (_ BitVec 8))

(declare-fun lt!260218 () Unit!11632)

(declare-fun arrayUpdatedAtPrefixLemma!279 (array!8647 (_ BitVec 32) (_ BitVec 8)) Unit!11632)

(assert (=> b!167156 (= lt!260218 (arrayUpdatedAtPrefixLemma!279 lt!260213 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221))))

(declare-fun lt!260216 () (_ BitVec 8))

(assert (=> b!167156 (arrayRangesEq!671 (buf!4294 thiss!1577) (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) lt!260216) (size!3842 (buf!4294 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8124 thiss!1577))))

(declare-fun lt!260215 () Unit!11632)

(assert (=> b!167156 (= lt!260215 (arrayUpdatedAtPrefixLemma!279 (buf!4294 thiss!1577) (currentByte!8124 thiss!1577) lt!260216))))

(declare-fun lt!260214 () (_ BitVec 32))

(declare-fun lt!260219 () (_ BitVec 32))

(assert (=> b!167156 (= lt!260216 (select (store (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8119 thiss!1577)))))))) (bvlshr (bvand lt!260219 #b00000000000000000000000011111111) lt!260214)))) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221) (currentByte!8124 thiss!1577)))))

(assert (=> b!167156 (= lt!260220 (array!8648 (store (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8119 thiss!1577)))))))) (bvlshr (bvand lt!260219 #b00000000000000000000000011111111) lt!260214)))) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221) (size!3842 (buf!4294 thiss!1577))))))

(declare-fun lt!260217 () (_ BitVec 32))

(assert (=> b!167156 (= lt!260221 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8119 thiss!1577)))))))) (bvlshr (bvand lt!260219 #b00000000000000000000000011111111) lt!260214)))) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260217))) (bvshl lt!260219 lt!260217))))))

(assert (=> b!167156 (= lt!260217 (bvsub #b00000000000000000000000000001000 lt!260214))))

(assert (=> b!167156 (= lt!260213 (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8119 thiss!1577)))))))) (bvlshr (bvand lt!260219 #b00000000000000000000000011111111) lt!260214)))) (size!3842 (buf!4294 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167156 (= lt!260219 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167156 (= lt!260214 (bvsub (bvadd (currentBit!8119 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139155 () Bool)

(assert (=> start!36256 (=> (not res!139155) (not e!115928))))

(assert (=> start!36256 (= res!139155 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36256 e!115928))

(assert (=> start!36256 true))

(declare-fun inv!12 (BitStream!6840) Bool)

(assert (=> start!36256 (and (inv!12 thiss!1577) e!115927)))

(declare-fun b!167155 () Bool)

(declare-fun res!139156 () Bool)

(assert (=> b!167155 (=> (not res!139156) (not e!115928))))

(assert (=> b!167155 (= res!139156 (bvsgt (bvadd (currentBit!8119 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36256 res!139155) b!167154))

(assert (= (and b!167154 res!139157) b!167155))

(assert (= (and b!167155 res!139156) b!167156))

(assert (= start!36256 b!167157))

(declare-fun m!265793 () Bool)

(assert (=> b!167154 m!265793))

(declare-fun m!265795 () Bool)

(assert (=> b!167157 m!265795))

(declare-fun m!265797 () Bool)

(assert (=> b!167156 m!265797))

(declare-fun m!265799 () Bool)

(assert (=> b!167156 m!265799))

(declare-fun m!265801 () Bool)

(assert (=> b!167156 m!265801))

(declare-fun m!265803 () Bool)

(assert (=> b!167156 m!265803))

(declare-fun m!265805 () Bool)

(assert (=> b!167156 m!265805))

(declare-fun m!265807 () Bool)

(assert (=> b!167156 m!265807))

(declare-fun m!265809 () Bool)

(assert (=> b!167156 m!265809))

(declare-fun m!265811 () Bool)

(assert (=> b!167156 m!265811))

(declare-fun m!265813 () Bool)

(assert (=> b!167156 m!265813))

(declare-fun m!265815 () Bool)

(assert (=> b!167156 m!265815))

(declare-fun m!265817 () Bool)

(assert (=> b!167156 m!265817))

(declare-fun m!265819 () Bool)

(assert (=> b!167156 m!265819))

(declare-fun m!265821 () Bool)

(assert (=> b!167156 m!265821))

(declare-fun m!265823 () Bool)

(assert (=> b!167156 m!265823))

(declare-fun m!265825 () Bool)

(assert (=> b!167156 m!265825))

(declare-fun m!265827 () Bool)

(assert (=> start!36256 m!265827))

(check-sat (not b!167154) (not start!36256) (not b!167156) (not b!167157))
(check-sat)
(get-model)

(declare-fun d!58493 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58493 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3842 (buf!4294 thiss!1577))) ((_ sign_extend 32) (currentByte!8124 thiss!1577)) ((_ sign_extend 32) (currentBit!8119 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3842 (buf!4294 thiss!1577))) ((_ sign_extend 32) (currentByte!8124 thiss!1577)) ((_ sign_extend 32) (currentBit!8119 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14522 () Bool)

(assert (= bs!14522 d!58493))

(declare-fun m!265865 () Bool)

(assert (=> bs!14522 m!265865))

(assert (=> b!167154 d!58493))

(declare-fun d!58495 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58495 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8119 thiss!1577) (currentByte!8124 thiss!1577) (size!3842 (buf!4294 thiss!1577))))))

(declare-fun bs!14523 () Bool)

(assert (= bs!14523 d!58495))

(declare-fun m!265867 () Bool)

(assert (=> bs!14523 m!265867))

(assert (=> start!36256 d!58495))

(declare-fun d!58497 () Bool)

(declare-fun res!139171 () Bool)

(declare-fun e!115943 () Bool)

(assert (=> d!58497 (=> res!139171 e!115943)))

(assert (=> d!58497 (= res!139171 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (=> d!58497 (= (arrayRangesEq!671 lt!260213 lt!260220 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))) e!115943)))

(declare-fun b!167174 () Bool)

(declare-fun e!115944 () Bool)

(assert (=> b!167174 (= e!115943 e!115944)))

(declare-fun res!139172 () Bool)

(assert (=> b!167174 (=> (not res!139172) (not e!115944))))

(assert (=> b!167174 (= res!139172 (= (select (arr!4763 lt!260213) #b00000000000000000000000000000000) (select (arr!4763 lt!260220) #b00000000000000000000000000000000)))))

(declare-fun b!167175 () Bool)

(assert (=> b!167175 (= e!115944 (arrayRangesEq!671 lt!260213 lt!260220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (= (and d!58497 (not res!139171)) b!167174))

(assert (= (and b!167174 res!139172) b!167175))

(declare-fun m!265869 () Bool)

(assert (=> b!167174 m!265869))

(declare-fun m!265871 () Bool)

(assert (=> b!167174 m!265871))

(declare-fun m!265873 () Bool)

(assert (=> b!167175 m!265873))

(assert (=> b!167156 d!58497))

(declare-fun d!58499 () Bool)

(assert (=> d!58499 (arrayRangesEq!671 (buf!4294 thiss!1577) lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577))))

(declare-fun lt!260255 () Unit!11632)

(declare-fun choose!239 (array!8647 array!8647 array!8647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11632)

(assert (=> d!58499 (= lt!260255 (choose!239 (buf!4294 thiss!1577) lt!260213 lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (=> d!58499 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)) (bvsle (currentByte!8124 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (=> d!58499 (= (arrayRangesEqTransitive!173 (buf!4294 thiss!1577) lt!260213 lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))) lt!260255)))

(declare-fun bs!14524 () Bool)

(assert (= bs!14524 d!58499))

(assert (=> bs!14524 m!265803))

(declare-fun m!265875 () Bool)

(assert (=> bs!14524 m!265875))

(assert (=> b!167156 d!58499))

(declare-fun d!58501 () Bool)

(declare-fun res!139173 () Bool)

(declare-fun e!115945 () Bool)

(assert (=> d!58501 (=> res!139173 e!115945)))

(assert (=> d!58501 (= res!139173 (= #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)))))

(assert (=> d!58501 (= (arrayRangesEq!671 (buf!4294 thiss!1577) lt!260220 #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)) e!115945)))

(declare-fun b!167176 () Bool)

(declare-fun e!115946 () Bool)

(assert (=> b!167176 (= e!115945 e!115946)))

(declare-fun res!139174 () Bool)

(assert (=> b!167176 (=> (not res!139174) (not e!115946))))

(assert (=> b!167176 (= res!139174 (= (select (arr!4763 (buf!4294 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4763 lt!260220) #b00000000000000000000000000000000)))))

(declare-fun b!167177 () Bool)

(assert (=> b!167177 (= e!115946 (arrayRangesEq!671 (buf!4294 thiss!1577) lt!260220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8124 thiss!1577)))))

(assert (= (and d!58501 (not res!139173)) b!167176))

(assert (= (and b!167176 res!139174) b!167177))

(declare-fun m!265877 () Bool)

(assert (=> b!167176 m!265877))

(assert (=> b!167176 m!265871))

(declare-fun m!265879 () Bool)

(assert (=> b!167177 m!265879))

(assert (=> b!167156 d!58501))

(declare-fun d!58503 () Bool)

(declare-fun e!115949 () Bool)

(assert (=> d!58503 e!115949))

(declare-fun res!139177 () Bool)

(assert (=> d!58503 (=> (not res!139177) (not e!115949))))

(assert (=> d!58503 (= res!139177 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) (size!3842 lt!260213))))))

(declare-fun lt!260258 () Unit!11632)

(declare-fun choose!240 (array!8647 (_ BitVec 32) (_ BitVec 8)) Unit!11632)

(assert (=> d!58503 (= lt!260258 (choose!240 lt!260213 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221))))

(assert (=> d!58503 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) (size!3842 lt!260213)))))

(assert (=> d!58503 (= (arrayUpdatedAtPrefixLemma!279 lt!260213 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221) lt!260258)))

(declare-fun b!167180 () Bool)

(assert (=> b!167180 (= e!115949 (arrayRangesEq!671 lt!260213 (array!8648 (store (arr!4763 lt!260213) (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577)) lt!260221) (size!3842 lt!260213)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8124 thiss!1577))))))

(assert (= (and d!58503 res!139177) b!167180))

(declare-fun m!265881 () Bool)

(assert (=> d!58503 m!265881))

(declare-fun m!265883 () Bool)

(assert (=> b!167180 m!265883))

(declare-fun m!265885 () Bool)

(assert (=> b!167180 m!265885))

(assert (=> b!167156 d!58503))

(declare-fun d!58505 () Bool)

(declare-fun e!115950 () Bool)

(assert (=> d!58505 e!115950))

(declare-fun res!139178 () Bool)

(assert (=> d!58505 (=> (not res!139178) (not e!115950))))

(assert (=> d!58505 (= res!139178 (and (bvsge (currentByte!8124 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8124 thiss!1577) (size!3842 (buf!4294 thiss!1577)))))))

(declare-fun lt!260259 () Unit!11632)

(assert (=> d!58505 (= lt!260259 (choose!240 (buf!4294 thiss!1577) (currentByte!8124 thiss!1577) lt!260216))))

(assert (=> d!58505 (and (bvsle #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)) (bvslt (currentByte!8124 thiss!1577) (size!3842 (buf!4294 thiss!1577))))))

(assert (=> d!58505 (= (arrayUpdatedAtPrefixLemma!279 (buf!4294 thiss!1577) (currentByte!8124 thiss!1577) lt!260216) lt!260259)))

(declare-fun b!167181 () Bool)

(assert (=> b!167181 (= e!115950 (arrayRangesEq!671 (buf!4294 thiss!1577) (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) lt!260216) (size!3842 (buf!4294 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)))))

(assert (= (and d!58505 res!139178) b!167181))

(declare-fun m!265887 () Bool)

(assert (=> d!58505 m!265887))

(assert (=> b!167181 m!265825))

(assert (=> b!167181 m!265813))

(assert (=> b!167156 d!58505))

(declare-fun d!58507 () Bool)

(declare-fun res!139179 () Bool)

(declare-fun e!115951 () Bool)

(assert (=> d!58507 (=> res!139179 e!115951)))

(assert (=> d!58507 (= res!139179 (= #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)))))

(assert (=> d!58507 (= (arrayRangesEq!671 (buf!4294 thiss!1577) (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) lt!260216) (size!3842 (buf!4294 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8124 thiss!1577)) e!115951)))

(declare-fun b!167182 () Bool)

(declare-fun e!115952 () Bool)

(assert (=> b!167182 (= e!115951 e!115952)))

(declare-fun res!139180 () Bool)

(assert (=> b!167182 (=> (not res!139180) (not e!115952))))

(assert (=> b!167182 (= res!139180 (= (select (arr!4763 (buf!4294 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4763 (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) lt!260216) (size!3842 (buf!4294 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167183 () Bool)

(assert (=> b!167183 (= e!115952 (arrayRangesEq!671 (buf!4294 thiss!1577) (array!8648 (store (arr!4763 (buf!4294 thiss!1577)) (currentByte!8124 thiss!1577) lt!260216) (size!3842 (buf!4294 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8124 thiss!1577)))))

(assert (= (and d!58507 (not res!139179)) b!167182))

(assert (= (and b!167182 res!139180) b!167183))

(assert (=> b!167182 m!265877))

(declare-fun m!265889 () Bool)

(assert (=> b!167182 m!265889))

(declare-fun m!265891 () Bool)

(assert (=> b!167183 m!265891))

(assert (=> b!167156 d!58507))

(declare-fun d!58509 () Bool)

(assert (=> d!58509 (= (array_inv!3583 (buf!4294 thiss!1577)) (bvsge (size!3842 (buf!4294 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167157 d!58509))

(check-sat (not b!167180) (not b!167175) (not d!58505) (not b!167181) (not d!58493) (not d!58503) (not b!167177) (not b!167183) (not d!58495) (not d!58499))
(check-sat)
