; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36136 () Bool)

(assert start!36136)

(declare-fun b!166825 () Bool)

(declare-fun res!138881 () Bool)

(declare-fun e!115652 () Bool)

(assert (=> b!166825 (=> (not res!138881) (not e!115652))))

(declare-datatypes ((array!8603 0))(
  ( (array!8604 (arr!4745 (Array (_ BitVec 32) (_ BitVec 8))) (size!3824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6804 0))(
  ( (BitStream!6805 (buf!4276 array!8603) (currentByte!8098 (_ BitVec 32)) (currentBit!8093 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6804)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166825 (= res!138881 (bvsgt (bvadd (currentBit!8093 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166827 () Bool)

(declare-fun e!115651 () Bool)

(declare-fun array_inv!3565 (array!8603) Bool)

(assert (=> b!166827 (= e!115651 (array_inv!3565 (buf!4276 thiss!1577)))))

(declare-fun res!138879 () Bool)

(assert (=> start!36136 (=> (not res!138879) (not e!115652))))

(assert (=> start!36136 (= res!138879 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36136 e!115652))

(assert (=> start!36136 true))

(declare-fun inv!12 (BitStream!6804) Bool)

(assert (=> start!36136 (and (inv!12 thiss!1577) e!115651)))

(declare-fun b!166824 () Bool)

(declare-fun res!138880 () Bool)

(assert (=> b!166824 (=> (not res!138880) (not e!115652))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166824 (= res!138880 (validate_offset_bits!1 ((_ sign_extend 32) (size!3824 (buf!4276 thiss!1577))) ((_ sign_extend 32) (currentByte!8098 thiss!1577)) ((_ sign_extend 32) (currentBit!8093 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166826 () Bool)

(declare-fun lt!259784 () (_ BitVec 32))

(assert (=> b!166826 (= e!115652 (not (or (= lt!259784 #b00000000000000000000000000000000) (= lt!259784 (bvand (currentByte!8098 thiss!1577) #b10000000000000000000000000000000)))))))

(assert (=> b!166826 (= lt!259784 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) #b10000000000000000000000000000000))))

(declare-fun lt!259783 () (_ BitVec 8))

(declare-fun lt!259782 () (_ BitVec 32))

(declare-fun lt!259781 () array!8603)

(declare-fun lt!259786 () (_ BitVec 32))

(declare-fun arrayRangesEq!653 (array!8603 array!8603 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166826 (arrayRangesEq!653 lt!259781 (array!8604 (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (size!3824 (buf!4276 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)))))

(declare-datatypes ((Unit!11596 0))(
  ( (Unit!11597) )
))
(declare-fun lt!259788 () Unit!11596)

(declare-fun arrayUpdatedAtPrefixLemma!261 (array!8603 (_ BitVec 32) (_ BitVec 8)) Unit!11596)

(assert (=> b!166826 (= lt!259788 (arrayUpdatedAtPrefixLemma!261 lt!259781 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783))))

(assert (=> b!166826 (arrayRangesEq!653 (buf!4276 thiss!1577) (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) (size!3824 (buf!4276 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8098 thiss!1577))))

(declare-fun lt!259787 () Unit!11596)

(assert (=> b!166826 (= lt!259787 (arrayUpdatedAtPrefixLemma!261 (buf!4276 thiss!1577) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))))))

(declare-fun lt!259785 () (_ BitVec 32))

(assert (=> b!166826 (= lt!259783 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259785))) (bvshl lt!259782 lt!259785))))))

(assert (=> b!166826 (= lt!259785 (bvsub #b00000000000000000000000000001000 lt!259786))))

(assert (=> b!166826 (= lt!259781 (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (size!3824 (buf!4276 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166826 (= lt!259782 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166826 (= lt!259786 (bvsub (bvadd (currentBit!8093 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36136 res!138879) b!166824))

(assert (= (and b!166824 res!138880) b!166825))

(assert (= (and b!166825 res!138881) b!166826))

(assert (= start!36136 b!166827))

(declare-fun m!265011 () Bool)

(assert (=> b!166827 m!265011))

(declare-fun m!265013 () Bool)

(assert (=> start!36136 m!265013))

(declare-fun m!265015 () Bool)

(assert (=> b!166824 m!265015))

(declare-fun m!265017 () Bool)

(assert (=> b!166826 m!265017))

(declare-fun m!265019 () Bool)

(assert (=> b!166826 m!265019))

(declare-fun m!265021 () Bool)

(assert (=> b!166826 m!265021))

(declare-fun m!265023 () Bool)

(assert (=> b!166826 m!265023))

(declare-fun m!265025 () Bool)

(assert (=> b!166826 m!265025))

(declare-fun m!265027 () Bool)

(assert (=> b!166826 m!265027))

(assert (=> b!166826 m!265021))

(declare-fun m!265029 () Bool)

(assert (=> b!166826 m!265029))

(declare-fun m!265031 () Bool)

(assert (=> b!166826 m!265031))

(declare-fun m!265033 () Bool)

(assert (=> b!166826 m!265033))

(declare-fun m!265035 () Bool)

(assert (=> b!166826 m!265035))

(declare-fun m!265037 () Bool)

(assert (=> b!166826 m!265037))

(declare-fun m!265039 () Bool)

(assert (=> b!166826 m!265039))

(declare-fun m!265041 () Bool)

(assert (=> b!166826 m!265041))

(check-sat (not start!36136) (not b!166826) (not b!166827) (not b!166824))
(check-sat)
(get-model)

(declare-fun d!58365 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58365 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8093 thiss!1577) (currentByte!8098 thiss!1577) (size!3824 (buf!4276 thiss!1577))))))

(declare-fun bs!14488 () Bool)

(assert (= bs!14488 d!58365))

(declare-fun m!265075 () Bool)

(assert (=> bs!14488 m!265075))

(assert (=> start!36136 d!58365))

(declare-fun d!58367 () Bool)

(declare-fun res!138895 () Bool)

(declare-fun e!115667 () Bool)

(assert (=> d!58367 (=> res!138895 e!115667)))

(assert (=> d!58367 (= res!138895 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577))))))

(assert (=> d!58367 (= (arrayRangesEq!653 lt!259781 (array!8604 (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (size!3824 (buf!4276 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577))) e!115667)))

(declare-fun b!166844 () Bool)

(declare-fun e!115668 () Bool)

(assert (=> b!166844 (= e!115667 e!115668)))

(declare-fun res!138896 () Bool)

(assert (=> b!166844 (=> (not res!138896) (not e!115668))))

(assert (=> b!166844 (= res!138896 (= (select (arr!4745 lt!259781) #b00000000000000000000000000000000) (select (arr!4745 (array!8604 (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (size!3824 (buf!4276 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166845 () Bool)

(assert (=> b!166845 (= e!115668 (arrayRangesEq!653 lt!259781 (array!8604 (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (size!3824 (buf!4276 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577))))))

(assert (= (and d!58367 (not res!138895)) b!166844))

(assert (= (and b!166844 res!138896) b!166845))

(declare-fun m!265077 () Bool)

(assert (=> b!166844 m!265077))

(declare-fun m!265079 () Bool)

(assert (=> b!166844 m!265079))

(declare-fun m!265081 () Bool)

(assert (=> b!166845 m!265081))

(assert (=> b!166826 d!58367))

(declare-fun d!58369 () Bool)

(declare-fun e!115671 () Bool)

(assert (=> d!58369 e!115671))

(declare-fun res!138899 () Bool)

(assert (=> d!58369 (=> (not res!138899) (not e!115671))))

(assert (=> d!58369 (= res!138899 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) (size!3824 lt!259781))))))

(declare-fun lt!259815 () Unit!11596)

(declare-fun choose!232 (array!8603 (_ BitVec 32) (_ BitVec 8)) Unit!11596)

(assert (=> d!58369 (= lt!259815 (choose!232 lt!259781 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783))))

(assert (=> d!58369 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) (size!3824 lt!259781)))))

(assert (=> d!58369 (= (arrayUpdatedAtPrefixLemma!261 lt!259781 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) lt!259815)))

(declare-fun b!166848 () Bool)

(assert (=> b!166848 (= e!115671 (arrayRangesEq!653 lt!259781 (array!8604 (store (arr!4745 lt!259781) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (size!3824 lt!259781)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577))))))

(assert (= (and d!58369 res!138899) b!166848))

(declare-fun m!265083 () Bool)

(assert (=> d!58369 m!265083))

(declare-fun m!265085 () Bool)

(assert (=> b!166848 m!265085))

(declare-fun m!265087 () Bool)

(assert (=> b!166848 m!265087))

(assert (=> b!166826 d!58369))

(declare-fun d!58371 () Bool)

(declare-fun res!138900 () Bool)

(declare-fun e!115672 () Bool)

(assert (=> d!58371 (=> res!138900 e!115672)))

(assert (=> d!58371 (= res!138900 (= #b00000000000000000000000000000000 (currentByte!8098 thiss!1577)))))

(assert (=> d!58371 (= (arrayRangesEq!653 (buf!4276 thiss!1577) (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) (size!3824 (buf!4276 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8098 thiss!1577)) e!115672)))

(declare-fun b!166849 () Bool)

(declare-fun e!115673 () Bool)

(assert (=> b!166849 (= e!115672 e!115673)))

(declare-fun res!138901 () Bool)

(assert (=> b!166849 (=> (not res!138901) (not e!115673))))

(assert (=> b!166849 (= res!138901 (= (select (arr!4745 (buf!4276 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4745 (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) (size!3824 (buf!4276 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166850 () Bool)

(assert (=> b!166850 (= e!115673 (arrayRangesEq!653 (buf!4276 thiss!1577) (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) (size!3824 (buf!4276 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8098 thiss!1577)))))

(assert (= (and d!58371 (not res!138900)) b!166849))

(assert (= (and b!166849 res!138901) b!166850))

(declare-fun m!265089 () Bool)

(assert (=> b!166849 m!265089))

(declare-fun m!265091 () Bool)

(assert (=> b!166849 m!265091))

(declare-fun m!265093 () Bool)

(assert (=> b!166850 m!265093))

(assert (=> b!166826 d!58371))

(declare-fun d!58373 () Bool)

(declare-fun e!115674 () Bool)

(assert (=> d!58373 e!115674))

(declare-fun res!138902 () Bool)

(assert (=> d!58373 (=> (not res!138902) (not e!115674))))

(assert (=> d!58373 (= res!138902 (and (bvsge (currentByte!8098 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8098 thiss!1577) (size!3824 (buf!4276 thiss!1577)))))))

(declare-fun lt!259816 () Unit!11596)

(assert (=> d!58373 (= lt!259816 (choose!232 (buf!4276 thiss!1577) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))))))

(assert (=> d!58373 (and (bvsle #b00000000000000000000000000000000 (currentByte!8098 thiss!1577)) (bvslt (currentByte!8098 thiss!1577) (size!3824 (buf!4276 thiss!1577))))))

(assert (=> d!58373 (= (arrayUpdatedAtPrefixLemma!261 (buf!4276 thiss!1577) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) lt!259816)))

(declare-fun b!166851 () Bool)

(assert (=> b!166851 (= e!115674 (arrayRangesEq!653 (buf!4276 thiss!1577) (array!8604 (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) (select (store (store (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4745 (buf!4276 thiss!1577)) (currentByte!8098 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8093 thiss!1577)))))))) (bvlshr (bvand lt!259782 #b00000000000000000000000011111111) lt!259786)))) (bvadd #b00000000000000000000000000000001 (currentByte!8098 thiss!1577)) lt!259783) (currentByte!8098 thiss!1577))) (size!3824 (buf!4276 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8098 thiss!1577)))))

(assert (= (and d!58373 res!138902) b!166851))

(assert (=> d!58373 m!265021))

(declare-fun m!265095 () Bool)

(assert (=> d!58373 m!265095))

(assert (=> b!166851 m!265025))

(assert (=> b!166851 m!265027))

(assert (=> b!166826 d!58373))

(declare-fun d!58375 () Bool)

(assert (=> d!58375 (= (array_inv!3565 (buf!4276 thiss!1577)) (bvsge (size!3824 (buf!4276 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166827 d!58375))

(declare-fun d!58377 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58377 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3824 (buf!4276 thiss!1577))) ((_ sign_extend 32) (currentByte!8098 thiss!1577)) ((_ sign_extend 32) (currentBit!8093 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3824 (buf!4276 thiss!1577))) ((_ sign_extend 32) (currentByte!8098 thiss!1577)) ((_ sign_extend 32) (currentBit!8093 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14489 () Bool)

(assert (= bs!14489 d!58377))

(declare-fun m!265097 () Bool)

(assert (=> bs!14489 m!265097))

(assert (=> b!166824 d!58377))

(check-sat (not d!58369) (not d!58365) (not b!166851) (not b!166845) (not b!166850) (not b!166848) (not d!58373) (not d!58377))
(check-sat)
