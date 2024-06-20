; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37194 () Bool)

(assert start!37194)

(declare-datatypes ((array!8891 0))(
  ( (array!8892 (arr!4856 (Array (_ BitVec 32) (_ BitVec 8))) (size!3935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7026 0))(
  ( (BitStream!7027 (buf!4387 array!8891) (currentByte!8365 (_ BitVec 32)) (currentBit!8360 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11789 0))(
  ( (Unit!11790) )
))
(declare-datatypes ((tuple3!974 0))(
  ( (tuple3!975 (_1!7941 Unit!11789) (_2!7941 (_ BitVec 8)) (_3!613 BitStream!7026)) )
))
(declare-fun e!117548 () tuple3!974)

(declare-fun thiss!1894 () BitStream!7026)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((tuple2!14656 0))(
  ( (tuple2!14657 (_1!7942 Unit!11789) (_2!7942 BitStream!7026)) )
))
(declare-fun lt!262046 () tuple2!14656)

(declare-fun b!169036 () Bool)

(assert (=> b!169036 (= e!117548 (tuple3!975 (_1!7942 lt!262046) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4856 (buf!4387 thiss!1894)) (currentByte!8365 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8360 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7942 lt!262046)))))

(declare-fun moveBitIndex!0 (BitStream!7026 (_ BitVec 64)) tuple2!14656)

(assert (=> b!169036 (= lt!262046 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!169037 () Bool)

(declare-fun e!117549 () Bool)

(declare-fun e!117546 () Bool)

(assert (=> b!169037 (= e!117549 e!117546)))

(declare-fun res!140584 () Bool)

(assert (=> b!169037 (=> res!140584 e!117546)))

(declare-fun lt!262048 () tuple3!974)

(assert (=> b!169037 (= res!140584 (not (= (buf!4387 (_3!613 lt!262048)) (buf!4387 thiss!1894))))))

(assert (=> b!169037 (= lt!262048 e!117548)))

(declare-fun c!8720 () Bool)

(assert (=> b!169037 (= c!8720 (bvsle (bvadd (currentBit!8360 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!169038 () Bool)

(declare-fun lt!262047 () (_ BitVec 32))

(declare-fun Unit!11791 () Unit!11789)

(assert (=> b!169038 (= e!117548 (tuple3!975 Unit!11791 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4856 (buf!4387 thiss!1894)) (currentByte!8365 thiss!1894))) lt!262047))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4856 (buf!4387 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8365 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!262047))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7027 (buf!4387 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8365 thiss!1894)) lt!262047)))))

(assert (=> b!169038 (= lt!262047 (bvsub (bvadd (currentBit!8360 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!169039 () Bool)

(declare-fun e!117547 () Bool)

(declare-fun array_inv!3676 (array!8891) Bool)

(assert (=> b!169039 (= e!117547 (array_inv!3676 (buf!4387 thiss!1894)))))

(declare-fun b!169040 () Bool)

(declare-fun res!140585 () Bool)

(assert (=> b!169040 (=> (not res!140585) (not e!117549))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169040 (= res!140585 (validate_offset_bits!1 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))) ((_ sign_extend 32) (currentByte!8365 thiss!1894)) ((_ sign_extend 32) (currentBit!8360 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!169041 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!169041 (= e!117546 (not (= (bitIndex!0 (size!3935 (buf!4387 (_3!613 lt!262048))) (currentByte!8365 (_3!613 lt!262048)) (currentBit!8360 (_3!613 lt!262048))) (bvadd (bitIndex!0 (size!3935 (buf!4387 thiss!1894)) (currentByte!8365 thiss!1894) (currentBit!8360 thiss!1894)) ((_ sign_extend 32) nBits!600)))))))

(declare-fun res!140583 () Bool)

(assert (=> start!37194 (=> (not res!140583) (not e!117549))))

(assert (=> start!37194 (= res!140583 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37194 e!117549))

(assert (=> start!37194 true))

(declare-fun inv!12 (BitStream!7026) Bool)

(assert (=> start!37194 (and (inv!12 thiss!1894) e!117547)))

(assert (= (and start!37194 res!140583) b!169040))

(assert (= (and b!169040 res!140585) b!169037))

(assert (= (and b!169037 c!8720) b!169036))

(assert (= (and b!169037 (not c!8720)) b!169038))

(assert (= (and b!169037 (not res!140584)) b!169041))

(assert (= start!37194 b!169039))

(declare-fun m!268599 () Bool)

(assert (=> b!169036 m!268599))

(declare-fun m!268601 () Bool)

(assert (=> b!169036 m!268601))

(declare-fun m!268603 () Bool)

(assert (=> b!169036 m!268603))

(declare-fun m!268605 () Bool)

(assert (=> start!37194 m!268605))

(assert (=> b!169038 m!268599))

(declare-fun m!268607 () Bool)

(assert (=> b!169038 m!268607))

(assert (=> b!169038 m!268601))

(declare-fun m!268609 () Bool)

(assert (=> b!169040 m!268609))

(declare-fun m!268611 () Bool)

(assert (=> b!169039 m!268611))

(declare-fun m!268613 () Bool)

(assert (=> b!169041 m!268613))

(declare-fun m!268615 () Bool)

(assert (=> b!169041 m!268615))

(check-sat (not b!169039) (not b!169041) (not start!37194) (not b!169040) (not b!169036))
(check-sat)
(get-model)

(declare-fun d!59769 () Bool)

(declare-fun lt!262116 () (_ BitVec 32))

(assert (=> d!59769 (= lt!262116 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!262115 () (_ BitVec 32))

(assert (=> d!59769 (= lt!262115 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117579 () Bool)

(assert (=> d!59769 e!117579))

(declare-fun res!140613 () Bool)

(assert (=> d!59769 (=> (not res!140613) (not e!117579))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7026 (_ BitVec 64)) Bool)

(assert (=> d!59769 (= res!140613 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11801 () Unit!11789)

(declare-fun Unit!11802 () Unit!11789)

(declare-fun Unit!11803 () Unit!11789)

(assert (=> d!59769 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8360 thiss!1894) lt!262116) #b00000000000000000000000000000000) (tuple2!14657 Unit!11801 (BitStream!7027 (buf!4387 thiss!1894) (bvsub (bvadd (currentByte!8365 thiss!1894) lt!262115) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262116 (currentBit!8360 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8360 thiss!1894) lt!262116) #b00000000000000000000000000001000) (tuple2!14657 Unit!11802 (BitStream!7027 (buf!4387 thiss!1894) (bvadd (currentByte!8365 thiss!1894) lt!262115 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8360 thiss!1894) lt!262116) #b00000000000000000000000000001000))) (tuple2!14657 Unit!11803 (BitStream!7027 (buf!4387 thiss!1894) (bvadd (currentByte!8365 thiss!1894) lt!262115) (bvadd (currentBit!8360 thiss!1894) lt!262116))))))))

(declare-fun b!169078 () Bool)

(declare-fun e!117580 () Bool)

(assert (=> b!169078 (= e!117579 e!117580)))

(declare-fun res!140614 () Bool)

(assert (=> b!169078 (=> (not res!140614) (not e!117580))))

(declare-fun lt!262114 () (_ BitVec 64))

(declare-fun lt!262112 () tuple2!14656)

(assert (=> b!169078 (= res!140614 (= (bvadd lt!262114 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3935 (buf!4387 (_2!7942 lt!262112))) (currentByte!8365 (_2!7942 lt!262112)) (currentBit!8360 (_2!7942 lt!262112)))))))

(assert (=> b!169078 (or (not (= (bvand lt!262114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!262114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!262114 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!169078 (= lt!262114 (bitIndex!0 (size!3935 (buf!4387 thiss!1894)) (currentByte!8365 thiss!1894) (currentBit!8360 thiss!1894)))))

(declare-fun lt!262117 () (_ BitVec 32))

(declare-fun lt!262113 () (_ BitVec 32))

(declare-fun Unit!11804 () Unit!11789)

(declare-fun Unit!11805 () Unit!11789)

(declare-fun Unit!11806 () Unit!11789)

(assert (=> b!169078 (= lt!262112 (ite (bvslt (bvadd (currentBit!8360 thiss!1894) lt!262117) #b00000000000000000000000000000000) (tuple2!14657 Unit!11804 (BitStream!7027 (buf!4387 thiss!1894) (bvsub (bvadd (currentByte!8365 thiss!1894) lt!262113) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262117 (currentBit!8360 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8360 thiss!1894) lt!262117) #b00000000000000000000000000001000) (tuple2!14657 Unit!11805 (BitStream!7027 (buf!4387 thiss!1894) (bvadd (currentByte!8365 thiss!1894) lt!262113 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8360 thiss!1894) lt!262117) #b00000000000000000000000000001000))) (tuple2!14657 Unit!11806 (BitStream!7027 (buf!4387 thiss!1894) (bvadd (currentByte!8365 thiss!1894) lt!262113) (bvadd (currentBit!8360 thiss!1894) lt!262117))))))))

(assert (=> b!169078 (= lt!262117 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169078 (= lt!262113 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!169079 () Bool)

(assert (=> b!169079 (= e!117580 (and (= (size!3935 (buf!4387 thiss!1894)) (size!3935 (buf!4387 (_2!7942 lt!262112)))) (= (buf!4387 thiss!1894) (buf!4387 (_2!7942 lt!262112)))))))

(assert (= (and d!59769 res!140613) b!169078))

(assert (= (and b!169078 res!140614) b!169079))

(declare-fun m!268649 () Bool)

(assert (=> d!59769 m!268649))

(declare-fun m!268651 () Bool)

(assert (=> b!169078 m!268651))

(assert (=> b!169078 m!268615))

(assert (=> b!169036 d!59769))

(declare-fun d!59781 () Bool)

(declare-fun e!117583 () Bool)

(assert (=> d!59781 e!117583))

(declare-fun res!140619 () Bool)

(assert (=> d!59781 (=> (not res!140619) (not e!117583))))

(declare-fun lt!262131 () (_ BitVec 64))

(declare-fun lt!262132 () (_ BitVec 64))

(declare-fun lt!262134 () (_ BitVec 64))

(assert (=> d!59781 (= res!140619 (= lt!262131 (bvsub lt!262134 lt!262132)))))

(assert (=> d!59781 (or (= (bvand lt!262134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262134 lt!262132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59781 (= lt!262132 (remainingBits!0 ((_ sign_extend 32) (size!3935 (buf!4387 (_3!613 lt!262048)))) ((_ sign_extend 32) (currentByte!8365 (_3!613 lt!262048))) ((_ sign_extend 32) (currentBit!8360 (_3!613 lt!262048)))))))

(declare-fun lt!262130 () (_ BitVec 64))

(declare-fun lt!262133 () (_ BitVec 64))

(assert (=> d!59781 (= lt!262134 (bvmul lt!262130 lt!262133))))

(assert (=> d!59781 (or (= lt!262130 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262133 (bvsdiv (bvmul lt!262130 lt!262133) lt!262130)))))

(assert (=> d!59781 (= lt!262133 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59781 (= lt!262130 ((_ sign_extend 32) (size!3935 (buf!4387 (_3!613 lt!262048)))))))

(assert (=> d!59781 (= lt!262131 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8365 (_3!613 lt!262048))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8360 (_3!613 lt!262048)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59781 (invariant!0 (currentBit!8360 (_3!613 lt!262048)) (currentByte!8365 (_3!613 lt!262048)) (size!3935 (buf!4387 (_3!613 lt!262048))))))

(assert (=> d!59781 (= (bitIndex!0 (size!3935 (buf!4387 (_3!613 lt!262048))) (currentByte!8365 (_3!613 lt!262048)) (currentBit!8360 (_3!613 lt!262048))) lt!262131)))

(declare-fun b!169084 () Bool)

(declare-fun res!140620 () Bool)

(assert (=> b!169084 (=> (not res!140620) (not e!117583))))

(assert (=> b!169084 (= res!140620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262131))))

(declare-fun b!169085 () Bool)

(declare-fun lt!262135 () (_ BitVec 64))

(assert (=> b!169085 (= e!117583 (bvsle lt!262131 (bvmul lt!262135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169085 (or (= lt!262135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262135)))))

(assert (=> b!169085 (= lt!262135 ((_ sign_extend 32) (size!3935 (buf!4387 (_3!613 lt!262048)))))))

(assert (= (and d!59781 res!140619) b!169084))

(assert (= (and b!169084 res!140620) b!169085))

(declare-fun m!268653 () Bool)

(assert (=> d!59781 m!268653))

(declare-fun m!268655 () Bool)

(assert (=> d!59781 m!268655))

(assert (=> b!169041 d!59781))

(declare-fun d!59783 () Bool)

(declare-fun e!117584 () Bool)

(assert (=> d!59783 e!117584))

(declare-fun res!140621 () Bool)

(assert (=> d!59783 (=> (not res!140621) (not e!117584))))

(declare-fun lt!262137 () (_ BitVec 64))

(declare-fun lt!262140 () (_ BitVec 64))

(declare-fun lt!262138 () (_ BitVec 64))

(assert (=> d!59783 (= res!140621 (= lt!262137 (bvsub lt!262140 lt!262138)))))

(assert (=> d!59783 (or (= (bvand lt!262140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262140 lt!262138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59783 (= lt!262138 (remainingBits!0 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))) ((_ sign_extend 32) (currentByte!8365 thiss!1894)) ((_ sign_extend 32) (currentBit!8360 thiss!1894))))))

(declare-fun lt!262136 () (_ BitVec 64))

(declare-fun lt!262139 () (_ BitVec 64))

(assert (=> d!59783 (= lt!262140 (bvmul lt!262136 lt!262139))))

(assert (=> d!59783 (or (= lt!262136 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262139 (bvsdiv (bvmul lt!262136 lt!262139) lt!262136)))))

(assert (=> d!59783 (= lt!262139 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59783 (= lt!262136 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))))))

(assert (=> d!59783 (= lt!262137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8365 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8360 thiss!1894))))))

(assert (=> d!59783 (invariant!0 (currentBit!8360 thiss!1894) (currentByte!8365 thiss!1894) (size!3935 (buf!4387 thiss!1894)))))

(assert (=> d!59783 (= (bitIndex!0 (size!3935 (buf!4387 thiss!1894)) (currentByte!8365 thiss!1894) (currentBit!8360 thiss!1894)) lt!262137)))

(declare-fun b!169086 () Bool)

(declare-fun res!140622 () Bool)

(assert (=> b!169086 (=> (not res!140622) (not e!117584))))

(assert (=> b!169086 (= res!140622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262137))))

(declare-fun b!169087 () Bool)

(declare-fun lt!262141 () (_ BitVec 64))

(assert (=> b!169087 (= e!117584 (bvsle lt!262137 (bvmul lt!262141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169087 (or (= lt!262141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262141)))))

(assert (=> b!169087 (= lt!262141 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))))))

(assert (= (and d!59783 res!140621) b!169086))

(assert (= (and b!169086 res!140622) b!169087))

(declare-fun m!268657 () Bool)

(assert (=> d!59783 m!268657))

(declare-fun m!268659 () Bool)

(assert (=> d!59783 m!268659))

(assert (=> b!169041 d!59783))

(declare-fun d!59785 () Bool)

(assert (=> d!59785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))) ((_ sign_extend 32) (currentByte!8365 thiss!1894)) ((_ sign_extend 32) (currentBit!8360 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3935 (buf!4387 thiss!1894))) ((_ sign_extend 32) (currentByte!8365 thiss!1894)) ((_ sign_extend 32) (currentBit!8360 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14823 () Bool)

(assert (= bs!14823 d!59785))

(assert (=> bs!14823 m!268657))

(assert (=> b!169040 d!59785))

(declare-fun d!59787 () Bool)

(assert (=> d!59787 (= (array_inv!3676 (buf!4387 thiss!1894)) (bvsge (size!3935 (buf!4387 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!169039 d!59787))

(declare-fun d!59789 () Bool)

(assert (=> d!59789 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8360 thiss!1894) (currentByte!8365 thiss!1894) (size!3935 (buf!4387 thiss!1894))))))

(declare-fun bs!14824 () Bool)

(assert (= bs!14824 d!59789))

(assert (=> bs!14824 m!268659))

(assert (=> start!37194 d!59789))

(check-sat (not d!59789) (not d!59769) (not b!169078) (not d!59785) (not d!59783) (not d!59781))
(check-sat)
