; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35384 () Bool)

(assert start!35384)

(declare-fun b!165581 () Bool)

(declare-fun e!114605 () Bool)

(declare-fun e!114602 () Bool)

(assert (=> b!165581 (= e!114605 e!114602)))

(declare-fun res!137919 () Bool)

(assert (=> b!165581 (=> (not res!137919) (not e!114602))))

(declare-datatypes ((array!8434 0))(
  ( (array!8435 (arr!4686 (Array (_ BitVec 32) (_ BitVec 8))) (size!3765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6686 0))(
  ( (BitStream!6687 (buf!4217 array!8434) (currentByte!7899 (_ BitVec 32)) (currentBit!7894 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6686)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!165581 (= res!137919 (bvsle (bvadd (currentBit!7894 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun lt!258885 () (_ BitVec 8))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165581 (= lt!258885 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(declare-fun b!165582 () Bool)

(declare-fun res!137920 () Bool)

(declare-fun e!114604 () Bool)

(assert (=> b!165582 (=> (not res!137920) (not e!114604))))

(declare-datatypes ((Unit!11520 0))(
  ( (Unit!11521) )
))
(declare-datatypes ((tuple2!14588 0))(
  ( (tuple2!14589 (_1!7885 Unit!11520) (_2!7885 BitStream!6686)) )
))
(declare-fun lt!258884 () tuple2!14588)

(declare-fun isPrefixOf!0 (BitStream!6686 BitStream!6686) Bool)

(assert (=> b!165582 (= res!137920 (isPrefixOf!0 thiss!1577 (_2!7885 lt!258884)))))

(declare-fun b!165583 () Bool)

(declare-fun e!114601 () Bool)

(assert (=> b!165583 (= e!114602 (not e!114601))))

(declare-fun res!137921 () Bool)

(assert (=> b!165583 (=> res!137921 e!114601)))

(declare-fun lt!258886 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165583 (= res!137921 (not (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577)) lt!258886 #b00000000000000000000000000000000 (currentBit!7894 thiss!1577))))))

(declare-fun lt!258889 () array!8434)

(declare-fun arrayRangesEq!645 (array!8434 array!8434 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165583 (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 #b00000000000000000000000000000000 (currentByte!7899 thiss!1577))))

(declare-fun lt!258891 () Unit!11520)

(declare-fun arrayUpdatedAtPrefixLemma!253 (array!8434 (_ BitVec 32) (_ BitVec 8)) Unit!11520)

(assert (=> b!165583 (= lt!258891 (arrayUpdatedAtPrefixLemma!253 (buf!4217 thiss!1577) (currentByte!7899 thiss!1577) lt!258886))))

(assert (=> b!165583 (= lt!258889 (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))))))

(declare-fun lt!258887 () (_ BitVec 32))

(assert (=> b!165583 (= lt!258886 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7894 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258887)))))) (bvshl ((_ sign_extend 24) lt!258885) lt!258887))))))

(assert (=> b!165583 (= lt!258887 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7894 thiss!1577) nBits!511)))))

(declare-fun b!165584 () Bool)

(declare-fun e!114603 () Bool)

(declare-fun array_inv!3506 (array!8434) Bool)

(assert (=> b!165584 (= e!114603 (array_inv!3506 (buf!4217 thiss!1577)))))

(declare-fun b!165585 () Bool)

(declare-fun res!137923 () Bool)

(assert (=> b!165585 (=> (not res!137923) (not e!114604))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165585 (= res!137923 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884))) (bvadd (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(declare-datatypes ((tuple2!14590 0))(
  ( (tuple2!14591 (_1!7886 BitStream!6686) (_2!7886 BitStream!6686)) )
))
(declare-fun lt!258888 () tuple2!14590)

(declare-datatypes ((tuple2!14592 0))(
  ( (tuple2!14593 (_1!7887 BitStream!6686) (_2!7887 (_ BitVec 8))) )
))
(declare-fun lt!258890 () tuple2!14592)

(declare-fun b!165586 () Bool)

(assert (=> b!165586 (= e!114604 (and (= ((_ sign_extend 24) (_2!7887 lt!258890)) ((_ sign_extend 24) lt!258885)) (= (_1!7887 lt!258890) (_2!7886 lt!258888))))))

(declare-fun readPartialBytePure!0 (BitStream!6686 (_ BitVec 32)) tuple2!14592)

(assert (=> b!165586 (= lt!258890 (readPartialBytePure!0 (_1!7886 lt!258888) nBits!511))))

(declare-fun reader!0 (BitStream!6686 BitStream!6686) tuple2!14590)

(assert (=> b!165586 (= lt!258888 (reader!0 thiss!1577 (_2!7885 lt!258884)))))

(declare-fun res!137918 () Bool)

(assert (=> start!35384 (=> (not res!137918) (not e!114605))))

(assert (=> start!35384 (= res!137918 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35384 e!114605))

(assert (=> start!35384 true))

(declare-fun inv!12 (BitStream!6686) Bool)

(assert (=> start!35384 (and (inv!12 thiss!1577) e!114603)))

(declare-fun b!165587 () Bool)

(declare-fun res!137922 () Bool)

(assert (=> b!165587 (=> (not res!137922) (not e!114605))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165587 (= res!137922 (validate_offset_bits!1 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) ((_ sign_extend 32) (currentByte!7899 thiss!1577)) ((_ sign_extend 32) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165588 () Bool)

(assert (=> b!165588 (= e!114601 e!114604)))

(declare-fun res!137924 () Bool)

(assert (=> b!165588 (=> (not res!137924) (not e!114604))))

(assert (=> b!165588 (= res!137924 (= (size!3765 (buf!4217 thiss!1577)) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(declare-fun moveBitIndex!0 (BitStream!6686 (_ BitVec 64)) tuple2!14588)

(assert (=> b!165588 (= lt!258884 (moveBitIndex!0 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35384 res!137918) b!165587))

(assert (= (and b!165587 res!137922) b!165581))

(assert (= (and b!165581 res!137919) b!165583))

(assert (= (and b!165583 (not res!137921)) b!165588))

(assert (= (and b!165588 res!137924) b!165585))

(assert (= (and b!165585 res!137923) b!165582))

(assert (= (and b!165582 res!137920) b!165586))

(assert (= start!35384 b!165584))

(declare-fun m!263103 () Bool)

(assert (=> b!165583 m!263103))

(declare-fun m!263105 () Bool)

(assert (=> b!165583 m!263105))

(assert (=> b!165583 m!263105))

(declare-fun m!263107 () Bool)

(assert (=> b!165583 m!263107))

(declare-fun m!263109 () Bool)

(assert (=> b!165583 m!263109))

(declare-fun m!263111 () Bool)

(assert (=> b!165583 m!263111))

(declare-fun m!263113 () Bool)

(assert (=> b!165583 m!263113))

(declare-fun m!263115 () Bool)

(assert (=> b!165583 m!263115))

(declare-fun m!263117 () Bool)

(assert (=> b!165587 m!263117))

(declare-fun m!263119 () Bool)

(assert (=> b!165585 m!263119))

(declare-fun m!263121 () Bool)

(assert (=> b!165585 m!263121))

(declare-fun m!263123 () Bool)

(assert (=> b!165586 m!263123))

(declare-fun m!263125 () Bool)

(assert (=> b!165586 m!263125))

(declare-fun m!263127 () Bool)

(assert (=> b!165584 m!263127))

(declare-fun m!263129 () Bool)

(assert (=> b!165588 m!263129))

(declare-fun m!263131 () Bool)

(assert (=> b!165581 m!263131))

(declare-fun m!263133 () Bool)

(assert (=> b!165582 m!263133))

(declare-fun m!263135 () Bool)

(assert (=> start!35384 m!263135))

(push 1)

(assert (not b!165584))

(assert (not start!35384))

(assert (not b!165583))

(assert (not b!165585))

(assert (not b!165588))

(assert (not b!165587))

(assert (not b!165582))

(assert (not b!165586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57359 () Bool)

(declare-fun e!114640 () Bool)

(assert (=> d!57359 e!114640))

(declare-fun res!137968 () Bool)

(assert (=> d!57359 (=> (not res!137968) (not e!114640))))

(declare-fun lt!259035 () (_ BitVec 64))

(declare-fun lt!259033 () (_ BitVec 64))

(declare-fun lt!259036 () (_ BitVec 64))

(assert (=> d!57359 (= res!137968 (= lt!259035 (bvsub lt!259033 lt!259036)))))

(assert (=> d!57359 (or (= (bvand lt!259033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259033 lt!259036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57359 (= lt!259036 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!258884)))) ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!258884))) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun lt!259034 () (_ BitVec 64))

(declare-fun lt!259031 () (_ BitVec 64))

(assert (=> d!57359 (= lt!259033 (bvmul lt!259034 lt!259031))))

(assert (=> d!57359 (or (= lt!259034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259031 (bvsdiv (bvmul lt!259034 lt!259031) lt!259034)))))

(assert (=> d!57359 (= lt!259031 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57359 (= lt!259034 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (=> d!57359 (= lt!259035 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!258884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57359 (invariant!0 (currentBit!7894 (_2!7885 lt!258884)) (currentByte!7899 (_2!7885 lt!258884)) (size!3765 (buf!4217 (_2!7885 lt!258884))))))

(assert (=> d!57359 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884))) lt!259035)))

(declare-fun b!165642 () Bool)

(declare-fun res!137969 () Bool)

(assert (=> b!165642 (=> (not res!137969) (not e!114640))))

(assert (=> b!165642 (= res!137969 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259035))))

(declare-fun b!165643 () Bool)

(declare-fun lt!259032 () (_ BitVec 64))

(assert (=> b!165643 (= e!114640 (bvsle lt!259035 (bvmul lt!259032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165643 (or (= lt!259032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259032)))))

(assert (=> b!165643 (= lt!259032 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (= (and d!57359 res!137968) b!165642))

(assert (= (and b!165642 res!137969) b!165643))

(declare-fun m!263197 () Bool)

(assert (=> d!57359 m!263197))

(declare-fun m!263199 () Bool)

(assert (=> d!57359 m!263199))

(assert (=> b!165585 d!57359))

(declare-fun d!57367 () Bool)

(declare-fun e!114641 () Bool)

(assert (=> d!57367 e!114641))

(declare-fun res!137970 () Bool)

(assert (=> d!57367 (=> (not res!137970) (not e!114641))))

(declare-fun lt!259042 () (_ BitVec 64))

(declare-fun lt!259041 () (_ BitVec 64))

(declare-fun lt!259039 () (_ BitVec 64))

(assert (=> d!57367 (= res!137970 (= lt!259041 (bvsub lt!259039 lt!259042)))))

(assert (=> d!57367 (or (= (bvand lt!259039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259039 lt!259042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57367 (= lt!259042 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) ((_ sign_extend 32) (currentByte!7899 thiss!1577)) ((_ sign_extend 32) (currentBit!7894 thiss!1577))))))

(declare-fun lt!259040 () (_ BitVec 64))

(declare-fun lt!259037 () (_ BitVec 64))

(assert (=> d!57367 (= lt!259039 (bvmul lt!259040 lt!259037))))

(assert (=> d!57367 (or (= lt!259040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259037 (bvsdiv (bvmul lt!259040 lt!259037) lt!259040)))))

(assert (=> d!57367 (= lt!259037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57367 (= lt!259040 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))))))

(assert (=> d!57367 (= lt!259041 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 thiss!1577))))))

(assert (=> d!57367 (invariant!0 (currentBit!7894 thiss!1577) (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577)))))

(assert (=> d!57367 (= (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) lt!259041)))

(declare-fun b!165644 () Bool)

(declare-fun res!137971 () Bool)

(assert (=> b!165644 (=> (not res!137971) (not e!114641))))

(assert (=> b!165644 (= res!137971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259041))))

(declare-fun b!165645 () Bool)

(declare-fun lt!259038 () (_ BitVec 64))

(assert (=> b!165645 (= e!114641 (bvsle lt!259041 (bvmul lt!259038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165645 (or (= lt!259038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259038)))))

(assert (=> b!165645 (= lt!259038 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))))))

(assert (= (and d!57367 res!137970) b!165644))

(assert (= (and b!165644 res!137971) b!165645))

(declare-fun m!263201 () Bool)

(assert (=> d!57367 m!263201))

(declare-fun m!263203 () Bool)

(assert (=> d!57367 m!263203))

(assert (=> b!165585 d!57367))

(declare-fun d!57369 () Bool)

(assert (=> d!57369 (= (array_inv!3506 (buf!4217 thiss!1577)) (bvsge (size!3765 (buf!4217 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165584 d!57369))

(declare-fun d!57371 () Bool)

(assert (=> d!57371 (= (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577)) lt!258886 #b00000000000000000000000000000000 (currentBit!7894 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7894 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7894 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258886) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7894 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14254 () Bool)

(assert (= bs!14254 d!57371))

(declare-fun m!263241 () Bool)

(assert (=> bs!14254 m!263241))

(declare-fun m!263243 () Bool)

(assert (=> bs!14254 m!263243))

(assert (=> b!165583 d!57371))

(declare-fun d!57381 () Bool)

(declare-fun res!137987 () Bool)

(declare-fun e!114652 () Bool)

(assert (=> d!57381 (=> res!137987 e!114652)))

(assert (=> d!57381 (= res!137987 (= #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)))))

(assert (=> d!57381 (= (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)) e!114652)))

(declare-fun b!165663 () Bool)

(declare-fun e!114653 () Bool)

(assert (=> b!165663 (= e!114652 e!114653)))

(declare-fun res!137988 () Bool)

(assert (=> b!165663 (=> (not res!137988) (not e!114653))))

(assert (=> b!165663 (= res!137988 (= (select (arr!4686 (buf!4217 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4686 lt!258889) #b00000000000000000000000000000000)))))

(declare-fun b!165664 () Bool)

(assert (=> b!165664 (= e!114653 (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (= (and d!57381 (not res!137987)) b!165663))

(assert (= (and b!165663 res!137988) b!165664))

(declare-fun m!263245 () Bool)

(assert (=> b!165663 m!263245))

(declare-fun m!263247 () Bool)

(assert (=> b!165663 m!263247))

(declare-fun m!263249 () Bool)

(assert (=> b!165664 m!263249))

(assert (=> b!165583 d!57381))

(declare-fun d!57383 () Bool)

(declare-fun e!114666 () Bool)

(assert (=> d!57383 e!114666))

(declare-fun res!138005 () Bool)

(assert (=> d!57383 (=> (not res!138005) (not e!114666))))

(assert (=> d!57383 (= res!138005 (and (bvsge (currentByte!7899 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577)))))))

(declare-fun lt!259113 () Unit!11520)

(declare-fun choose!225 (array!8434 (_ BitVec 32) (_ BitVec 8)) Unit!11520)

(assert (=> d!57383 (= lt!259113 (choose!225 (buf!4217 thiss!1577) (currentByte!7899 thiss!1577) lt!258886))))

(assert (=> d!57383 (and (bvsle #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)) (bvslt (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577))))))

(assert (=> d!57383 (= (arrayUpdatedAtPrefixLemma!253 (buf!4217 thiss!1577) (currentByte!7899 thiss!1577) lt!258886) lt!259113)))

(declare-fun b!165681 () Bool)

(assert (=> b!165681 (= e!114666 (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)))))

(assert (= (and d!57383 res!138005) b!165681))

(declare-fun m!263267 () Bool)

(assert (=> d!57383 m!263267))

(assert (=> b!165681 m!263109))

(declare-fun m!263269 () Bool)

(assert (=> b!165681 m!263269))

(assert (=> b!165583 d!57383))

(declare-fun d!57393 () Bool)

(declare-fun lt!259135 () (_ BitVec 32))

(assert (=> d!57393 (= lt!259135 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259137 () (_ BitVec 32))

(assert (=> d!57393 (= lt!259137 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114682 () Bool)

(assert (=> d!57393 e!114682))

(declare-fun res!138025 () Bool)

(assert (=> d!57393 (=> (not res!138025) (not e!114682))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6686 (_ BitVec 64)) Bool)

(assert (=> d!57393 (= res!138025 (moveBitIndexPrecond!0 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11536 () Unit!11520)

(declare-fun Unit!11537 () Unit!11520)

(declare-fun Unit!11538 () Unit!11520)

(assert (=> d!57393 (= (moveBitIndex!0 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259135) #b00000000000000000000000000000000) (tuple2!14589 Unit!11536 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvsub (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259137) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259135 (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259135) #b00000000000000000000000000001000) (tuple2!14589 Unit!11537 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259137 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259135) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11538 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259137) (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259135))))))))

(declare-fun b!165700 () Bool)

(declare-fun e!114683 () Bool)

(assert (=> b!165700 (= e!114682 e!114683)))

(declare-fun res!138024 () Bool)

(assert (=> b!165700 (=> (not res!138024) (not e!114683))))

(declare-fun lt!259139 () tuple2!14588)

(declare-fun lt!259136 () (_ BitVec 64))

(assert (=> b!165700 (= res!138024 (= (bvadd lt!259136 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!259139))) (currentByte!7899 (_2!7885 lt!259139)) (currentBit!7894 (_2!7885 lt!259139)))))))

(assert (=> b!165700 (or (not (= (bvand lt!259136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259136 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165700 (= lt!259136 (bitIndex!0 (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))

(declare-fun lt!259140 () (_ BitVec 32))

(declare-fun lt!259138 () (_ BitVec 32))

(declare-fun Unit!11539 () Unit!11520)

(declare-fun Unit!11540 () Unit!11520)

(declare-fun Unit!11541 () Unit!11520)

(assert (=> b!165700 (= lt!259139 (ite (bvslt (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259140) #b00000000000000000000000000000000) (tuple2!14589 Unit!11539 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvsub (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259138) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259140 (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259140) #b00000000000000000000000000001000) (tuple2!14589 Unit!11540 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259138 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259140) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11541 (BitStream!6687 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (bvadd (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259138) (bvadd (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) lt!259140))))))))

(assert (=> b!165700 (= lt!259140 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165700 (= lt!259138 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!165701 () Bool)

(assert (=> b!165701 (= e!114683 (and (= (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) (size!3765 (buf!4217 (_2!7885 lt!259139)))) (= (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (buf!4217 (_2!7885 lt!259139)))))))

(assert (= (and d!57393 res!138025) b!165700))

(assert (= (and b!165700 res!138024) b!165701))

(declare-fun m!263277 () Bool)

(assert (=> d!57393 m!263277))

(declare-fun m!263279 () Bool)

(assert (=> b!165700 m!263279))

(declare-fun m!263281 () Bool)

(assert (=> b!165700 m!263281))

(assert (=> b!165588 d!57393))

(declare-fun d!57405 () Bool)

(declare-fun res!138038 () Bool)

(declare-fun e!114693 () Bool)

(assert (=> d!57405 (=> (not res!138038) (not e!114693))))

(assert (=> d!57405 (= res!138038 (= (size!3765 (buf!4217 thiss!1577)) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (=> d!57405 (= (isPrefixOf!0 thiss!1577 (_2!7885 lt!258884)) e!114693)))

(declare-fun b!165712 () Bool)

(declare-fun res!138037 () Bool)

(assert (=> b!165712 (=> (not res!138037) (not e!114693))))

(assert (=> b!165712 (= res!138037 (bvsle (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun b!165713 () Bool)

(declare-fun e!114692 () Bool)

(assert (=> b!165713 (= e!114693 e!114692)))

(declare-fun res!138036 () Bool)

(assert (=> b!165713 (=> res!138036 e!114692)))

(assert (=> b!165713 (= res!138036 (= (size!3765 (buf!4217 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165714 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8434 array!8434 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165714 (= e!114692 (arrayBitRangesEq!0 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(assert (= (and d!57405 res!138038) b!165712))

(assert (= (and b!165712 res!138037) b!165713))

(assert (= (and b!165713 (not res!138036)) b!165714))

(assert (=> b!165712 m!263121))

(assert (=> b!165712 m!263119))

(assert (=> b!165714 m!263121))

(assert (=> b!165714 m!263121))

(declare-fun m!263289 () Bool)

(assert (=> b!165714 m!263289))

(assert (=> b!165582 d!57405))

(declare-fun d!57407 () Bool)

(assert (=> d!57407 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) ((_ sign_extend 32) (currentByte!7899 thiss!1577)) ((_ sign_extend 32) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) ((_ sign_extend 32) (currentByte!7899 thiss!1577)) ((_ sign_extend 32) (currentBit!7894 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14257 () Bool)

(assert (= bs!14257 d!57407))

(assert (=> bs!14257 m!263201))

(assert (=> b!165587 d!57407))

(declare-fun d!57409 () Bool)

(assert (=> d!57409 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7894 thiss!1577) (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577))))))

(declare-fun bs!14258 () Bool)

(assert (= bs!14258 d!57409))

(assert (=> bs!14258 m!263203))

(assert (=> start!35384 d!57409))

(declare-fun d!57411 () Bool)

(declare-datatypes ((tuple2!14598 0))(
  ( (tuple2!14599 (_1!7890 (_ BitVec 8)) (_2!7890 BitStream!6686)) )
))
(declare-fun lt!259155 () tuple2!14598)

(declare-fun readPartialByte!0 (BitStream!6686 (_ BitVec 32)) tuple2!14598)

(assert (=> d!57411 (= lt!259155 (readPartialByte!0 (_1!7886 lt!258888) nBits!511))))

(assert (=> d!57411 (= (readPartialBytePure!0 (_1!7886 lt!258888) nBits!511) (tuple2!14593 (_2!7890 lt!259155) (_1!7890 lt!259155)))))

(declare-fun bs!14259 () Bool)

(assert (= bs!14259 d!57411))

(declare-fun m!263291 () Bool)

(assert (=> bs!14259 m!263291))

(assert (=> b!165586 d!57411))

(declare-fun b!165725 () Bool)

(declare-fun res!138047 () Bool)

(declare-fun e!114698 () Bool)

(assert (=> b!165725 (=> (not res!138047) (not e!114698))))

(declare-fun lt!259206 () tuple2!14590)

(assert (=> b!165725 (= res!138047 (isPrefixOf!0 (_2!7886 lt!259206) (_2!7885 lt!258884)))))

(declare-fun b!165726 () Bool)

(declare-fun e!114699 () Unit!11520)

(declare-fun Unit!11542 () Unit!11520)

(assert (=> b!165726 (= e!114699 Unit!11542)))

(declare-fun b!165727 () Bool)

(declare-fun lt!259197 () Unit!11520)

(assert (=> b!165727 (= e!114699 lt!259197)))

(declare-fun lt!259201 () (_ BitVec 64))

(assert (=> b!165727 (= lt!259201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!259212 () (_ BitVec 64))

(assert (=> b!165727 (= lt!259212 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8434 array!8434 (_ BitVec 64) (_ BitVec 64)) Unit!11520)

(assert (=> b!165727 (= lt!259197 (arrayBitRangesEqSymmetric!0 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) lt!259201 lt!259212))))

(assert (=> b!165727 (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) lt!259201 lt!259212)))

(declare-fun b!165728 () Bool)

(declare-fun res!138046 () Bool)

(assert (=> b!165728 (=> (not res!138046) (not e!114698))))

(assert (=> b!165728 (= res!138046 (isPrefixOf!0 (_1!7886 lt!259206) thiss!1577))))

(declare-fun d!57413 () Bool)

(assert (=> d!57413 e!114698))

(declare-fun res!138045 () Bool)

(assert (=> d!57413 (=> (not res!138045) (not e!114698))))

(assert (=> d!57413 (= res!138045 (isPrefixOf!0 (_1!7886 lt!259206) (_2!7886 lt!259206)))))

(declare-fun lt!259214 () BitStream!6686)

(assert (=> d!57413 (= lt!259206 (tuple2!14591 lt!259214 (_2!7885 lt!258884)))))

(declare-fun lt!259202 () Unit!11520)

(declare-fun lt!259205 () Unit!11520)

(assert (=> d!57413 (= lt!259202 lt!259205)))

(assert (=> d!57413 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6686 BitStream!6686 BitStream!6686) Unit!11520)

(assert (=> d!57413 (= lt!259205 (lemmaIsPrefixTransitive!0 lt!259214 (_2!7885 lt!258884) (_2!7885 lt!258884)))))

(declare-fun lt!259204 () Unit!11520)

(declare-fun lt!259196 () Unit!11520)

(assert (=> d!57413 (= lt!259204 lt!259196)))

(assert (=> d!57413 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(assert (=> d!57413 (= lt!259196 (lemmaIsPrefixTransitive!0 lt!259214 thiss!1577 (_2!7885 lt!258884)))))

(declare-fun lt!259208 () Unit!11520)

(assert (=> d!57413 (= lt!259208 e!114699)))

(declare-fun c!8594 () Bool)

(assert (=> d!57413 (= c!8594 (not (= (size!3765 (buf!4217 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!259215 () Unit!11520)

(declare-fun lt!259200 () Unit!11520)

(assert (=> d!57413 (= lt!259215 lt!259200)))

(assert (=> d!57413 (isPrefixOf!0 (_2!7885 lt!258884) (_2!7885 lt!258884))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6686) Unit!11520)

(assert (=> d!57413 (= lt!259200 (lemmaIsPrefixRefl!0 (_2!7885 lt!258884)))))

(declare-fun lt!259207 () Unit!11520)

(declare-fun lt!259199 () Unit!11520)

(assert (=> d!57413 (= lt!259207 lt!259199)))

(assert (=> d!57413 (= lt!259199 (lemmaIsPrefixRefl!0 (_2!7885 lt!258884)))))

(declare-fun lt!259203 () Unit!11520)

(declare-fun lt!259211 () Unit!11520)

(assert (=> d!57413 (= lt!259203 lt!259211)))

(assert (=> d!57413 (isPrefixOf!0 lt!259214 lt!259214)))

(assert (=> d!57413 (= lt!259211 (lemmaIsPrefixRefl!0 lt!259214))))

(declare-fun lt!259213 () Unit!11520)

(declare-fun lt!259209 () Unit!11520)

(assert (=> d!57413 (= lt!259213 lt!259209)))

(assert (=> d!57413 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57413 (= lt!259209 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!57413 (= lt!259214 (BitStream!6687 (buf!4217 (_2!7885 lt!258884)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))

(assert (=> d!57413 (isPrefixOf!0 thiss!1577 (_2!7885 lt!258884))))

(assert (=> d!57413 (= (reader!0 thiss!1577 (_2!7885 lt!258884)) lt!259206)))

(declare-fun b!165729 () Bool)

(declare-fun lt!259210 () (_ BitVec 64))

(declare-fun lt!259198 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!6686 (_ BitVec 64)) BitStream!6686)

(assert (=> b!165729 (= e!114698 (= (_1!7886 lt!259206) (withMovedBitIndex!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210))))))

(assert (=> b!165729 (or (= (bvand lt!259198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259198 lt!259210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165729 (= lt!259210 (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884))))))

(assert (=> b!165729 (= lt!259198 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))

(assert (= (and d!57413 c!8594) b!165727))

(assert (= (and d!57413 (not c!8594)) b!165726))

(assert (= (and d!57413 res!138045) b!165728))

(assert (= (and b!165728 res!138046) b!165725))

(assert (= (and b!165725 res!138047) b!165729))

(declare-fun m!263293 () Bool)

(assert (=> b!165729 m!263293))

(assert (=> b!165729 m!263119))

(assert (=> b!165729 m!263121))

(declare-fun m!263295 () Bool)

(assert (=> b!165728 m!263295))

(declare-fun m!263297 () Bool)

(assert (=> d!57413 m!263297))

(declare-fun m!263299 () Bool)

(assert (=> d!57413 m!263299))

(declare-fun m!263301 () Bool)

(assert (=> d!57413 m!263301))

(declare-fun m!263303 () Bool)

(assert (=> d!57413 m!263303))

(declare-fun m!263305 () Bool)

(assert (=> d!57413 m!263305))

(declare-fun m!263307 () Bool)

(assert (=> d!57413 m!263307))

(declare-fun m!263309 () Bool)

(assert (=> d!57413 m!263309))

(declare-fun m!263311 () Bool)

(assert (=> d!57413 m!263311))

(assert (=> d!57413 m!263133))

(declare-fun m!263313 () Bool)

(assert (=> d!57413 m!263313))

(declare-fun m!263315 () Bool)

(assert (=> d!57413 m!263315))

(declare-fun m!263317 () Bool)

(assert (=> b!165725 m!263317))

(assert (=> b!165727 m!263121))

(declare-fun m!263319 () Bool)

(assert (=> b!165727 m!263319))

(declare-fun m!263321 () Bool)

(assert (=> b!165727 m!263321))

(assert (=> b!165586 d!57413))

(push 1)

(assert (not b!165714))

(assert (not d!57393))

(assert (not d!57383))

(assert (not b!165664))

(assert (not b!165712))

(assert (not b!165700))

(assert (not b!165728))

(assert (not d!57411))

(assert (not d!57409))

(assert (not d!57413))

(assert (not b!165729))

(assert (not d!57367))

(assert (not b!165727))

(assert (not d!57407))

(assert (not b!165681))

(assert (not d!57359))

(assert (not b!165725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57469 () Bool)

(declare-fun res!138108 () Bool)

(declare-fun e!114757 () Bool)

(assert (=> d!57469 (=> (not res!138108) (not e!114757))))

(assert (=> d!57469 (= res!138108 (= (size!3765 (buf!4217 (_2!7886 lt!259206))) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (=> d!57469 (= (isPrefixOf!0 (_2!7886 lt!259206) (_2!7885 lt!258884)) e!114757)))

(declare-fun b!165803 () Bool)

(declare-fun res!138107 () Bool)

(assert (=> b!165803 (=> (not res!138107) (not e!114757))))

(assert (=> b!165803 (= res!138107 (bvsle (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun b!165804 () Bool)

(declare-fun e!114756 () Bool)

(assert (=> b!165804 (= e!114757 e!114756)))

(declare-fun res!138106 () Bool)

(assert (=> b!165804 (=> res!138106 e!114756)))

(assert (=> b!165804 (= res!138106 (= (size!3765 (buf!4217 (_2!7886 lt!259206))) #b00000000000000000000000000000000))))

(declare-fun b!165805 () Bool)

(assert (=> b!165805 (= e!114756 (arrayBitRangesEq!0 (buf!4217 (_2!7886 lt!259206)) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206)))))))

(assert (= (and d!57469 res!138108) b!165803))

(assert (= (and b!165803 res!138107) b!165804))

(assert (= (and b!165804 (not res!138106)) b!165805))

(declare-fun m!263423 () Bool)

(assert (=> b!165803 m!263423))

(assert (=> b!165803 m!263119))

(assert (=> b!165805 m!263423))

(assert (=> b!165805 m!263423))

(declare-fun m!263425 () Bool)

(assert (=> b!165805 m!263425))

(assert (=> b!165725 d!57469))

(declare-fun d!57471 () Bool)

(declare-fun res!138109 () Bool)

(declare-fun e!114758 () Bool)

(assert (=> d!57471 (=> res!138109 e!114758)))

(assert (=> d!57471 (= res!138109 (= #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)))))

(assert (=> d!57471 (= (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7899 thiss!1577)) e!114758)))

(declare-fun b!165806 () Bool)

(declare-fun e!114759 () Bool)

(assert (=> b!165806 (= e!114758 e!114759)))

(declare-fun res!138110 () Bool)

(assert (=> b!165806 (=> (not res!138110) (not e!114759))))

(assert (=> b!165806 (= res!138110 (= (select (arr!4686 (buf!4217 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4686 (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!165807 () Bool)

(assert (=> b!165807 (= e!114759 (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (= (and d!57471 (not res!138109)) b!165806))

(assert (= (and b!165806 res!138110) b!165807))

(assert (=> b!165806 m!263245))

(declare-fun m!263427 () Bool)

(assert (=> b!165806 m!263427))

(declare-fun m!263429 () Bool)

(assert (=> b!165807 m!263429))

(assert (=> b!165681 d!57471))

(declare-datatypes ((tuple4!242 0))(
  ( (tuple4!243 (_1!7893 (_ BitVec 32)) (_2!7893 (_ BitVec 32)) (_3!593 (_ BitVec 32)) (_4!121 (_ BitVec 32))) )
))
(declare-fun lt!259289 () tuple4!242)

(declare-fun e!114772 () Bool)

(declare-fun b!165822 () Bool)

(assert (=> b!165822 (= e!114772 (arrayRangesEq!645 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) (_1!7893 lt!259289) (_2!7893 lt!259289)))))

(declare-fun b!165823 () Bool)

(declare-fun e!114776 () Bool)

(declare-fun lt!259290 () (_ BitVec 32))

(assert (=> b!165823 (= e!114776 (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259289)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259289)) #b00000000000000000000000000000000 lt!259290))))

(declare-fun b!165824 () Bool)

(declare-fun e!114775 () Bool)

(declare-fun e!114774 () Bool)

(assert (=> b!165824 (= e!114775 e!114774)))

(declare-fun res!138123 () Bool)

(assert (=> b!165824 (=> (not res!138123) (not e!114774))))

(assert (=> b!165824 (= res!138123 e!114772)))

(declare-fun res!138124 () Bool)

(assert (=> b!165824 (=> res!138124 e!114772)))

(assert (=> b!165824 (= res!138124 (bvsge (_1!7893 lt!259289) (_2!7893 lt!259289)))))

(assert (=> b!165824 (= lt!259290 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259288 () (_ BitVec 32))

(assert (=> b!165824 (= lt!259288 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!242)

(assert (=> b!165824 (= lt!259289 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(declare-fun b!165825 () Bool)

(declare-fun res!138122 () Bool)

(assert (=> b!165825 (= res!138122 (= lt!259290 #b00000000000000000000000000000000))))

(assert (=> b!165825 (=> res!138122 e!114776)))

(declare-fun e!114777 () Bool)

(assert (=> b!165825 (= e!114777 e!114776)))

(declare-fun b!165826 () Bool)

(declare-fun e!114773 () Bool)

(declare-fun call!2781 () Bool)

(assert (=> b!165826 (= e!114773 call!2781)))

(declare-fun d!57473 () Bool)

(declare-fun res!138125 () Bool)

(assert (=> d!57473 (=> res!138125 e!114775)))

(assert (=> d!57473 (= res!138125 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(assert (=> d!57473 (= (arrayBitRangesEq!0 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) e!114775)))

(declare-fun b!165827 () Bool)

(assert (=> b!165827 (= e!114773 e!114777)))

(declare-fun res!138121 () Bool)

(assert (=> b!165827 (= res!138121 call!2781)))

(assert (=> b!165827 (=> (not res!138121) (not e!114777))))

(declare-fun b!165828 () Bool)

(assert (=> b!165828 (= e!114774 e!114773)))

(declare-fun c!8604 () Bool)

(assert (=> b!165828 (= c!8604 (= (_3!593 lt!259289) (_4!121 lt!259289)))))

(declare-fun bm!2778 () Bool)

(assert (=> bm!2778 (= call!2781 (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259289)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259289)) lt!259288 (ite c!8604 lt!259290 #b00000000000000000000000000001000)))))

(assert (= (and d!57473 (not res!138125)) b!165824))

(assert (= (and b!165824 (not res!138124)) b!165822))

(assert (= (and b!165824 res!138123) b!165828))

(assert (= (and b!165828 c!8604) b!165826))

(assert (= (and b!165828 (not c!8604)) b!165827))

(assert (= (and b!165827 res!138121) b!165825))

(assert (= (and b!165825 (not res!138122)) b!165823))

(assert (= (or b!165826 b!165827) bm!2778))

(declare-fun m!263431 () Bool)

(assert (=> b!165822 m!263431))

(declare-fun m!263433 () Bool)

(assert (=> b!165823 m!263433))

(declare-fun m!263435 () Bool)

(assert (=> b!165823 m!263435))

(assert (=> b!165823 m!263433))

(assert (=> b!165823 m!263435))

(declare-fun m!263437 () Bool)

(assert (=> b!165823 m!263437))

(assert (=> b!165824 m!263121))

(declare-fun m!263439 () Bool)

(assert (=> b!165824 m!263439))

(declare-fun m!263441 () Bool)

(assert (=> bm!2778 m!263441))

(declare-fun m!263443 () Bool)

(assert (=> bm!2778 m!263443))

(assert (=> bm!2778 m!263441))

(assert (=> bm!2778 m!263443))

(declare-fun m!263445 () Bool)

(assert (=> bm!2778 m!263445))

(assert (=> b!165714 d!57473))

(assert (=> b!165714 d!57367))

(declare-fun d!57475 () Bool)

(declare-fun res!138128 () Bool)

(declare-fun e!114780 () Bool)

(assert (=> d!57475 (=> (not res!138128) (not e!114780))))

(assert (=> d!57475 (= res!138128 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))))))

(assert (=> d!57475 (= (moveBitIndexPrecond!0 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!114780)))

(declare-fun b!165832 () Bool)

(declare-fun lt!259293 () (_ BitVec 64))

(assert (=> b!165832 (= e!114780 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259293) (bvsle lt!259293 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))))))

(assert (=> b!165832 (= lt!259293 (bvadd (bitIndex!0 (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!57475 res!138128) b!165832))

(assert (=> b!165832 m!263281))

(assert (=> d!57393 d!57475))

(declare-fun d!57477 () Bool)

(assert (=> d!57477 (= (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!258884)))) ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!258884))) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!258884)))) (bvsub (bvmul ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!258884)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!258884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!258884))))))))

(assert (=> d!57359 d!57477))

(declare-fun d!57479 () Bool)

(assert (=> d!57479 (= (invariant!0 (currentBit!7894 (_2!7885 lt!258884)) (currentByte!7899 (_2!7885 lt!258884)) (size!3765 (buf!4217 (_2!7885 lt!258884)))) (and (bvsge (currentBit!7894 (_2!7885 lt!258884)) #b00000000000000000000000000000000) (bvslt (currentBit!7894 (_2!7885 lt!258884)) #b00000000000000000000000000001000) (bvsge (currentByte!7899 (_2!7885 lt!258884)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7899 (_2!7885 lt!258884)) (size!3765 (buf!4217 (_2!7885 lt!258884)))) (and (= (currentBit!7894 (_2!7885 lt!258884)) #b00000000000000000000000000000000) (= (currentByte!7899 (_2!7885 lt!258884)) (size!3765 (buf!4217 (_2!7885 lt!258884))))))))))

(assert (=> d!57359 d!57479))

(assert (=> b!165727 d!57367))

(declare-fun d!57481 () Bool)

(assert (=> d!57481 (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) lt!259201 lt!259212)))

(declare-fun lt!259296 () Unit!11520)

(declare-fun choose!8 (array!8434 array!8434 (_ BitVec 64) (_ BitVec 64)) Unit!11520)

(assert (=> d!57481 (= lt!259296 (choose!8 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) lt!259201 lt!259212))))

(assert (=> d!57481 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259201) (bvsle lt!259201 lt!259212))))

(assert (=> d!57481 (= (arrayBitRangesEqSymmetric!0 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) lt!259201 lt!259212) lt!259296)))

(declare-fun bs!14268 () Bool)

(assert (= bs!14268 d!57481))

(assert (=> bs!14268 m!263321))

(declare-fun m!263447 () Bool)

(assert (=> bs!14268 m!263447))

(assert (=> b!165727 d!57481))

(declare-fun e!114781 () Bool)

(declare-fun lt!259298 () tuple4!242)

(declare-fun b!165833 () Bool)

(assert (=> b!165833 (= e!114781 (arrayRangesEq!645 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) (_1!7893 lt!259298) (_2!7893 lt!259298)))))

(declare-fun b!165834 () Bool)

(declare-fun e!114785 () Bool)

(declare-fun lt!259299 () (_ BitVec 32))

(assert (=> b!165834 (= e!114785 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259298)) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259298)) #b00000000000000000000000000000000 lt!259299))))

(declare-fun b!165835 () Bool)

(declare-fun e!114784 () Bool)

(declare-fun e!114783 () Bool)

(assert (=> b!165835 (= e!114784 e!114783)))

(declare-fun res!138131 () Bool)

(assert (=> b!165835 (=> (not res!138131) (not e!114783))))

(assert (=> b!165835 (= res!138131 e!114781)))

(declare-fun res!138132 () Bool)

(assert (=> b!165835 (=> res!138132 e!114781)))

(assert (=> b!165835 (= res!138132 (bvsge (_1!7893 lt!259298) (_2!7893 lt!259298)))))

(assert (=> b!165835 (= lt!259299 ((_ extract 31 0) (bvsrem lt!259212 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259297 () (_ BitVec 32))

(assert (=> b!165835 (= lt!259297 ((_ extract 31 0) (bvsrem lt!259201 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165835 (= lt!259298 (arrayBitIndices!0 lt!259201 lt!259212))))

(declare-fun b!165836 () Bool)

(declare-fun res!138130 () Bool)

(assert (=> b!165836 (= res!138130 (= lt!259299 #b00000000000000000000000000000000))))

(assert (=> b!165836 (=> res!138130 e!114785)))

(declare-fun e!114786 () Bool)

(assert (=> b!165836 (= e!114786 e!114785)))

(declare-fun b!165837 () Bool)

(declare-fun e!114782 () Bool)

(declare-fun call!2782 () Bool)

(assert (=> b!165837 (= e!114782 call!2782)))

(declare-fun d!57483 () Bool)

(declare-fun res!138133 () Bool)

(assert (=> d!57483 (=> res!138133 e!114784)))

(assert (=> d!57483 (= res!138133 (bvsge lt!259201 lt!259212))))

(assert (=> d!57483 (= (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) lt!259201 lt!259212) e!114784)))

(declare-fun b!165838 () Bool)

(assert (=> b!165838 (= e!114782 e!114786)))

(declare-fun res!138129 () Bool)

(assert (=> b!165838 (= res!138129 call!2782)))

(assert (=> b!165838 (=> (not res!138129) (not e!114786))))

(declare-fun b!165839 () Bool)

(assert (=> b!165839 (= e!114783 e!114782)))

(declare-fun c!8605 () Bool)

(assert (=> b!165839 (= c!8605 (= (_3!593 lt!259298) (_4!121 lt!259298)))))

(declare-fun bm!2779 () Bool)

(assert (=> bm!2779 (= call!2782 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259298)) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259298)) lt!259297 (ite c!8605 lt!259299 #b00000000000000000000000000001000)))))

(assert (= (and d!57483 (not res!138133)) b!165835))

(assert (= (and b!165835 (not res!138132)) b!165833))

(assert (= (and b!165835 res!138131) b!165839))

(assert (= (and b!165839 c!8605) b!165837))

(assert (= (and b!165839 (not c!8605)) b!165838))

(assert (= (and b!165838 res!138129) b!165836))

(assert (= (and b!165836 (not res!138130)) b!165834))

(assert (= (or b!165837 b!165838) bm!2779))

(declare-fun m!263449 () Bool)

(assert (=> b!165833 m!263449))

(declare-fun m!263451 () Bool)

(assert (=> b!165834 m!263451))

(declare-fun m!263453 () Bool)

(assert (=> b!165834 m!263453))

(assert (=> b!165834 m!263451))

(assert (=> b!165834 m!263453))

(declare-fun m!263455 () Bool)

(assert (=> b!165834 m!263455))

(declare-fun m!263457 () Bool)

(assert (=> b!165835 m!263457))

(declare-fun m!263459 () Bool)

(assert (=> bm!2779 m!263459))

(declare-fun m!263461 () Bool)

(assert (=> bm!2779 m!263461))

(assert (=> bm!2779 m!263459))

(assert (=> bm!2779 m!263461))

(declare-fun m!263463 () Bool)

(assert (=> bm!2779 m!263463))

(assert (=> b!165727 d!57483))

(declare-fun d!57485 () Bool)

(assert (=> d!57485 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(declare-fun lt!259302 () Unit!11520)

(declare-fun choose!30 (BitStream!6686 BitStream!6686 BitStream!6686) Unit!11520)

(assert (=> d!57485 (= lt!259302 (choose!30 lt!259214 thiss!1577 (_2!7885 lt!258884)))))

(assert (=> d!57485 (isPrefixOf!0 lt!259214 thiss!1577)))

(assert (=> d!57485 (= (lemmaIsPrefixTransitive!0 lt!259214 thiss!1577 (_2!7885 lt!258884)) lt!259302)))

(declare-fun bs!14269 () Bool)

(assert (= bs!14269 d!57485))

(assert (=> bs!14269 m!263315))

(declare-fun m!263465 () Bool)

(assert (=> bs!14269 m!263465))

(declare-fun m!263467 () Bool)

(assert (=> bs!14269 m!263467))

(assert (=> d!57413 d!57485))

(declare-fun d!57487 () Bool)

(declare-fun res!138136 () Bool)

(declare-fun e!114788 () Bool)

(assert (=> d!57487 (=> (not res!138136) (not e!114788))))

(assert (=> d!57487 (= res!138136 (= (size!3765 (buf!4217 (_1!7886 lt!259206))) (size!3765 (buf!4217 (_2!7886 lt!259206)))))))

(assert (=> d!57487 (= (isPrefixOf!0 (_1!7886 lt!259206) (_2!7886 lt!259206)) e!114788)))

(declare-fun b!165840 () Bool)

(declare-fun res!138135 () Bool)

(assert (=> b!165840 (=> (not res!138135) (not e!114788))))

(assert (=> b!165840 (= res!138135 (bvsle (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206))) (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206)))))))

(declare-fun b!165841 () Bool)

(declare-fun e!114787 () Bool)

(assert (=> b!165841 (= e!114788 e!114787)))

(declare-fun res!138134 () Bool)

(assert (=> b!165841 (=> res!138134 e!114787)))

(assert (=> b!165841 (= res!138134 (= (size!3765 (buf!4217 (_1!7886 lt!259206))) #b00000000000000000000000000000000))))

(declare-fun b!165842 () Bool)

(assert (=> b!165842 (= e!114787 (arrayBitRangesEq!0 (buf!4217 (_1!7886 lt!259206)) (buf!4217 (_2!7886 lt!259206)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(assert (= (and d!57487 res!138136) b!165840))

(assert (= (and b!165840 res!138135) b!165841))

(assert (= (and b!165841 (not res!138134)) b!165842))

(declare-fun m!263469 () Bool)

(assert (=> b!165840 m!263469))

(assert (=> b!165840 m!263423))

(assert (=> b!165842 m!263469))

(assert (=> b!165842 m!263469))

(declare-fun m!263471 () Bool)

(assert (=> b!165842 m!263471))

(assert (=> d!57413 d!57487))

(assert (=> d!57413 d!57405))

(declare-fun d!57489 () Bool)

(declare-fun res!138139 () Bool)

(declare-fun e!114790 () Bool)

(assert (=> d!57489 (=> (not res!138139) (not e!114790))))

(assert (=> d!57489 (= res!138139 (= (size!3765 (buf!4217 (_2!7885 lt!258884))) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (=> d!57489 (= (isPrefixOf!0 (_2!7885 lt!258884) (_2!7885 lt!258884)) e!114790)))

(declare-fun b!165843 () Bool)

(declare-fun res!138138 () Bool)

(assert (=> b!165843 (=> (not res!138138) (not e!114790))))

(assert (=> b!165843 (= res!138138 (bvsle (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884))) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun b!165844 () Bool)

(declare-fun e!114789 () Bool)

(assert (=> b!165844 (= e!114790 e!114789)))

(declare-fun res!138137 () Bool)

(assert (=> b!165844 (=> res!138137 e!114789)))

(assert (=> b!165844 (= res!138137 (= (size!3765 (buf!4217 (_2!7885 lt!258884))) #b00000000000000000000000000000000))))

(declare-fun b!165845 () Bool)

(assert (=> b!165845 (= e!114789 (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(assert (= (and d!57489 res!138139) b!165843))

(assert (= (and b!165843 res!138138) b!165844))

(assert (= (and b!165844 (not res!138137)) b!165845))

(assert (=> b!165843 m!263119))

(assert (=> b!165843 m!263119))

(assert (=> b!165845 m!263119))

(assert (=> b!165845 m!263119))

(declare-fun m!263473 () Bool)

(assert (=> b!165845 m!263473))

(assert (=> d!57413 d!57489))

(declare-fun d!57491 () Bool)

(declare-fun res!138142 () Bool)

(declare-fun e!114792 () Bool)

(assert (=> d!57491 (=> (not res!138142) (not e!114792))))

(assert (=> d!57491 (= res!138142 (= (size!3765 (buf!4217 lt!259214)) (size!3765 (buf!4217 (_2!7885 lt!258884)))))))

(assert (=> d!57491 (= (isPrefixOf!0 lt!259214 (_2!7885 lt!258884)) e!114792)))

(declare-fun b!165846 () Bool)

(declare-fun res!138141 () Bool)

(assert (=> b!165846 (=> (not res!138141) (not e!114792))))

(assert (=> b!165846 (= res!138141 (bvsle (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun b!165847 () Bool)

(declare-fun e!114791 () Bool)

(assert (=> b!165847 (= e!114792 e!114791)))

(declare-fun res!138140 () Bool)

(assert (=> b!165847 (=> res!138140 e!114791)))

(assert (=> b!165847 (= res!138140 (= (size!3765 (buf!4217 lt!259214)) #b00000000000000000000000000000000))))

(declare-fun b!165848 () Bool)

(assert (=> b!165848 (= e!114791 (arrayBitRangesEq!0 (buf!4217 lt!259214) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(assert (= (and d!57491 res!138142) b!165846))

(assert (= (and b!165846 res!138141) b!165847))

(assert (= (and b!165847 (not res!138140)) b!165848))

(declare-fun m!263475 () Bool)

(assert (=> b!165846 m!263475))

(assert (=> b!165846 m!263119))

(assert (=> b!165848 m!263475))

(assert (=> b!165848 m!263475))

(declare-fun m!263477 () Bool)

(assert (=> b!165848 m!263477))

(assert (=> d!57413 d!57491))

(declare-fun d!57493 () Bool)

(declare-fun res!138145 () Bool)

(declare-fun e!114794 () Bool)

(assert (=> d!57493 (=> (not res!138145) (not e!114794))))

(assert (=> d!57493 (= res!138145 (= (size!3765 (buf!4217 thiss!1577)) (size!3765 (buf!4217 thiss!1577))))))

(assert (=> d!57493 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!114794)))

(declare-fun b!165849 () Bool)

(declare-fun res!138144 () Bool)

(assert (=> b!165849 (=> (not res!138144) (not e!114794))))

(assert (=> b!165849 (= res!138144 (bvsle (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(declare-fun b!165850 () Bool)

(declare-fun e!114793 () Bool)

(assert (=> b!165850 (= e!114794 e!114793)))

(declare-fun res!138143 () Bool)

(assert (=> b!165850 (=> res!138143 e!114793)))

(assert (=> b!165850 (= res!138143 (= (size!3765 (buf!4217 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165851 () Bool)

(assert (=> b!165851 (= e!114793 (arrayBitRangesEq!0 (buf!4217 thiss!1577) (buf!4217 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(assert (= (and d!57493 res!138145) b!165849))

(assert (= (and b!165849 res!138144) b!165850))

(assert (= (and b!165850 (not res!138143)) b!165851))

(assert (=> b!165849 m!263121))

(assert (=> b!165849 m!263121))

(assert (=> b!165851 m!263121))

(assert (=> b!165851 m!263121))

(declare-fun m!263479 () Bool)

(assert (=> b!165851 m!263479))

(assert (=> d!57413 d!57493))

(declare-fun d!57495 () Bool)

(assert (=> d!57495 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(declare-fun lt!259303 () Unit!11520)

(assert (=> d!57495 (= lt!259303 (choose!30 lt!259214 (_2!7885 lt!258884) (_2!7885 lt!258884)))))

(assert (=> d!57495 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(assert (=> d!57495 (= (lemmaIsPrefixTransitive!0 lt!259214 (_2!7885 lt!258884) (_2!7885 lt!258884)) lt!259303)))

(declare-fun bs!14270 () Bool)

(assert (= bs!14270 d!57495))

(assert (=> bs!14270 m!263315))

(declare-fun m!263481 () Bool)

(assert (=> bs!14270 m!263481))

(assert (=> bs!14270 m!263315))

(assert (=> d!57413 d!57495))

(declare-fun d!57497 () Bool)

(assert (=> d!57497 (isPrefixOf!0 (_2!7885 lt!258884) (_2!7885 lt!258884))))

(declare-fun lt!259306 () Unit!11520)

(declare-fun choose!11 (BitStream!6686) Unit!11520)

(assert (=> d!57497 (= lt!259306 (choose!11 (_2!7885 lt!258884)))))

(assert (=> d!57497 (= (lemmaIsPrefixRefl!0 (_2!7885 lt!258884)) lt!259306)))

(declare-fun bs!14272 () Bool)

(assert (= bs!14272 d!57497))

(assert (=> bs!14272 m!263313))

(declare-fun m!263483 () Bool)

(assert (=> bs!14272 m!263483))

(assert (=> d!57413 d!57497))

(declare-fun d!57499 () Bool)

(assert (=> d!57499 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!259307 () Unit!11520)

(assert (=> d!57499 (= lt!259307 (choose!11 thiss!1577))))

(assert (=> d!57499 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!259307)))

(declare-fun bs!14273 () Bool)

(assert (= bs!14273 d!57499))

(assert (=> bs!14273 m!263309))

(declare-fun m!263485 () Bool)

(assert (=> bs!14273 m!263485))

(assert (=> d!57413 d!57499))

(declare-fun d!57501 () Bool)

(assert (=> d!57501 (isPrefixOf!0 lt!259214 lt!259214)))

(declare-fun lt!259308 () Unit!11520)

(assert (=> d!57501 (= lt!259308 (choose!11 lt!259214))))

(assert (=> d!57501 (= (lemmaIsPrefixRefl!0 lt!259214) lt!259308)))

(declare-fun bs!14274 () Bool)

(assert (= bs!14274 d!57501))

(assert (=> bs!14274 m!263297))

(declare-fun m!263487 () Bool)

(assert (=> bs!14274 m!263487))

(assert (=> d!57413 d!57501))

(declare-fun d!57503 () Bool)

(declare-fun res!138148 () Bool)

(declare-fun e!114796 () Bool)

(assert (=> d!57503 (=> (not res!138148) (not e!114796))))

(assert (=> d!57503 (= res!138148 (= (size!3765 (buf!4217 lt!259214)) (size!3765 (buf!4217 lt!259214))))))

(assert (=> d!57503 (= (isPrefixOf!0 lt!259214 lt!259214) e!114796)))

(declare-fun b!165852 () Bool)

(declare-fun res!138147 () Bool)

(assert (=> b!165852 (=> (not res!138147) (not e!114796))))

(assert (=> b!165852 (= res!138147 (bvsle (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(declare-fun b!165853 () Bool)

(declare-fun e!114795 () Bool)

(assert (=> b!165853 (= e!114796 e!114795)))

(declare-fun res!138146 () Bool)

(assert (=> b!165853 (=> res!138146 e!114795)))

(assert (=> b!165853 (= res!138146 (= (size!3765 (buf!4217 lt!259214)) #b00000000000000000000000000000000))))

(declare-fun b!165854 () Bool)

(assert (=> b!165854 (= e!114795 (arrayBitRangesEq!0 (buf!4217 lt!259214) (buf!4217 lt!259214) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(assert (= (and d!57503 res!138148) b!165852))

(assert (= (and b!165852 res!138147) b!165853))

(assert (= (and b!165853 (not res!138146)) b!165854))

(assert (=> b!165852 m!263475))

(assert (=> b!165852 m!263475))

(assert (=> b!165854 m!263475))

(assert (=> b!165854 m!263475))

(declare-fun m!263489 () Bool)

(assert (=> b!165854 m!263489))

(assert (=> d!57413 d!57503))

(declare-fun d!57505 () Bool)

(assert (=> d!57505 (= (invariant!0 (currentBit!7894 thiss!1577) (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577))) (and (bvsge (currentBit!7894 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7894 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7899 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577))) (and (= (currentBit!7894 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7899 thiss!1577) (size!3765 (buf!4217 thiss!1577)))))))))

(assert (=> d!57409 d!57505))

(declare-fun d!57507 () Bool)

(assert (=> d!57507 (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7899 thiss!1577))))

(assert (=> d!57507 true))

(declare-fun _$8!180 () Unit!11520)

(assert (=> d!57507 (= (choose!225 (buf!4217 thiss!1577) (currentByte!7899 thiss!1577) lt!258886) _$8!180)))

(declare-fun bs!14275 () Bool)

(assert (= bs!14275 d!57507))

(assert (=> bs!14275 m!263109))

(assert (=> bs!14275 m!263269))

(assert (=> d!57383 d!57507))

(declare-fun d!57509 () Bool)

(declare-fun e!114799 () Bool)

(assert (=> d!57509 e!114799))

(declare-fun res!138151 () Bool)

(assert (=> d!57509 (=> (not res!138151) (not e!114799))))

(declare-fun lt!259314 () (_ BitVec 64))

(declare-fun lt!259313 () BitStream!6686)

(assert (=> d!57509 (= res!138151 (= (bvadd lt!259314 (bvsub lt!259198 lt!259210)) (bitIndex!0 (size!3765 (buf!4217 lt!259313)) (currentByte!7899 lt!259313) (currentBit!7894 lt!259313))))))

(assert (=> d!57509 (or (not (= (bvand lt!259314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259198 lt!259210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259314 (bvsub lt!259198 lt!259210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57509 (= lt!259314 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))))))

(assert (=> d!57509 (= lt!259313 (_2!7885 (moveBitIndex!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210))))))

(assert (=> d!57509 (moveBitIndexPrecond!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210))))

(assert (=> d!57509 (= (withMovedBitIndex!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210)) lt!259313)))

(declare-fun b!165857 () Bool)

(assert (=> b!165857 (= e!114799 (= (size!3765 (buf!4217 (_2!7886 lt!259206))) (size!3765 (buf!4217 lt!259313))))))

(assert (= (and d!57509 res!138151) b!165857))

(declare-fun m!263491 () Bool)

(assert (=> d!57509 m!263491))

(assert (=> d!57509 m!263423))

(declare-fun m!263493 () Bool)

(assert (=> d!57509 m!263493))

(declare-fun m!263495 () Bool)

(assert (=> d!57509 m!263495))

(assert (=> b!165729 d!57509))

(assert (=> b!165729 d!57359))

(assert (=> b!165729 d!57367))

(declare-fun d!57511 () Bool)

(declare-fun res!138152 () Bool)

(declare-fun e!114800 () Bool)

(assert (=> d!57511 (=> res!138152 e!114800)))

(assert (=> d!57511 (= res!138152 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (=> d!57511 (= (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)) e!114800)))

(declare-fun b!165858 () Bool)

(declare-fun e!114801 () Bool)

(assert (=> b!165858 (= e!114800 e!114801)))

(declare-fun res!138153 () Bool)

(assert (=> b!165858 (=> (not res!138153) (not e!114801))))

(assert (=> b!165858 (= res!138153 (= (select (arr!4686 (buf!4217 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4686 lt!258889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!165859 () Bool)

(assert (=> b!165859 (= e!114801 (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (= (and d!57511 (not res!138152)) b!165858))

(assert (= (and b!165858 res!138153) b!165859))

(declare-fun m!263497 () Bool)

(assert (=> b!165858 m!263497))

(declare-fun m!263499 () Bool)

(assert (=> b!165858 m!263499))

(declare-fun m!263501 () Bool)

(assert (=> b!165859 m!263501))

(assert (=> b!165664 d!57511))

(declare-fun d!57513 () Bool)

(declare-fun res!138156 () Bool)

(declare-fun e!114803 () Bool)

(assert (=> d!57513 (=> (not res!138156) (not e!114803))))

(assert (=> d!57513 (= res!138156 (= (size!3765 (buf!4217 (_1!7886 lt!259206))) (size!3765 (buf!4217 thiss!1577))))))

(assert (=> d!57513 (= (isPrefixOf!0 (_1!7886 lt!259206) thiss!1577) e!114803)))

(declare-fun b!165860 () Bool)

(declare-fun res!138155 () Bool)

(assert (=> b!165860 (=> (not res!138155) (not e!114803))))

(assert (=> b!165860 (= res!138155 (bvsle (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206))) (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(declare-fun b!165861 () Bool)

(declare-fun e!114802 () Bool)

(assert (=> b!165861 (= e!114803 e!114802)))

(declare-fun res!138154 () Bool)

(assert (=> b!165861 (=> res!138154 e!114802)))

(assert (=> b!165861 (= res!138154 (= (size!3765 (buf!4217 (_1!7886 lt!259206))) #b00000000000000000000000000000000))))

(declare-fun b!165862 () Bool)

(assert (=> b!165862 (= e!114802 (arrayBitRangesEq!0 (buf!4217 (_1!7886 lt!259206)) (buf!4217 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(assert (= (and d!57513 res!138156) b!165860))

(assert (= (and b!165860 res!138155) b!165861))

(assert (= (and b!165861 (not res!138154)) b!165862))

(assert (=> b!165860 m!263469))

(assert (=> b!165860 m!263121))

(assert (=> b!165862 m!263469))

(assert (=> b!165862 m!263469))

(declare-fun m!263503 () Bool)

(assert (=> b!165862 m!263503))

(assert (=> b!165728 d!57513))

(declare-fun d!57515 () Bool)

(assert (=> d!57515 (= (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) ((_ sign_extend 32) (currentByte!7899 thiss!1577)) ((_ sign_extend 32) (currentBit!7894 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3765 (buf!4217 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 thiss!1577)))))))

(assert (=> d!57407 d!57515))

(assert (=> b!165712 d!57367))

(assert (=> b!165712 d!57359))

(declare-fun d!57517 () Bool)

(declare-fun e!114808 () Bool)

(assert (=> d!57517 e!114808))

(declare-fun res!138159 () Bool)

(assert (=> d!57517 (=> (not res!138159) (not e!114808))))

(declare-fun lt!259334 () tuple2!14598)

(assert (=> d!57517 (= res!138159 (= (buf!4217 (_2!7890 lt!259334)) (buf!4217 (_1!7886 lt!258888))))))

(declare-datatypes ((tuple3!944 0))(
  ( (tuple3!945 (_1!7894 Unit!11520) (_2!7894 (_ BitVec 8)) (_3!594 BitStream!6686)) )
))
(declare-fun lt!259331 () tuple3!944)

(assert (=> d!57517 (= lt!259334 (tuple2!14599 (_2!7894 lt!259331) (_3!594 lt!259331)))))

(declare-fun e!114809 () tuple3!944)

(assert (=> d!57517 (= lt!259331 e!114809)))

(declare-fun c!8608 () Bool)

(declare-fun lt!259329 () (_ BitVec 32))

(assert (=> d!57517 (= c!8608 (bvsle lt!259329 #b00000000000000000000000000001000))))

(assert (=> d!57517 (= lt!259329 (bvadd (currentBit!7894 (_1!7886 lt!258888)) nBits!511))))

(assert (=> d!57517 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!57517 (= (readPartialByte!0 (_1!7886 lt!258888) nBits!511) lt!259334)))

(declare-fun b!165869 () Bool)

(declare-fun lt!259332 () tuple2!14588)

(assert (=> b!165869 (= e!114809 (tuple3!945 (_1!7885 lt!259332) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_1!7886 lt!258888))) (currentByte!7899 (_1!7886 lt!258888)))) (bvsub #b00000000000000000000000000001000 lt!259329)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7885 lt!259332)))))

(assert (=> b!165869 (= lt!259332 (moveBitIndex!0 (_1!7886 lt!258888) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!259333 () (_ BitVec 32))

(declare-fun b!165870 () Bool)

(declare-fun Unit!11544 () Unit!11520)

(assert (=> b!165870 (= e!114809 (tuple3!945 Unit!11544 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_1!7886 lt!258888))) (currentByte!7899 (_1!7886 lt!258888)))) lt!259333))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_1!7886 lt!258888))) (bvadd (currentByte!7899 (_1!7886 lt!258888)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!259333))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvadd (currentByte!7899 (_1!7886 lt!258888)) #b00000000000000000000000000000001) lt!259333)))))

(assert (=> b!165870 (= lt!259333 (bvsub lt!259329 #b00000000000000000000000000001000))))

(declare-fun lt!259335 () (_ BitVec 64))

(declare-fun b!165871 () Bool)

(declare-fun lt!259330 () (_ BitVec 64))

(assert (=> b!165871 (= e!114808 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7890 lt!259334))) (currentByte!7899 (_2!7890 lt!259334)) (currentBit!7894 (_2!7890 lt!259334))) (bvadd lt!259330 lt!259335)))))

(assert (=> b!165871 (or (not (= (bvand lt!259330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259335 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259330 lt!259335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165871 (= lt!259335 ((_ sign_extend 32) nBits!511))))

(assert (=> b!165871 (= lt!259330 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!258888))) (currentByte!7899 (_1!7886 lt!258888)) (currentBit!7894 (_1!7886 lt!258888))))))

(assert (= (and d!57517 c!8608) b!165869))

(assert (= (and d!57517 (not c!8608)) b!165870))

(assert (= (and d!57517 res!138159) b!165871))

(declare-fun m!263505 () Bool)

(assert (=> b!165869 m!263505))

(assert (=> b!165869 m!263131))

(declare-fun m!263507 () Bool)

(assert (=> b!165869 m!263507))

(assert (=> b!165870 m!263505))

(declare-fun m!263509 () Bool)

(assert (=> b!165870 m!263509))

(assert (=> b!165870 m!263131))

(declare-fun m!263511 () Bool)

(assert (=> b!165871 m!263511))

(declare-fun m!263513 () Bool)

(assert (=> b!165871 m!263513))

(assert (=> d!57411 d!57517))

(declare-fun d!57519 () Bool)

(declare-fun e!114810 () Bool)

(assert (=> d!57519 e!114810))

(declare-fun res!138160 () Bool)

(assert (=> d!57519 (=> (not res!138160) (not e!114810))))

(declare-fun lt!259338 () (_ BitVec 64))

(declare-fun lt!259340 () (_ BitVec 64))

(declare-fun lt!259341 () (_ BitVec 64))

(assert (=> d!57519 (= res!138160 (= lt!259340 (bvsub lt!259338 lt!259341)))))

(assert (=> d!57519 (or (= (bvand lt!259338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259338 lt!259341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57519 (= lt!259341 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!259139)))) ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!259139))) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!259139)))))))

(declare-fun lt!259339 () (_ BitVec 64))

(declare-fun lt!259336 () (_ BitVec 64))

(assert (=> d!57519 (= lt!259338 (bvmul lt!259339 lt!259336))))

(assert (=> d!57519 (or (= lt!259339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259336 (bvsdiv (bvmul lt!259339 lt!259336) lt!259339)))))

(assert (=> d!57519 (= lt!259336 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57519 (= lt!259339 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!259139)))))))

(assert (=> d!57519 (= lt!259340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!259139))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!259139)))))))

(assert (=> d!57519 (invariant!0 (currentBit!7894 (_2!7885 lt!259139)) (currentByte!7899 (_2!7885 lt!259139)) (size!3765 (buf!4217 (_2!7885 lt!259139))))))

(assert (=> d!57519 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!259139))) (currentByte!7899 (_2!7885 lt!259139)) (currentBit!7894 (_2!7885 lt!259139))) lt!259340)))

(declare-fun b!165872 () Bool)

(declare-fun res!138161 () Bool)

(assert (=> b!165872 (=> (not res!138161) (not e!114810))))

(assert (=> b!165872 (= res!138161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259340))))

(declare-fun b!165873 () Bool)

(declare-fun lt!259337 () (_ BitVec 64))

(assert (=> b!165873 (= e!114810 (bvsle lt!259340 (bvmul lt!259337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165873 (or (= lt!259337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259337)))))

(assert (=> b!165873 (= lt!259337 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!259139)))))))

(assert (= (and d!57519 res!138160) b!165872))

(assert (= (and b!165872 res!138161) b!165873))

(declare-fun m!263515 () Bool)

(assert (=> d!57519 m!263515))

(declare-fun m!263517 () Bool)

(assert (=> d!57519 m!263517))

(assert (=> b!165700 d!57519))

(declare-fun d!57521 () Bool)

(declare-fun e!114811 () Bool)

(assert (=> d!57521 e!114811))

(declare-fun res!138162 () Bool)

(assert (=> d!57521 (=> (not res!138162) (not e!114811))))

(declare-fun lt!259346 () (_ BitVec 64))

(declare-fun lt!259347 () (_ BitVec 64))

(declare-fun lt!259344 () (_ BitVec 64))

(assert (=> d!57521 (= res!138162 (= lt!259346 (bvsub lt!259344 lt!259347)))))

(assert (=> d!57521 (or (= (bvand lt!259344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259347 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259344 lt!259347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57521 (= lt!259347 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) ((_ sign_extend 32) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) ((_ sign_extend 32) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))))

(declare-fun lt!259345 () (_ BitVec 64))

(declare-fun lt!259342 () (_ BitVec 64))

(assert (=> d!57521 (= lt!259344 (bvmul lt!259345 lt!259342))))

(assert (=> d!57521 (or (= lt!259345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259342 (bvsdiv (bvmul lt!259345 lt!259342) lt!259345)))))

(assert (=> d!57521 (= lt!259342 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57521 (= lt!259345 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))))

(assert (=> d!57521 (= lt!259346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))))

(assert (=> d!57521 (invariant!0 (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))

(assert (=> d!57521 (= (bitIndex!0 (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) lt!259346)))

(declare-fun b!165874 () Bool)

(declare-fun res!138163 () Bool)

(assert (=> b!165874 (=> (not res!138163) (not e!114811))))

(assert (=> b!165874 (= res!138163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259346))))

(declare-fun b!165875 () Bool)

(declare-fun lt!259343 () (_ BitVec 64))

(assert (=> b!165875 (= e!114811 (bvsle lt!259346 (bvmul lt!259343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165875 (or (= lt!259343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259343)))))

(assert (=> b!165875 (= lt!259343 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))))

(assert (= (and d!57521 res!138162) b!165874))

(assert (= (and b!165874 res!138163) b!165875))

(declare-fun m!263519 () Bool)

(assert (=> d!57521 m!263519))

(declare-fun m!263521 () Bool)

(assert (=> d!57521 m!263521))

(assert (=> b!165700 d!57521))

(assert (=> d!57367 d!57515))

(assert (=> d!57367 d!57505))

(push 1)

(assert (not bm!2779))

(assert (not b!165832))

(assert (not b!165851))

(assert (not b!165849))

(assert (not b!165803))

(assert (not b!165842))

(assert (not b!165859))

(assert (not d!57509))

(assert (not d!57507))

(assert (not b!165843))

(assert (not d!57499))

(assert (not d!57519))

(assert (not b!165834))

(assert (not b!165840))

(assert (not b!165869))

(assert (not b!165807))

(assert (not b!165835))

(assert (not b!165823))

(assert (not d!57501))

(assert (not bm!2778))

(assert (not b!165846))

(assert (not b!165822))

(assert (not b!165871))

(assert (not b!165862))

(assert (not b!165860))

(assert (not b!165845))

(assert (not b!165854))

(assert (not d!57495))

(assert (not b!165805))

(assert (not d!57521))

(assert (not d!57497))

(assert (not b!165848))

(assert (not d!57481))

(assert (not b!165824))

(assert (not b!165852))

(assert (not b!165833))

(assert (not d!57485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57725 () Bool)

(declare-fun e!114994 () Bool)

(assert (=> d!57725 e!114994))

(declare-fun res!138348 () Bool)

(assert (=> d!57725 (=> (not res!138348) (not e!114994))))

(declare-fun lt!259559 () (_ BitVec 64))

(declare-fun lt!259558 () (_ BitVec 64))

(declare-fun lt!259556 () (_ BitVec 64))

(assert (=> d!57725 (= res!138348 (= lt!259558 (bvsub lt!259556 lt!259559)))))

(assert (=> d!57725 (or (= (bvand lt!259556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259559 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259556 lt!259559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57725 (= lt!259559 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7890 lt!259334)))) ((_ sign_extend 32) (currentByte!7899 (_2!7890 lt!259334))) ((_ sign_extend 32) (currentBit!7894 (_2!7890 lt!259334)))))))

(declare-fun lt!259557 () (_ BitVec 64))

(declare-fun lt!259554 () (_ BitVec 64))

(assert (=> d!57725 (= lt!259556 (bvmul lt!259557 lt!259554))))

(assert (=> d!57725 (or (= lt!259557 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259554 (bvsdiv (bvmul lt!259557 lt!259554) lt!259557)))))

(assert (=> d!57725 (= lt!259554 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57725 (= lt!259557 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7890 lt!259334)))))))

(assert (=> d!57725 (= lt!259558 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7890 lt!259334))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7890 lt!259334)))))))

(assert (=> d!57725 (invariant!0 (currentBit!7894 (_2!7890 lt!259334)) (currentByte!7899 (_2!7890 lt!259334)) (size!3765 (buf!4217 (_2!7890 lt!259334))))))

(assert (=> d!57725 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7890 lt!259334))) (currentByte!7899 (_2!7890 lt!259334)) (currentBit!7894 (_2!7890 lt!259334))) lt!259558)))

(declare-fun b!166103 () Bool)

(declare-fun res!138349 () Bool)

(assert (=> b!166103 (=> (not res!138349) (not e!114994))))

(assert (=> b!166103 (= res!138349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259558))))

(declare-fun b!166104 () Bool)

(declare-fun lt!259555 () (_ BitVec 64))

(assert (=> b!166104 (= e!114994 (bvsle lt!259558 (bvmul lt!259555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166104 (or (= lt!259555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259555)))))

(assert (=> b!166104 (= lt!259555 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7890 lt!259334)))))))

(assert (= (and d!57725 res!138348) b!166103))

(assert (= (and b!166103 res!138349) b!166104))

(declare-fun m!263943 () Bool)

(assert (=> d!57725 m!263943))

(declare-fun m!263945 () Bool)

(assert (=> d!57725 m!263945))

(assert (=> b!165871 d!57725))

(declare-fun d!57727 () Bool)

(declare-fun e!114995 () Bool)

(assert (=> d!57727 e!114995))

(declare-fun res!138350 () Bool)

(assert (=> d!57727 (=> (not res!138350) (not e!114995))))

(declare-fun lt!259562 () (_ BitVec 64))

(declare-fun lt!259565 () (_ BitVec 64))

(declare-fun lt!259564 () (_ BitVec 64))

(assert (=> d!57727 (= res!138350 (= lt!259564 (bvsub lt!259562 lt!259565)))))

(assert (=> d!57727 (or (= (bvand lt!259562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259562 lt!259565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57727 (= lt!259565 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!258888)))) ((_ sign_extend 32) (currentByte!7899 (_1!7886 lt!258888))) ((_ sign_extend 32) (currentBit!7894 (_1!7886 lt!258888)))))))

(declare-fun lt!259563 () (_ BitVec 64))

(declare-fun lt!259560 () (_ BitVec 64))

(assert (=> d!57727 (= lt!259562 (bvmul lt!259563 lt!259560))))

(assert (=> d!57727 (or (= lt!259563 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259560 (bvsdiv (bvmul lt!259563 lt!259560) lt!259563)))))

(assert (=> d!57727 (= lt!259560 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57727 (= lt!259563 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!258888)))))))

(assert (=> d!57727 (= lt!259564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_1!7886 lt!258888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_1!7886 lt!258888)))))))

(assert (=> d!57727 (invariant!0 (currentBit!7894 (_1!7886 lt!258888)) (currentByte!7899 (_1!7886 lt!258888)) (size!3765 (buf!4217 (_1!7886 lt!258888))))))

(assert (=> d!57727 (= (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!258888))) (currentByte!7899 (_1!7886 lt!258888)) (currentBit!7894 (_1!7886 lt!258888))) lt!259564)))

(declare-fun b!166105 () Bool)

(declare-fun res!138351 () Bool)

(assert (=> b!166105 (=> (not res!138351) (not e!114995))))

(assert (=> b!166105 (= res!138351 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259564))))

(declare-fun b!166106 () Bool)

(declare-fun lt!259561 () (_ BitVec 64))

(assert (=> b!166106 (= e!114995 (bvsle lt!259564 (bvmul lt!259561 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166106 (or (= lt!259561 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259561 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259561)))))

(assert (=> b!166106 (= lt!259561 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!258888)))))))

(assert (= (and d!57727 res!138350) b!166105))

(assert (= (and b!166105 res!138351) b!166106))

(declare-fun m!263947 () Bool)

(assert (=> d!57727 m!263947))

(declare-fun m!263949 () Bool)

(assert (=> d!57727 m!263949))

(assert (=> b!165871 d!57727))

(assert (=> d!57497 d!57489))

(declare-fun d!57729 () Bool)

(assert (=> d!57729 (isPrefixOf!0 (_2!7885 lt!258884) (_2!7885 lt!258884))))

(assert (=> d!57729 true))

(declare-fun _$14!302 () Unit!11520)

(assert (=> d!57729 (= (choose!11 (_2!7885 lt!258884)) _$14!302)))

(declare-fun bs!14307 () Bool)

(assert (= bs!14307 d!57729))

(assert (=> bs!14307 m!263313))

(assert (=> d!57497 d!57729))

(declare-fun d!57731 () Bool)

(declare-fun lt!259566 () (_ BitVec 32))

(assert (=> d!57731 (= lt!259566 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259568 () (_ BitVec 32))

(assert (=> d!57731 (= lt!259568 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114996 () Bool)

(assert (=> d!57731 e!114996))

(declare-fun res!138353 () Bool)

(assert (=> d!57731 (=> (not res!138353) (not e!114996))))

(assert (=> d!57731 (= res!138353 (moveBitIndexPrecond!0 (_1!7886 lt!258888) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11570 () Unit!11520)

(declare-fun Unit!11571 () Unit!11520)

(declare-fun Unit!11572 () Unit!11520)

(assert (=> d!57731 (= (moveBitIndex!0 (_1!7886 lt!258888) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259566) #b00000000000000000000000000000000) (tuple2!14589 Unit!11570 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvsub (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259568) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259566 (currentBit!7894 (_1!7886 lt!258888))))) (ite (bvsge (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259566) #b00000000000000000000000000001000) (tuple2!14589 Unit!11571 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259568 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259566) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11572 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259568) (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259566))))))))

(declare-fun b!166107 () Bool)

(declare-fun e!114997 () Bool)

(assert (=> b!166107 (= e!114996 e!114997)))

(declare-fun res!138352 () Bool)

(assert (=> b!166107 (=> (not res!138352) (not e!114997))))

(declare-fun lt!259567 () (_ BitVec 64))

(declare-fun lt!259570 () tuple2!14588)

(assert (=> b!166107 (= res!138352 (= (bvadd lt!259567 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!259570))) (currentByte!7899 (_2!7885 lt!259570)) (currentBit!7894 (_2!7885 lt!259570)))))))

(assert (=> b!166107 (or (not (= (bvand lt!259567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259567 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!166107 (= lt!259567 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!258888))) (currentByte!7899 (_1!7886 lt!258888)) (currentBit!7894 (_1!7886 lt!258888))))))

(declare-fun lt!259571 () (_ BitVec 32))

(declare-fun lt!259569 () (_ BitVec 32))

(declare-fun Unit!11573 () Unit!11520)

(declare-fun Unit!11574 () Unit!11520)

(declare-fun Unit!11575 () Unit!11520)

(assert (=> b!166107 (= lt!259570 (ite (bvslt (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259571) #b00000000000000000000000000000000) (tuple2!14589 Unit!11573 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvsub (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259569) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259571 (currentBit!7894 (_1!7886 lt!258888))))) (ite (bvsge (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259571) #b00000000000000000000000000001000) (tuple2!14589 Unit!11574 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259569 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259571) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11575 (BitStream!6687 (buf!4217 (_1!7886 lt!258888)) (bvadd (currentByte!7899 (_1!7886 lt!258888)) lt!259569) (bvadd (currentBit!7894 (_1!7886 lt!258888)) lt!259571))))))))

(assert (=> b!166107 (= lt!259571 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166107 (= lt!259569 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166108 () Bool)

(assert (=> b!166108 (= e!114997 (and (= (size!3765 (buf!4217 (_1!7886 lt!258888))) (size!3765 (buf!4217 (_2!7885 lt!259570)))) (= (buf!4217 (_1!7886 lt!258888)) (buf!4217 (_2!7885 lt!259570)))))))

(assert (= (and d!57731 res!138353) b!166107))

(assert (= (and b!166107 res!138352) b!166108))

(declare-fun m!263951 () Bool)

(assert (=> d!57731 m!263951))

(declare-fun m!263953 () Bool)

(assert (=> b!166107 m!263953))

(assert (=> b!166107 m!263513))

(assert (=> b!165869 d!57731))

(declare-fun d!57733 () Bool)

(declare-fun e!114998 () Bool)

(assert (=> d!57733 e!114998))

(declare-fun res!138354 () Bool)

(assert (=> d!57733 (=> (not res!138354) (not e!114998))))

(declare-fun lt!259577 () (_ BitVec 64))

(declare-fun lt!259574 () (_ BitVec 64))

(declare-fun lt!259576 () (_ BitVec 64))

(assert (=> d!57733 (= res!138354 (= lt!259576 (bvsub lt!259574 lt!259577)))))

(assert (=> d!57733 (or (= (bvand lt!259574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259577 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259574 lt!259577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57733 (= lt!259577 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206)))) ((_ sign_extend 32) (currentByte!7899 (_2!7886 lt!259206))) ((_ sign_extend 32) (currentBit!7894 (_2!7886 lt!259206)))))))

(declare-fun lt!259575 () (_ BitVec 64))

(declare-fun lt!259572 () (_ BitVec 64))

(assert (=> d!57733 (= lt!259574 (bvmul lt!259575 lt!259572))))

(assert (=> d!57733 (or (= lt!259575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259572 (bvsdiv (bvmul lt!259575 lt!259572) lt!259575)))))

(assert (=> d!57733 (= lt!259572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57733 (= lt!259575 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206)))))))

(assert (=> d!57733 (= lt!259576 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7886 lt!259206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7886 lt!259206)))))))

(assert (=> d!57733 (invariant!0 (currentBit!7894 (_2!7886 lt!259206)) (currentByte!7899 (_2!7886 lt!259206)) (size!3765 (buf!4217 (_2!7886 lt!259206))))))

(assert (=> d!57733 (= (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))) lt!259576)))

(declare-fun b!166109 () Bool)

(declare-fun res!138355 () Bool)

(assert (=> b!166109 (=> (not res!138355) (not e!114998))))

(assert (=> b!166109 (= res!138355 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259576))))

(declare-fun b!166110 () Bool)

(declare-fun lt!259573 () (_ BitVec 64))

(assert (=> b!166110 (= e!114998 (bvsle lt!259576 (bvmul lt!259573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166110 (or (= lt!259573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259573)))))

(assert (=> b!166110 (= lt!259573 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206)))))))

(assert (= (and d!57733 res!138354) b!166109))

(assert (= (and b!166109 res!138355) b!166110))

(declare-fun m!263955 () Bool)

(assert (=> d!57733 m!263955))

(declare-fun m!263957 () Bool)

(assert (=> d!57733 m!263957))

(assert (=> b!165803 d!57733))

(assert (=> b!165803 d!57359))

(assert (=> b!165843 d!57359))

(assert (=> b!165832 d!57521))

(declare-fun b!166111 () Bool)

(declare-fun lt!259579 () tuple4!242)

(declare-fun e!114999 () Bool)

(assert (=> b!166111 (= e!114999 (arrayRangesEq!645 (buf!4217 (_2!7886 lt!259206)) (buf!4217 (_2!7885 lt!258884)) (_1!7893 lt!259579) (_2!7893 lt!259579)))))

(declare-fun b!166112 () Bool)

(declare-fun e!115003 () Bool)

(declare-fun lt!259580 () (_ BitVec 32))

(assert (=> b!166112 (= e!115003 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7886 lt!259206))) (_4!121 lt!259579)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259579)) #b00000000000000000000000000000000 lt!259580))))

(declare-fun b!166113 () Bool)

(declare-fun e!115002 () Bool)

(declare-fun e!115001 () Bool)

(assert (=> b!166113 (= e!115002 e!115001)))

(declare-fun res!138358 () Bool)

(assert (=> b!166113 (=> (not res!138358) (not e!115001))))

(assert (=> b!166113 (= res!138358 e!114999)))

(declare-fun res!138359 () Bool)

(assert (=> b!166113 (=> res!138359 e!114999)))

(assert (=> b!166113 (= res!138359 (bvsge (_1!7893 lt!259579) (_2!7893 lt!259579)))))

(assert (=> b!166113 (= lt!259580 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259578 () (_ BitVec 32))

(assert (=> b!166113 (= lt!259578 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166113 (= lt!259579 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206)))))))

(declare-fun b!166114 () Bool)

(declare-fun res!138357 () Bool)

(assert (=> b!166114 (= res!138357 (= lt!259580 #b00000000000000000000000000000000))))

(assert (=> b!166114 (=> res!138357 e!115003)))

(declare-fun e!115004 () Bool)

(assert (=> b!166114 (= e!115004 e!115003)))

(declare-fun b!166115 () Bool)

(declare-fun e!115000 () Bool)

(declare-fun call!2801 () Bool)

(assert (=> b!166115 (= e!115000 call!2801)))

(declare-fun d!57735 () Bool)

(declare-fun res!138360 () Bool)

(assert (=> d!57735 (=> res!138360 e!115002)))

(assert (=> d!57735 (= res!138360 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206)))))))

(assert (=> d!57735 (= (arrayBitRangesEq!0 (buf!4217 (_2!7886 lt!259206)) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206)))) e!115002)))

(declare-fun b!166116 () Bool)

(assert (=> b!166116 (= e!115000 e!115004)))

(declare-fun res!138356 () Bool)

(assert (=> b!166116 (= res!138356 call!2801)))

(assert (=> b!166116 (=> (not res!138356) (not e!115004))))

(declare-fun b!166117 () Bool)

(assert (=> b!166117 (= e!115001 e!115000)))

(declare-fun c!8630 () Bool)

(assert (=> b!166117 (= c!8630 (= (_3!593 lt!259579) (_4!121 lt!259579)))))

(declare-fun bm!2798 () Bool)

(assert (=> bm!2798 (= call!2801 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7886 lt!259206))) (_3!593 lt!259579)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259579)) lt!259578 (ite c!8630 lt!259580 #b00000000000000000000000000001000)))))

(assert (= (and d!57735 (not res!138360)) b!166113))

(assert (= (and b!166113 (not res!138359)) b!166111))

(assert (= (and b!166113 res!138358) b!166117))

(assert (= (and b!166117 c!8630) b!166115))

(assert (= (and b!166117 (not c!8630)) b!166116))

(assert (= (and b!166116 res!138356) b!166114))

(assert (= (and b!166114 (not res!138357)) b!166112))

(assert (= (or b!166115 b!166116) bm!2798))

(declare-fun m!263959 () Bool)

(assert (=> b!166111 m!263959))

(declare-fun m!263961 () Bool)

(assert (=> b!166112 m!263961))

(declare-fun m!263963 () Bool)

(assert (=> b!166112 m!263963))

(assert (=> b!166112 m!263961))

(assert (=> b!166112 m!263963))

(declare-fun m!263965 () Bool)

(assert (=> b!166112 m!263965))

(assert (=> b!166113 m!263423))

(declare-fun m!263967 () Bool)

(assert (=> b!166113 m!263967))

(declare-fun m!263969 () Bool)

(assert (=> bm!2798 m!263969))

(declare-fun m!263971 () Bool)

(assert (=> bm!2798 m!263971))

(assert (=> bm!2798 m!263969))

(assert (=> bm!2798 m!263971))

(declare-fun m!263973 () Bool)

(assert (=> bm!2798 m!263973))

(assert (=> b!165805 d!57735))

(assert (=> b!165805 d!57733))

(declare-fun b!166118 () Bool)

(declare-fun e!115005 () Bool)

(declare-fun lt!259582 () tuple4!242)

(assert (=> b!166118 (= e!115005 (arrayRangesEq!645 (buf!4217 (_2!7885 lt!258884)) (buf!4217 (_2!7885 lt!258884)) (_1!7893 lt!259582) (_2!7893 lt!259582)))))

(declare-fun e!115009 () Bool)

(declare-fun b!166119 () Bool)

(declare-fun lt!259583 () (_ BitVec 32))

(assert (=> b!166119 (= e!115009 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259582)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259582)) #b00000000000000000000000000000000 lt!259583))))

(declare-fun b!166120 () Bool)

(declare-fun e!115008 () Bool)

(declare-fun e!115007 () Bool)

(assert (=> b!166120 (= e!115008 e!115007)))

(declare-fun res!138363 () Bool)

(assert (=> b!166120 (=> (not res!138363) (not e!115007))))

(assert (=> b!166120 (= res!138363 e!115005)))

(declare-fun res!138364 () Bool)

(assert (=> b!166120 (=> res!138364 e!115005)))

(assert (=> b!166120 (= res!138364 (bvsge (_1!7893 lt!259582) (_2!7893 lt!259582)))))

(assert (=> b!166120 (= lt!259583 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259581 () (_ BitVec 32))

(assert (=> b!166120 (= lt!259581 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166120 (= lt!259582 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(declare-fun b!166121 () Bool)

(declare-fun res!138362 () Bool)

(assert (=> b!166121 (= res!138362 (= lt!259583 #b00000000000000000000000000000000))))

(assert (=> b!166121 (=> res!138362 e!115009)))

(declare-fun e!115010 () Bool)

(assert (=> b!166121 (= e!115010 e!115009)))

(declare-fun b!166122 () Bool)

(declare-fun e!115006 () Bool)

(declare-fun call!2802 () Bool)

(assert (=> b!166122 (= e!115006 call!2802)))

(declare-fun d!57737 () Bool)

(declare-fun res!138365 () Bool)

(assert (=> d!57737 (=> res!138365 e!115008)))

(assert (=> d!57737 (= res!138365 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))))))

(assert (=> d!57737 (= (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!258884))) (currentByte!7899 (_2!7885 lt!258884)) (currentBit!7894 (_2!7885 lt!258884)))) e!115008)))

(declare-fun b!166123 () Bool)

(assert (=> b!166123 (= e!115006 e!115010)))

(declare-fun res!138361 () Bool)

(assert (=> b!166123 (= res!138361 call!2802)))

(assert (=> b!166123 (=> (not res!138361) (not e!115010))))

(declare-fun b!166124 () Bool)

(assert (=> b!166124 (= e!115007 e!115006)))

(declare-fun c!8631 () Bool)

(assert (=> b!166124 (= c!8631 (= (_3!593 lt!259582) (_4!121 lt!259582)))))

(declare-fun bm!2799 () Bool)

(assert (=> bm!2799 (= call!2802 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259582)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259582)) lt!259581 (ite c!8631 lt!259583 #b00000000000000000000000000001000)))))

(assert (= (and d!57737 (not res!138365)) b!166120))

(assert (= (and b!166120 (not res!138364)) b!166118))

(assert (= (and b!166120 res!138363) b!166124))

(assert (= (and b!166124 c!8631) b!166122))

(assert (= (and b!166124 (not c!8631)) b!166123))

(assert (= (and b!166123 res!138361) b!166121))

(assert (= (and b!166121 (not res!138362)) b!166119))

(assert (= (or b!166122 b!166123) bm!2799))

(declare-fun m!263975 () Bool)

(assert (=> b!166118 m!263975))

(declare-fun m!263977 () Bool)

(assert (=> b!166119 m!263977))

(assert (=> b!166119 m!263977))

(assert (=> b!166119 m!263977))

(assert (=> b!166119 m!263977))

(declare-fun m!263979 () Bool)

(assert (=> b!166119 m!263979))

(assert (=> b!166120 m!263119))

(declare-fun m!263981 () Bool)

(assert (=> b!166120 m!263981))

(declare-fun m!263983 () Bool)

(assert (=> bm!2799 m!263983))

(assert (=> bm!2799 m!263983))

(assert (=> bm!2799 m!263983))

(assert (=> bm!2799 m!263983))

(declare-fun m!263985 () Bool)

(assert (=> bm!2799 m!263985))

(assert (=> b!165845 d!57737))

(assert (=> b!165845 d!57359))

(declare-fun d!57739 () Bool)

(assert (=> d!57739 (= (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259289)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259289)) #b00000000000000000000000000000000 lt!259290) (or (= #b00000000000000000000000000000000 lt!259290) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259289))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259290))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259289))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259290))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14308 () Bool)

(assert (= bs!14308 d!57739))

(declare-fun m!263987 () Bool)

(assert (=> bs!14308 m!263987))

(assert (=> bs!14308 m!263243))

(assert (=> b!165823 d!57739))

(declare-fun d!57741 () Bool)

(declare-fun e!115011 () Bool)

(assert (=> d!57741 e!115011))

(declare-fun res!138366 () Bool)

(assert (=> d!57741 (=> (not res!138366) (not e!115011))))

(declare-fun lt!259588 () (_ BitVec 64))

(declare-fun lt!259586 () (_ BitVec 64))

(declare-fun lt!259589 () (_ BitVec 64))

(assert (=> d!57741 (= res!138366 (= lt!259588 (bvsub lt!259586 lt!259589)))))

(assert (=> d!57741 (or (= (bvand lt!259586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259586 lt!259589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57741 (= lt!259589 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259313))) ((_ sign_extend 32) (currentByte!7899 lt!259313)) ((_ sign_extend 32) (currentBit!7894 lt!259313))))))

(declare-fun lt!259587 () (_ BitVec 64))

(declare-fun lt!259584 () (_ BitVec 64))

(assert (=> d!57741 (= lt!259586 (bvmul lt!259587 lt!259584))))

(assert (=> d!57741 (or (= lt!259587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259584 (bvsdiv (bvmul lt!259587 lt!259584) lt!259587)))))

(assert (=> d!57741 (= lt!259584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57741 (= lt!259587 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259313))))))

(assert (=> d!57741 (= lt!259588 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 lt!259313)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 lt!259313))))))

(assert (=> d!57741 (invariant!0 (currentBit!7894 lt!259313) (currentByte!7899 lt!259313) (size!3765 (buf!4217 lt!259313)))))

(assert (=> d!57741 (= (bitIndex!0 (size!3765 (buf!4217 lt!259313)) (currentByte!7899 lt!259313) (currentBit!7894 lt!259313)) lt!259588)))

(declare-fun b!166125 () Bool)

(declare-fun res!138367 () Bool)

(assert (=> b!166125 (=> (not res!138367) (not e!115011))))

(assert (=> b!166125 (= res!138367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259588))))

(declare-fun b!166126 () Bool)

(declare-fun lt!259585 () (_ BitVec 64))

(assert (=> b!166126 (= e!115011 (bvsle lt!259588 (bvmul lt!259585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166126 (or (= lt!259585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259585)))))

(assert (=> b!166126 (= lt!259585 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259313))))))

(assert (= (and d!57741 res!138366) b!166125))

(assert (= (and b!166125 res!138367) b!166126))

(declare-fun m!263989 () Bool)

(assert (=> d!57741 m!263989))

(declare-fun m!263991 () Bool)

(assert (=> d!57741 m!263991))

(assert (=> d!57509 d!57741))

(assert (=> d!57509 d!57733))

(declare-fun d!57743 () Bool)

(declare-fun lt!259590 () (_ BitVec 32))

(assert (=> d!57743 (= lt!259590 ((_ extract 31 0) (bvsrem (bvsub lt!259198 lt!259210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259592 () (_ BitVec 32))

(assert (=> d!57743 (= lt!259592 ((_ extract 31 0) (bvsdiv (bvsub lt!259198 lt!259210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!115012 () Bool)

(assert (=> d!57743 e!115012))

(declare-fun res!138369 () Bool)

(assert (=> d!57743 (=> (not res!138369) (not e!115012))))

(assert (=> d!57743 (= res!138369 (moveBitIndexPrecond!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210)))))

(declare-fun Unit!11576 () Unit!11520)

(declare-fun Unit!11577 () Unit!11520)

(declare-fun Unit!11578 () Unit!11520)

(assert (=> d!57743 (= (moveBitIndex!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210)) (ite (bvslt (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259590) #b00000000000000000000000000000000) (tuple2!14589 Unit!11576 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvsub (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259592) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259590 (currentBit!7894 (_2!7886 lt!259206))))) (ite (bvsge (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259590) #b00000000000000000000000000001000) (tuple2!14589 Unit!11577 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259592 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259590) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11578 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259592) (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259590))))))))

(declare-fun b!166127 () Bool)

(declare-fun e!115013 () Bool)

(assert (=> b!166127 (= e!115012 e!115013)))

(declare-fun res!138368 () Bool)

(assert (=> b!166127 (=> (not res!138368) (not e!115013))))

(declare-fun lt!259591 () (_ BitVec 64))

(declare-fun lt!259594 () tuple2!14588)

(assert (=> b!166127 (= res!138368 (= (bvadd lt!259591 (bvsub lt!259198 lt!259210)) (bitIndex!0 (size!3765 (buf!4217 (_2!7885 lt!259594))) (currentByte!7899 (_2!7885 lt!259594)) (currentBit!7894 (_2!7885 lt!259594)))))))

(assert (=> b!166127 (or (not (= (bvand lt!259591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259198 lt!259210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259591 (bvsub lt!259198 lt!259210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!166127 (= lt!259591 (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))))))

(declare-fun lt!259593 () (_ BitVec 32))

(declare-fun lt!259595 () (_ BitVec 32))

(declare-fun Unit!11579 () Unit!11520)

(declare-fun Unit!11580 () Unit!11520)

(declare-fun Unit!11581 () Unit!11520)

(assert (=> b!166127 (= lt!259594 (ite (bvslt (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259595) #b00000000000000000000000000000000) (tuple2!14589 Unit!11579 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvsub (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259593) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259595 (currentBit!7894 (_2!7886 lt!259206))))) (ite (bvsge (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259595) #b00000000000000000000000000001000) (tuple2!14589 Unit!11580 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259593 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259595) #b00000000000000000000000000001000))) (tuple2!14589 Unit!11581 (BitStream!6687 (buf!4217 (_2!7886 lt!259206)) (bvadd (currentByte!7899 (_2!7886 lt!259206)) lt!259593) (bvadd (currentBit!7894 (_2!7886 lt!259206)) lt!259595))))))))

(assert (=> b!166127 (= lt!259595 ((_ extract 31 0) (bvsrem (bvsub lt!259198 lt!259210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166127 (= lt!259593 ((_ extract 31 0) (bvsdiv (bvsub lt!259198 lt!259210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166128 () Bool)

(assert (=> b!166128 (= e!115013 (and (= (size!3765 (buf!4217 (_2!7886 lt!259206))) (size!3765 (buf!4217 (_2!7885 lt!259594)))) (= (buf!4217 (_2!7886 lt!259206)) (buf!4217 (_2!7885 lt!259594)))))))

(assert (= (and d!57743 res!138369) b!166127))

(assert (= (and b!166127 res!138368) b!166128))

(assert (=> d!57743 m!263495))

(declare-fun m!263993 () Bool)

(assert (=> b!166127 m!263993))

(assert (=> b!166127 m!263423))

(assert (=> d!57509 d!57743))

(declare-fun d!57745 () Bool)

(declare-fun res!138370 () Bool)

(declare-fun e!115014 () Bool)

(assert (=> d!57745 (=> (not res!138370) (not e!115014))))

(assert (=> d!57745 (= res!138370 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206))))) (bvsub lt!259198 lt!259210)) (bvsle (bvsub lt!259198 lt!259210) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206))))))))))

(assert (=> d!57745 (= (moveBitIndexPrecond!0 (_2!7886 lt!259206) (bvsub lt!259198 lt!259210)) e!115014)))

(declare-fun b!166129 () Bool)

(declare-fun lt!259596 () (_ BitVec 64))

(assert (=> b!166129 (= e!115014 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259596) (bvsle lt!259596 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7886 lt!259206))))))))))

(assert (=> b!166129 (= lt!259596 (bvadd (bitIndex!0 (size!3765 (buf!4217 (_2!7886 lt!259206))) (currentByte!7899 (_2!7886 lt!259206)) (currentBit!7894 (_2!7886 lt!259206))) (bvsub lt!259198 lt!259210)))))

(assert (= (and d!57745 res!138370) b!166129))

(assert (=> b!166129 m!263423))

(assert (=> d!57509 d!57745))

(declare-fun d!57747 () Bool)

(declare-fun res!138371 () Bool)

(declare-fun e!115015 () Bool)

(assert (=> d!57747 (=> res!138371 e!115015)))

(assert (=> d!57747 (= res!138371 (= (_1!7893 lt!259289) (_2!7893 lt!259289)))))

(assert (=> d!57747 (= (arrayRangesEq!645 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) (_1!7893 lt!259289) (_2!7893 lt!259289)) e!115015)))

(declare-fun b!166130 () Bool)

(declare-fun e!115016 () Bool)

(assert (=> b!166130 (= e!115015 e!115016)))

(declare-fun res!138372 () Bool)

(assert (=> b!166130 (=> (not res!138372) (not e!115016))))

(assert (=> b!166130 (= res!138372 (= (select (arr!4686 (buf!4217 thiss!1577)) (_1!7893 lt!259289)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_1!7893 lt!259289))))))

(declare-fun b!166131 () Bool)

(assert (=> b!166131 (= e!115016 (arrayRangesEq!645 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) (bvadd (_1!7893 lt!259289) #b00000000000000000000000000000001) (_2!7893 lt!259289)))))

(assert (= (and d!57747 (not res!138371)) b!166130))

(assert (= (and b!166130 res!138372) b!166131))

(declare-fun m!263995 () Bool)

(assert (=> b!166130 m!263995))

(declare-fun m!263997 () Bool)

(assert (=> b!166130 m!263997))

(declare-fun m!263999 () Bool)

(assert (=> b!166131 m!263999))

(assert (=> b!165822 d!57747))

(declare-fun d!57749 () Bool)

(assert (=> d!57749 (= (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) ((_ sign_extend 32) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) ((_ sign_extend 32) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) (bvsub (bvmul ((_ sign_extend 32) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))))

(assert (=> d!57521 d!57749))

(declare-fun d!57751 () Bool)

(assert (=> d!57751 (= (invariant!0 (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) (and (bvsge (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) #b00000000000000000000000000000000) (bvslt (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) #b00000000000000000000000000001000) (bvsge (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))) (and (= (currentBit!7894 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) #b00000000000000000000000000000000) (= (currentByte!7899 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (size!3765 (buf!4217 (BitStream!6687 lt!258889 (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)))))))))))

(assert (=> d!57521 d!57751))

(assert (=> b!165849 d!57367))

(declare-fun d!57753 () Bool)

(declare-fun e!115017 () Bool)

(assert (=> d!57753 e!115017))

(declare-fun res!138373 () Bool)

(assert (=> d!57753 (=> (not res!138373) (not e!115017))))

(declare-fun lt!259599 () (_ BitVec 64))

(declare-fun lt!259601 () (_ BitVec 64))

(declare-fun lt!259602 () (_ BitVec 64))

(assert (=> d!57753 (= res!138373 (= lt!259601 (bvsub lt!259599 lt!259602)))))

(assert (=> d!57753 (or (= (bvand lt!259599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259599 lt!259602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57753 (= lt!259602 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!259206)))) ((_ sign_extend 32) (currentByte!7899 (_1!7886 lt!259206))) ((_ sign_extend 32) (currentBit!7894 (_1!7886 lt!259206)))))))

(declare-fun lt!259600 () (_ BitVec 64))

(declare-fun lt!259597 () (_ BitVec 64))

(assert (=> d!57753 (= lt!259599 (bvmul lt!259600 lt!259597))))

(assert (=> d!57753 (or (= lt!259600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259597 (bvsdiv (bvmul lt!259600 lt!259597) lt!259600)))))

(assert (=> d!57753 (= lt!259597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57753 (= lt!259600 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!259206)))))))

(assert (=> d!57753 (= lt!259601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_1!7886 lt!259206))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_1!7886 lt!259206)))))))

(assert (=> d!57753 (invariant!0 (currentBit!7894 (_1!7886 lt!259206)) (currentByte!7899 (_1!7886 lt!259206)) (size!3765 (buf!4217 (_1!7886 lt!259206))))))

(assert (=> d!57753 (= (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206))) lt!259601)))

(declare-fun b!166132 () Bool)

(declare-fun res!138374 () Bool)

(assert (=> b!166132 (=> (not res!138374) (not e!115017))))

(assert (=> b!166132 (= res!138374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259601))))

(declare-fun b!166133 () Bool)

(declare-fun lt!259598 () (_ BitVec 64))

(assert (=> b!166133 (= e!115017 (bvsle lt!259601 (bvmul lt!259598 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166133 (or (= lt!259598 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259598 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259598)))))

(assert (=> b!166133 (= lt!259598 ((_ sign_extend 32) (size!3765 (buf!4217 (_1!7886 lt!259206)))))))

(assert (= (and d!57753 res!138373) b!166132))

(assert (= (and b!166132 res!138374) b!166133))

(declare-fun m!264001 () Bool)

(assert (=> d!57753 m!264001))

(declare-fun m!264003 () Bool)

(assert (=> d!57753 m!264003))

(assert (=> b!165860 d!57753))

(assert (=> b!165860 d!57367))

(declare-fun b!166134 () Bool)

(declare-fun e!115018 () Bool)

(declare-fun lt!259604 () tuple4!242)

(assert (=> b!166134 (= e!115018 (arrayRangesEq!645 (buf!4217 lt!259214) (buf!4217 lt!259214) (_1!7893 lt!259604) (_2!7893 lt!259604)))))

(declare-fun e!115022 () Bool)

(declare-fun b!166135 () Bool)

(declare-fun lt!259605 () (_ BitVec 32))

(assert (=> b!166135 (= e!115022 (byteRangesEq!0 (select (arr!4686 (buf!4217 lt!259214)) (_4!121 lt!259604)) (select (arr!4686 (buf!4217 lt!259214)) (_4!121 lt!259604)) #b00000000000000000000000000000000 lt!259605))))

(declare-fun b!166136 () Bool)

(declare-fun e!115021 () Bool)

(declare-fun e!115020 () Bool)

(assert (=> b!166136 (= e!115021 e!115020)))

(declare-fun res!138377 () Bool)

(assert (=> b!166136 (=> (not res!138377) (not e!115020))))

(assert (=> b!166136 (= res!138377 e!115018)))

(declare-fun res!138378 () Bool)

(assert (=> b!166136 (=> res!138378 e!115018)))

(assert (=> b!166136 (= res!138378 (bvsge (_1!7893 lt!259604) (_2!7893 lt!259604)))))

(assert (=> b!166136 (= lt!259605 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259603 () (_ BitVec 32))

(assert (=> b!166136 (= lt!259603 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166136 (= lt!259604 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(declare-fun b!166137 () Bool)

(declare-fun res!138376 () Bool)

(assert (=> b!166137 (= res!138376 (= lt!259605 #b00000000000000000000000000000000))))

(assert (=> b!166137 (=> res!138376 e!115022)))

(declare-fun e!115023 () Bool)

(assert (=> b!166137 (= e!115023 e!115022)))

(declare-fun b!166138 () Bool)

(declare-fun e!115019 () Bool)

(declare-fun call!2803 () Bool)

(assert (=> b!166138 (= e!115019 call!2803)))

(declare-fun d!57755 () Bool)

(declare-fun res!138379 () Bool)

(assert (=> d!57755 (=> res!138379 e!115021)))

(assert (=> d!57755 (= res!138379 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(assert (=> d!57755 (= (arrayBitRangesEq!0 (buf!4217 lt!259214) (buf!4217 lt!259214) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))) e!115021)))

(declare-fun b!166139 () Bool)

(assert (=> b!166139 (= e!115019 e!115023)))

(declare-fun res!138375 () Bool)

(assert (=> b!166139 (= res!138375 call!2803)))

(assert (=> b!166139 (=> (not res!138375) (not e!115023))))

(declare-fun b!166140 () Bool)

(assert (=> b!166140 (= e!115020 e!115019)))

(declare-fun c!8632 () Bool)

(assert (=> b!166140 (= c!8632 (= (_3!593 lt!259604) (_4!121 lt!259604)))))

(declare-fun bm!2800 () Bool)

(assert (=> bm!2800 (= call!2803 (byteRangesEq!0 (select (arr!4686 (buf!4217 lt!259214)) (_3!593 lt!259604)) (select (arr!4686 (buf!4217 lt!259214)) (_3!593 lt!259604)) lt!259603 (ite c!8632 lt!259605 #b00000000000000000000000000001000)))))

(assert (= (and d!57755 (not res!138379)) b!166136))

(assert (= (and b!166136 (not res!138378)) b!166134))

(assert (= (and b!166136 res!138377) b!166140))

(assert (= (and b!166140 c!8632) b!166138))

(assert (= (and b!166140 (not c!8632)) b!166139))

(assert (= (and b!166139 res!138375) b!166137))

(assert (= (and b!166137 (not res!138376)) b!166135))

(assert (= (or b!166138 b!166139) bm!2800))

(declare-fun m!264005 () Bool)

(assert (=> b!166134 m!264005))

(declare-fun m!264007 () Bool)

(assert (=> b!166135 m!264007))

(assert (=> b!166135 m!264007))

(assert (=> b!166135 m!264007))

(assert (=> b!166135 m!264007))

(declare-fun m!264009 () Bool)

(assert (=> b!166135 m!264009))

(assert (=> b!166136 m!263475))

(declare-fun m!264011 () Bool)

(assert (=> b!166136 m!264011))

(declare-fun m!264013 () Bool)

(assert (=> bm!2800 m!264013))

(assert (=> bm!2800 m!264013))

(assert (=> bm!2800 m!264013))

(assert (=> bm!2800 m!264013))

(declare-fun m!264015 () Bool)

(assert (=> bm!2800 m!264015))

(assert (=> b!165854 d!57755))

(declare-fun d!57757 () Bool)

(declare-fun e!115024 () Bool)

(assert (=> d!57757 e!115024))

(declare-fun res!138380 () Bool)

(assert (=> d!57757 (=> (not res!138380) (not e!115024))))

(declare-fun lt!259611 () (_ BitVec 64))

(declare-fun lt!259610 () (_ BitVec 64))

(declare-fun lt!259608 () (_ BitVec 64))

(assert (=> d!57757 (= res!138380 (= lt!259610 (bvsub lt!259608 lt!259611)))))

(assert (=> d!57757 (or (= (bvand lt!259608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259608 lt!259611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57757 (= lt!259611 (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259214))) ((_ sign_extend 32) (currentByte!7899 lt!259214)) ((_ sign_extend 32) (currentBit!7894 lt!259214))))))

(declare-fun lt!259609 () (_ BitVec 64))

(declare-fun lt!259606 () (_ BitVec 64))

(assert (=> d!57757 (= lt!259608 (bvmul lt!259609 lt!259606))))

(assert (=> d!57757 (or (= lt!259609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259606 (bvsdiv (bvmul lt!259609 lt!259606) lt!259609)))))

(assert (=> d!57757 (= lt!259606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57757 (= lt!259609 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259214))))))

(assert (=> d!57757 (= lt!259610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 lt!259214)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 lt!259214))))))

(assert (=> d!57757 (invariant!0 (currentBit!7894 lt!259214) (currentByte!7899 lt!259214) (size!3765 (buf!4217 lt!259214)))))

(assert (=> d!57757 (= (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) lt!259610)))

(declare-fun b!166141 () Bool)

(declare-fun res!138381 () Bool)

(assert (=> b!166141 (=> (not res!138381) (not e!115024))))

(assert (=> b!166141 (= res!138381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259610))))

(declare-fun b!166142 () Bool)

(declare-fun lt!259607 () (_ BitVec 64))

(assert (=> b!166142 (= e!115024 (bvsle lt!259610 (bvmul lt!259607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166142 (or (= lt!259607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259607)))))

(assert (=> b!166142 (= lt!259607 ((_ sign_extend 32) (size!3765 (buf!4217 lt!259214))))))

(assert (= (and d!57757 res!138380) b!166141))

(assert (= (and b!166141 res!138381) b!166142))

(declare-fun m!264017 () Bool)

(assert (=> d!57757 m!264017))

(declare-fun m!264019 () Bool)

(assert (=> d!57757 m!264019))

(assert (=> b!165854 d!57757))

(declare-fun d!57759 () Bool)

(assert (=> d!57759 (= (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259298)) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259298)) #b00000000000000000000000000000000 lt!259299) (or (= #b00000000000000000000000000000000 lt!259299) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259298))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259299))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259298))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259299))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14309 () Bool)

(assert (= bs!14309 d!57759))

(declare-fun m!264021 () Bool)

(assert (=> bs!14309 m!264021))

(assert (=> bs!14309 m!263243))

(assert (=> b!165834 d!57759))

(declare-fun d!57761 () Bool)

(assert (=> d!57761 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) (tuple4!243 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165824 d!57761))

(assert (=> b!165852 d!57757))

(declare-fun d!57763 () Bool)

(declare-fun res!138382 () Bool)

(declare-fun e!115025 () Bool)

(assert (=> d!57763 (=> res!138382 e!115025)))

(assert (=> d!57763 (= res!138382 (= (_1!7893 lt!259298) (_2!7893 lt!259298)))))

(assert (=> d!57763 (= (arrayRangesEq!645 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) (_1!7893 lt!259298) (_2!7893 lt!259298)) e!115025)))

(declare-fun b!166143 () Bool)

(declare-fun e!115026 () Bool)

(assert (=> b!166143 (= e!115025 e!115026)))

(declare-fun res!138383 () Bool)

(assert (=> b!166143 (=> (not res!138383) (not e!115026))))

(assert (=> b!166143 (= res!138383 (= (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_1!7893 lt!259298)) (select (arr!4686 (buf!4217 thiss!1577)) (_1!7893 lt!259298))))))

(declare-fun b!166144 () Bool)

(assert (=> b!166144 (= e!115026 (arrayRangesEq!645 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) (bvadd (_1!7893 lt!259298) #b00000000000000000000000000000001) (_2!7893 lt!259298)))))

(assert (= (and d!57763 (not res!138382)) b!166143))

(assert (= (and b!166143 res!138383) b!166144))

(declare-fun m!264023 () Bool)

(assert (=> b!166143 m!264023))

(declare-fun m!264025 () Bool)

(assert (=> b!166143 m!264025))

(declare-fun m!264027 () Bool)

(assert (=> b!166144 m!264027))

(assert (=> b!165833 d!57763))

(assert (=> b!165840 d!57753))

(assert (=> b!165840 d!57733))

(declare-fun b!166145 () Bool)

(declare-fun e!115027 () Bool)

(declare-fun lt!259613 () tuple4!242)

(assert (=> b!166145 (= e!115027 (arrayRangesEq!645 (buf!4217 (_1!7886 lt!259206)) (buf!4217 thiss!1577) (_1!7893 lt!259613) (_2!7893 lt!259613)))))

(declare-fun e!115031 () Bool)

(declare-fun b!166146 () Bool)

(declare-fun lt!259614 () (_ BitVec 32))

(assert (=> b!166146 (= e!115031 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_1!7886 lt!259206))) (_4!121 lt!259613)) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259613)) #b00000000000000000000000000000000 lt!259614))))

(declare-fun b!166147 () Bool)

(declare-fun e!115030 () Bool)

(declare-fun e!115029 () Bool)

(assert (=> b!166147 (= e!115030 e!115029)))

(declare-fun res!138386 () Bool)

(assert (=> b!166147 (=> (not res!138386) (not e!115029))))

(assert (=> b!166147 (= res!138386 e!115027)))

(declare-fun res!138387 () Bool)

(assert (=> b!166147 (=> res!138387 e!115027)))

(assert (=> b!166147 (= res!138387 (bvsge (_1!7893 lt!259613) (_2!7893 lt!259613)))))

(assert (=> b!166147 (= lt!259614 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259612 () (_ BitVec 32))

(assert (=> b!166147 (= lt!259612 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166147 (= lt!259613 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(declare-fun b!166148 () Bool)

(declare-fun res!138385 () Bool)

(assert (=> b!166148 (= res!138385 (= lt!259614 #b00000000000000000000000000000000))))

(assert (=> b!166148 (=> res!138385 e!115031)))

(declare-fun e!115032 () Bool)

(assert (=> b!166148 (= e!115032 e!115031)))

(declare-fun b!166149 () Bool)

(declare-fun e!115028 () Bool)

(declare-fun call!2804 () Bool)

(assert (=> b!166149 (= e!115028 call!2804)))

(declare-fun d!57765 () Bool)

(declare-fun res!138388 () Bool)

(assert (=> d!57765 (=> res!138388 e!115030)))

(assert (=> d!57765 (= res!138388 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(assert (=> d!57765 (= (arrayBitRangesEq!0 (buf!4217 (_1!7886 lt!259206)) (buf!4217 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))) e!115030)))

(declare-fun b!166150 () Bool)

(assert (=> b!166150 (= e!115028 e!115032)))

(declare-fun res!138384 () Bool)

(assert (=> b!166150 (= res!138384 call!2804)))

(assert (=> b!166150 (=> (not res!138384) (not e!115032))))

(declare-fun b!166151 () Bool)

(assert (=> b!166151 (= e!115029 e!115028)))

(declare-fun c!8633 () Bool)

(assert (=> b!166151 (= c!8633 (= (_3!593 lt!259613) (_4!121 lt!259613)))))

(declare-fun bm!2801 () Bool)

(assert (=> bm!2801 (= call!2804 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_1!7886 lt!259206))) (_3!593 lt!259613)) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259613)) lt!259612 (ite c!8633 lt!259614 #b00000000000000000000000000001000)))))

(assert (= (and d!57765 (not res!138388)) b!166147))

(assert (= (and b!166147 (not res!138387)) b!166145))

(assert (= (and b!166147 res!138386) b!166151))

(assert (= (and b!166151 c!8633) b!166149))

(assert (= (and b!166151 (not c!8633)) b!166150))

(assert (= (and b!166150 res!138384) b!166148))

(assert (= (and b!166148 (not res!138385)) b!166146))

(assert (= (or b!166149 b!166150) bm!2801))

(declare-fun m!264029 () Bool)

(assert (=> b!166145 m!264029))

(declare-fun m!264031 () Bool)

(assert (=> b!166146 m!264031))

(declare-fun m!264033 () Bool)

(assert (=> b!166146 m!264033))

(assert (=> b!166146 m!264031))

(assert (=> b!166146 m!264033))

(declare-fun m!264035 () Bool)

(assert (=> b!166146 m!264035))

(assert (=> b!166147 m!263469))

(declare-fun m!264037 () Bool)

(assert (=> b!166147 m!264037))

(declare-fun m!264039 () Bool)

(assert (=> bm!2801 m!264039))

(declare-fun m!264041 () Bool)

(assert (=> bm!2801 m!264041))

(assert (=> bm!2801 m!264039))

(assert (=> bm!2801 m!264041))

(declare-fun m!264043 () Bool)

(assert (=> bm!2801 m!264043))

(assert (=> b!165862 d!57765))

(assert (=> b!165862 d!57753))

(assert (=> d!57485 d!57491))

(declare-fun d!57767 () Bool)

(assert (=> d!57767 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(assert (=> d!57767 true))

(declare-fun _$15!272 () Unit!11520)

(assert (=> d!57767 (= (choose!30 lt!259214 thiss!1577 (_2!7885 lt!258884)) _$15!272)))

(declare-fun bs!14310 () Bool)

(assert (= bs!14310 d!57767))

(assert (=> bs!14310 m!263315))

(assert (=> d!57485 d!57767))

(declare-fun d!57769 () Bool)

(declare-fun res!138391 () Bool)

(declare-fun e!115034 () Bool)

(assert (=> d!57769 (=> (not res!138391) (not e!115034))))

(assert (=> d!57769 (= res!138391 (= (size!3765 (buf!4217 lt!259214)) (size!3765 (buf!4217 thiss!1577))))))

(assert (=> d!57769 (= (isPrefixOf!0 lt!259214 thiss!1577) e!115034)))

(declare-fun b!166152 () Bool)

(declare-fun res!138390 () Bool)

(assert (=> b!166152 (=> (not res!138390) (not e!115034))))

(assert (=> b!166152 (= res!138390 (bvsle (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(declare-fun b!166153 () Bool)

(declare-fun e!115033 () Bool)

(assert (=> b!166153 (= e!115034 e!115033)))

(declare-fun res!138389 () Bool)

(assert (=> b!166153 (=> res!138389 e!115033)))

(assert (=> b!166153 (= res!138389 (= (size!3765 (buf!4217 lt!259214)) #b00000000000000000000000000000000))))

(declare-fun b!166154 () Bool)

(assert (=> b!166154 (= e!115033 (arrayBitRangesEq!0 (buf!4217 lt!259214) (buf!4217 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(assert (= (and d!57769 res!138391) b!166152))

(assert (= (and b!166152 res!138390) b!166153))

(assert (= (and b!166153 (not res!138389)) b!166154))

(assert (=> b!166152 m!263475))

(assert (=> b!166152 m!263121))

(assert (=> b!166154 m!263475))

(assert (=> b!166154 m!263475))

(declare-fun m!264045 () Bool)

(assert (=> b!166154 m!264045))

(assert (=> d!57485 d!57769))

(declare-fun d!57771 () Bool)

(assert (=> d!57771 (= (arrayBitIndices!0 lt!259201 lt!259212) (tuple4!243 ((_ extract 31 0) (bvadd (bvsdiv lt!259201 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!259201 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!259212 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!259201 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!259212 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165835 d!57771))

(declare-fun b!166155 () Bool)

(declare-fun e!115035 () Bool)

(declare-fun lt!259616 () tuple4!242)

(assert (=> b!166155 (= e!115035 (arrayRangesEq!645 (buf!4217 thiss!1577) (buf!4217 thiss!1577) (_1!7893 lt!259616) (_2!7893 lt!259616)))))

(declare-fun lt!259617 () (_ BitVec 32))

(declare-fun e!115039 () Bool)

(declare-fun b!166156 () Bool)

(assert (=> b!166156 (= e!115039 (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259616)) (select (arr!4686 (buf!4217 thiss!1577)) (_4!121 lt!259616)) #b00000000000000000000000000000000 lt!259617))))

(declare-fun b!166157 () Bool)

(declare-fun e!115038 () Bool)

(declare-fun e!115037 () Bool)

(assert (=> b!166157 (= e!115038 e!115037)))

(declare-fun res!138394 () Bool)

(assert (=> b!166157 (=> (not res!138394) (not e!115037))))

(assert (=> b!166157 (= res!138394 e!115035)))

(declare-fun res!138395 () Bool)

(assert (=> b!166157 (=> res!138395 e!115035)))

(assert (=> b!166157 (= res!138395 (bvsge (_1!7893 lt!259616) (_2!7893 lt!259616)))))

(assert (=> b!166157 (= lt!259617 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259615 () (_ BitVec 32))

(assert (=> b!166157 (= lt!259615 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166157 (= lt!259616 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(declare-fun b!166158 () Bool)

(declare-fun res!138393 () Bool)

(assert (=> b!166158 (= res!138393 (= lt!259617 #b00000000000000000000000000000000))))

(assert (=> b!166158 (=> res!138393 e!115039)))

(declare-fun e!115040 () Bool)

(assert (=> b!166158 (= e!115040 e!115039)))

(declare-fun b!166159 () Bool)

(declare-fun e!115036 () Bool)

(declare-fun call!2805 () Bool)

(assert (=> b!166159 (= e!115036 call!2805)))

(declare-fun d!57773 () Bool)

(declare-fun res!138396 () Bool)

(assert (=> d!57773 (=> res!138396 e!115038)))

(assert (=> d!57773 (= res!138396 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))))))

(assert (=> d!57773 (= (arrayBitRangesEq!0 (buf!4217 thiss!1577) (buf!4217 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) (currentBit!7894 thiss!1577))) e!115038)))

(declare-fun b!166160 () Bool)

(assert (=> b!166160 (= e!115036 e!115040)))

(declare-fun res!138392 () Bool)

(assert (=> b!166160 (= res!138392 call!2805)))

(assert (=> b!166160 (=> (not res!138392) (not e!115040))))

(declare-fun b!166161 () Bool)

(assert (=> b!166161 (= e!115037 e!115036)))

(declare-fun c!8634 () Bool)

(assert (=> b!166161 (= c!8634 (= (_3!593 lt!259616) (_4!121 lt!259616)))))

(declare-fun bm!2802 () Bool)

(assert (=> bm!2802 (= call!2805 (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259616)) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259616)) lt!259615 (ite c!8634 lt!259617 #b00000000000000000000000000001000)))))

(assert (= (and d!57773 (not res!138396)) b!166157))

(assert (= (and b!166157 (not res!138395)) b!166155))

(assert (= (and b!166157 res!138394) b!166161))

(assert (= (and b!166161 c!8634) b!166159))

(assert (= (and b!166161 (not c!8634)) b!166160))

(assert (= (and b!166160 res!138392) b!166158))

(assert (= (and b!166158 (not res!138393)) b!166156))

(assert (= (or b!166159 b!166160) bm!2802))

(declare-fun m!264047 () Bool)

(assert (=> b!166155 m!264047))

(declare-fun m!264049 () Bool)

(assert (=> b!166156 m!264049))

(assert (=> b!166156 m!264049))

(assert (=> b!166156 m!264049))

(assert (=> b!166156 m!264049))

(declare-fun m!264051 () Bool)

(assert (=> b!166156 m!264051))

(assert (=> b!166157 m!263121))

(assert (=> b!166157 m!263439))

(declare-fun m!264053 () Bool)

(assert (=> bm!2802 m!264053))

(assert (=> bm!2802 m!264053))

(assert (=> bm!2802 m!264053))

(assert (=> bm!2802 m!264053))

(declare-fun m!264055 () Bool)

(assert (=> bm!2802 m!264055))

(assert (=> b!165851 d!57773))

(assert (=> b!165851 d!57367))

(assert (=> d!57499 d!57493))

(declare-fun d!57775 () Bool)

(assert (=> d!57775 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57775 true))

(declare-fun _$14!303 () Unit!11520)

(assert (=> d!57775 (= (choose!11 thiss!1577) _$14!303)))

(declare-fun bs!14311 () Bool)

(assert (= bs!14311 d!57775))

(assert (=> bs!14311 m!263309))

(assert (=> d!57499 d!57775))

(declare-fun d!57777 () Bool)

(declare-fun res!138397 () Bool)

(declare-fun e!115041 () Bool)

(assert (=> d!57777 (=> res!138397 e!115041)))

(assert (=> d!57777 (= res!138397 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (=> d!57777 (= (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)) e!115041)))

(declare-fun b!166162 () Bool)

(declare-fun e!115042 () Bool)

(assert (=> b!166162 (= e!115041 e!115042)))

(declare-fun res!138398 () Bool)

(assert (=> b!166162 (=> (not res!138398) (not e!115042))))

(assert (=> b!166162 (= res!138398 (= (select (arr!4686 (buf!4217 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4686 (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!166163 () Bool)

(assert (=> b!166163 (= e!115042 (arrayRangesEq!645 (buf!4217 thiss!1577) (array!8435 (store (arr!4686 (buf!4217 thiss!1577)) (currentByte!7899 thiss!1577) lt!258886) (size!3765 (buf!4217 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (= (and d!57777 (not res!138397)) b!166162))

(assert (= (and b!166162 res!138398) b!166163))

(assert (=> b!166162 m!263497))

(declare-fun m!264057 () Bool)

(assert (=> b!166162 m!264057))

(declare-fun m!264059 () Bool)

(assert (=> b!166163 m!264059))

(assert (=> b!165807 d!57777))

(assert (=> d!57495 d!57491))

(declare-fun d!57779 () Bool)

(assert (=> d!57779 (isPrefixOf!0 lt!259214 (_2!7885 lt!258884))))

(assert (=> d!57779 true))

(declare-fun _$15!273 () Unit!11520)

(assert (=> d!57779 (= (choose!30 lt!259214 (_2!7885 lt!258884) (_2!7885 lt!258884)) _$15!273)))

(declare-fun bs!14312 () Bool)

(assert (= bs!14312 d!57779))

(assert (=> bs!14312 m!263315))

(assert (=> d!57495 d!57779))

(declare-fun d!57781 () Bool)

(assert (=> d!57781 (= (byteRangesEq!0 (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259289)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259289)) lt!259288 (ite c!8604 lt!259290 #b00000000000000000000000000001000)) (or (= lt!259288 (ite c!8604 lt!259290 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259289))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8604 lt!259290 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259288)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259289))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8604 lt!259290 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259288)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14313 () Bool)

(assert (= bs!14313 d!57781))

(declare-fun m!264061 () Bool)

(assert (=> bs!14313 m!264061))

(declare-fun m!264063 () Bool)

(assert (=> bs!14313 m!264063))

(assert (=> bm!2778 d!57781))

(declare-fun b!166164 () Bool)

(declare-fun e!115043 () Bool)

(declare-fun lt!259619 () tuple4!242)

(assert (=> b!166164 (= e!115043 (arrayRangesEq!645 (buf!4217 (_1!7886 lt!259206)) (buf!4217 (_2!7886 lt!259206)) (_1!7893 lt!259619) (_2!7893 lt!259619)))))

(declare-fun b!166165 () Bool)

(declare-fun e!115047 () Bool)

(declare-fun lt!259620 () (_ BitVec 32))

(assert (=> b!166165 (= e!115047 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_1!7886 lt!259206))) (_4!121 lt!259619)) (select (arr!4686 (buf!4217 (_2!7886 lt!259206))) (_4!121 lt!259619)) #b00000000000000000000000000000000 lt!259620))))

(declare-fun b!166166 () Bool)

(declare-fun e!115046 () Bool)

(declare-fun e!115045 () Bool)

(assert (=> b!166166 (= e!115046 e!115045)))

(declare-fun res!138401 () Bool)

(assert (=> b!166166 (=> (not res!138401) (not e!115045))))

(assert (=> b!166166 (= res!138401 e!115043)))

(declare-fun res!138402 () Bool)

(assert (=> b!166166 (=> res!138402 e!115043)))

(assert (=> b!166166 (= res!138402 (bvsge (_1!7893 lt!259619) (_2!7893 lt!259619)))))

(assert (=> b!166166 (= lt!259620 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259618 () (_ BitVec 32))

(assert (=> b!166166 (= lt!259618 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166166 (= lt!259619 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(declare-fun b!166167 () Bool)

(declare-fun res!138400 () Bool)

(assert (=> b!166167 (= res!138400 (= lt!259620 #b00000000000000000000000000000000))))

(assert (=> b!166167 (=> res!138400 e!115047)))

(declare-fun e!115048 () Bool)

(assert (=> b!166167 (= e!115048 e!115047)))

(declare-fun b!166168 () Bool)

(declare-fun e!115044 () Bool)

(declare-fun call!2806 () Bool)

(assert (=> b!166168 (= e!115044 call!2806)))

(declare-fun d!57783 () Bool)

(declare-fun res!138403 () Bool)

(assert (=> d!57783 (=> res!138403 e!115046)))

(assert (=> d!57783 (= res!138403 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))))))

(assert (=> d!57783 (= (arrayBitRangesEq!0 (buf!4217 (_1!7886 lt!259206)) (buf!4217 (_2!7886 lt!259206)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 (_1!7886 lt!259206))) (currentByte!7899 (_1!7886 lt!259206)) (currentBit!7894 (_1!7886 lt!259206)))) e!115046)))

(declare-fun b!166169 () Bool)

(assert (=> b!166169 (= e!115044 e!115048)))

(declare-fun res!138399 () Bool)

(assert (=> b!166169 (= res!138399 call!2806)))

(assert (=> b!166169 (=> (not res!138399) (not e!115048))))

(declare-fun b!166170 () Bool)

(assert (=> b!166170 (= e!115045 e!115044)))

(declare-fun c!8635 () Bool)

(assert (=> b!166170 (= c!8635 (= (_3!593 lt!259619) (_4!121 lt!259619)))))

(declare-fun bm!2803 () Bool)

(assert (=> bm!2803 (= call!2806 (byteRangesEq!0 (select (arr!4686 (buf!4217 (_1!7886 lt!259206))) (_3!593 lt!259619)) (select (arr!4686 (buf!4217 (_2!7886 lt!259206))) (_3!593 lt!259619)) lt!259618 (ite c!8635 lt!259620 #b00000000000000000000000000001000)))))

(assert (= (and d!57783 (not res!138403)) b!166166))

(assert (= (and b!166166 (not res!138402)) b!166164))

(assert (= (and b!166166 res!138401) b!166170))

(assert (= (and b!166170 c!8635) b!166168))

(assert (= (and b!166170 (not c!8635)) b!166169))

(assert (= (and b!166169 res!138399) b!166167))

(assert (= (and b!166167 (not res!138400)) b!166165))

(assert (= (or b!166168 b!166169) bm!2803))

(declare-fun m!264065 () Bool)

(assert (=> b!166164 m!264065))

(declare-fun m!264067 () Bool)

(assert (=> b!166165 m!264067))

(declare-fun m!264069 () Bool)

(assert (=> b!166165 m!264069))

(assert (=> b!166165 m!264067))

(assert (=> b!166165 m!264069))

(declare-fun m!264071 () Bool)

(assert (=> b!166165 m!264071))

(assert (=> b!166166 m!263469))

(assert (=> b!166166 m!264037))

(declare-fun m!264073 () Bool)

(assert (=> bm!2803 m!264073))

(declare-fun m!264075 () Bool)

(assert (=> bm!2803 m!264075))

(assert (=> bm!2803 m!264073))

(assert (=> bm!2803 m!264075))

(declare-fun m!264077 () Bool)

(assert (=> bm!2803 m!264077))

(assert (=> b!165842 d!57783))

(assert (=> b!165842 d!57753))

(declare-fun d!57785 () Bool)

(assert (=> d!57785 (= (remainingBits!0 ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!259139)))) ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!259139))) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!259139)))) (bvsub (bvmul ((_ sign_extend 32) (size!3765 (buf!4217 (_2!7885 lt!259139)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7899 (_2!7885 lt!259139))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7894 (_2!7885 lt!259139))))))))

(assert (=> d!57519 d!57785))

(declare-fun d!57787 () Bool)

(assert (=> d!57787 (= (invariant!0 (currentBit!7894 (_2!7885 lt!259139)) (currentByte!7899 (_2!7885 lt!259139)) (size!3765 (buf!4217 (_2!7885 lt!259139)))) (and (bvsge (currentBit!7894 (_2!7885 lt!259139)) #b00000000000000000000000000000000) (bvslt (currentBit!7894 (_2!7885 lt!259139)) #b00000000000000000000000000001000) (bvsge (currentByte!7899 (_2!7885 lt!259139)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7899 (_2!7885 lt!259139)) (size!3765 (buf!4217 (_2!7885 lt!259139)))) (and (= (currentBit!7894 (_2!7885 lt!259139)) #b00000000000000000000000000000000) (= (currentByte!7899 (_2!7885 lt!259139)) (size!3765 (buf!4217 (_2!7885 lt!259139))))))))))

(assert (=> d!57519 d!57787))

(declare-fun d!57789 () Bool)

(declare-fun res!138404 () Bool)

(declare-fun e!115049 () Bool)

(assert (=> d!57789 (=> res!138404 e!115049)))

(assert (=> d!57789 (= res!138404 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (=> d!57789 (= (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)) e!115049)))

(declare-fun b!166171 () Bool)

(declare-fun e!115050 () Bool)

(assert (=> b!166171 (= e!115049 e!115050)))

(declare-fun res!138405 () Bool)

(assert (=> b!166171 (=> (not res!138405) (not e!115050))))

(assert (=> b!166171 (= res!138405 (= (select (arr!4686 (buf!4217 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4686 lt!258889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!166172 () Bool)

(assert (=> b!166172 (= e!115050 (arrayRangesEq!645 (buf!4217 thiss!1577) lt!258889 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7899 thiss!1577)))))

(assert (= (and d!57789 (not res!138404)) b!166171))

(assert (= (and b!166171 res!138405) b!166172))

(declare-fun m!264079 () Bool)

(assert (=> b!166171 m!264079))

(declare-fun m!264081 () Bool)

(assert (=> b!166171 m!264081))

(declare-fun m!264083 () Bool)

(assert (=> b!166172 m!264083))

(assert (=> b!165859 d!57789))

(assert (=> d!57501 d!57503))

(declare-fun d!57791 () Bool)

(assert (=> d!57791 (isPrefixOf!0 lt!259214 lt!259214)))

(assert (=> d!57791 true))

(declare-fun _$14!304 () Unit!11520)

(assert (=> d!57791 (= (choose!11 lt!259214) _$14!304)))

(declare-fun bs!14314 () Bool)

(assert (= bs!14314 d!57791))

(assert (=> bs!14314 m!263297))

(assert (=> d!57501 d!57791))

(assert (=> d!57507 d!57471))

(declare-fun d!57793 () Bool)

(assert (=> d!57793 (= (byteRangesEq!0 (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259298)) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259298)) lt!259297 (ite c!8605 lt!259299 #b00000000000000000000000000001000)) (or (= lt!259297 (ite c!8605 lt!259299 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259298))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8605 lt!259299 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259297)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4686 (buf!4217 thiss!1577)) (_3!593 lt!259298))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8605 lt!259299 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259297)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14315 () Bool)

(assert (= bs!14315 d!57793))

(declare-fun m!264085 () Bool)

(assert (=> bs!14315 m!264085))

(declare-fun m!264087 () Bool)

(assert (=> bs!14315 m!264087))

(assert (=> bm!2779 d!57793))

(assert (=> b!165846 d!57757))

(assert (=> b!165846 d!57359))

(assert (=> d!57481 d!57483))

(declare-fun d!57795 () Bool)

(assert (=> d!57795 (arrayBitRangesEq!0 (buf!4217 (_2!7885 lt!258884)) (buf!4217 thiss!1577) lt!259201 lt!259212)))

(assert (=> d!57795 true))

(declare-fun _$19!141 () Unit!11520)

(assert (=> d!57795 (= (choose!8 (buf!4217 thiss!1577) (buf!4217 (_2!7885 lt!258884)) lt!259201 lt!259212) _$19!141)))

(declare-fun bs!14316 () Bool)

(assert (= bs!14316 d!57795))

(assert (=> bs!14316 m!263321))

(assert (=> d!57481 d!57795))

(declare-fun e!115051 () Bool)

(declare-fun b!166173 () Bool)

(declare-fun lt!259622 () tuple4!242)

(assert (=> b!166173 (= e!115051 (arrayRangesEq!645 (buf!4217 lt!259214) (buf!4217 (_2!7885 lt!258884)) (_1!7893 lt!259622) (_2!7893 lt!259622)))))

(declare-fun e!115055 () Bool)

(declare-fun lt!259623 () (_ BitVec 32))

(declare-fun b!166174 () Bool)

(assert (=> b!166174 (= e!115055 (byteRangesEq!0 (select (arr!4686 (buf!4217 lt!259214)) (_4!121 lt!259622)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_4!121 lt!259622)) #b00000000000000000000000000000000 lt!259623))))

(declare-fun b!166175 () Bool)

(declare-fun e!115054 () Bool)

(declare-fun e!115053 () Bool)

(assert (=> b!166175 (= e!115054 e!115053)))

(declare-fun res!138408 () Bool)

(assert (=> b!166175 (=> (not res!138408) (not e!115053))))

(assert (=> b!166175 (= res!138408 e!115051)))

(declare-fun res!138409 () Bool)

(assert (=> b!166175 (=> res!138409 e!115051)))

(assert (=> b!166175 (= res!138409 (bvsge (_1!7893 lt!259622) (_2!7893 lt!259622)))))

(assert (=> b!166175 (= lt!259623 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259621 () (_ BitVec 32))

(assert (=> b!166175 (= lt!259621 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166175 (= lt!259622 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(declare-fun b!166176 () Bool)

(declare-fun res!138407 () Bool)

(assert (=> b!166176 (= res!138407 (= lt!259623 #b00000000000000000000000000000000))))

(assert (=> b!166176 (=> res!138407 e!115055)))

(declare-fun e!115056 () Bool)

(assert (=> b!166176 (= e!115056 e!115055)))

(declare-fun b!166177 () Bool)

(declare-fun e!115052 () Bool)

(declare-fun call!2807 () Bool)

(assert (=> b!166177 (= e!115052 call!2807)))

(declare-fun d!57797 () Bool)

(declare-fun res!138410 () Bool)

(assert (=> d!57797 (=> res!138410 e!115054)))

(assert (=> d!57797 (= res!138410 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))))))

(assert (=> d!57797 (= (arrayBitRangesEq!0 (buf!4217 lt!259214) (buf!4217 (_2!7885 lt!258884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3765 (buf!4217 lt!259214)) (currentByte!7899 lt!259214) (currentBit!7894 lt!259214))) e!115054)))

(declare-fun b!166178 () Bool)

(assert (=> b!166178 (= e!115052 e!115056)))

(declare-fun res!138406 () Bool)

(assert (=> b!166178 (= res!138406 call!2807)))

(assert (=> b!166178 (=> (not res!138406) (not e!115056))))

(declare-fun b!166179 () Bool)

(assert (=> b!166179 (= e!115053 e!115052)))

(declare-fun c!8636 () Bool)

(assert (=> b!166179 (= c!8636 (= (_3!593 lt!259622) (_4!121 lt!259622)))))

(declare-fun bm!2804 () Bool)

(assert (=> bm!2804 (= call!2807 (byteRangesEq!0 (select (arr!4686 (buf!4217 lt!259214)) (_3!593 lt!259622)) (select (arr!4686 (buf!4217 (_2!7885 lt!258884))) (_3!593 lt!259622)) lt!259621 (ite c!8636 lt!259623 #b00000000000000000000000000001000)))))

(assert (= (and d!57797 (not res!138410)) b!166175))

(assert (= (and b!166175 (not res!138409)) b!166173))

(assert (= (and b!166175 res!138408) b!166179))

(assert (= (and b!166179 c!8636) b!166177))

(assert (= (and b!166179 (not c!8636)) b!166178))

(assert (= (and b!166178 res!138406) b!166176))

(assert (= (and b!166176 (not res!138407)) b!166174))

(assert (= (or b!166177 b!166178) bm!2804))

(declare-fun m!264089 () Bool)

(assert (=> b!166173 m!264089))

(declare-fun m!264091 () Bool)

(assert (=> b!166174 m!264091))

(declare-fun m!264093 () Bool)

(assert (=> b!166174 m!264093))

(assert (=> b!166174 m!264091))

(assert (=> b!166174 m!264093))

(declare-fun m!264095 () Bool)

(assert (=> b!166174 m!264095))

(assert (=> b!166175 m!263475))

(assert (=> b!166175 m!264011))

(declare-fun m!264097 () Bool)

(assert (=> bm!2804 m!264097))

(declare-fun m!264099 () Bool)

(assert (=> bm!2804 m!264099))

(assert (=> bm!2804 m!264097))

(assert (=> bm!2804 m!264099))

(declare-fun m!264101 () Bool)

(assert (=> bm!2804 m!264101))

(assert (=> b!165848 d!57797))

(assert (=> b!165848 d!57757))

(push 1)

(assert (not d!57779))

(assert (not d!57753))

(assert (not b!166155))

(assert (not bm!2802))

(assert (not d!57729))

(assert (not b!166127))

(assert (not b!166111))

(assert (not b!166144))

(assert (not b!166147))

(assert (not b!166175))

(assert (not b!166164))

(assert (not bm!2798))

(assert (not b!166113))

(assert (not b!166165))

(assert (not d!57731))

(assert (not bm!2801))

(assert (not d!57727))

(assert (not d!57795))

(assert (not bm!2799))

(assert (not d!57791))

(assert (not b!166157))

(assert (not bm!2803))

(assert (not b!166146))

(assert (not b!166166))

(assert (not bm!2800))

(assert (not b!166172))

(assert (not b!166174))

(assert (not d!57725))

(assert (not d!57741))

(assert (not b!166152))

(assert (not b!166154))

(assert (not b!166129))

(assert (not b!166118))

(assert (not b!166163))

(assert (not d!57767))

(assert (not b!166173))

(assert (not b!166131))

(assert (not b!166119))

(assert (not d!57757))

(assert (not b!166120))

(assert (not b!166135))

(assert (not b!166156))

(assert (not d!57743))

(assert (not d!57775))

(assert (not b!166145))

(assert (not d!57733))

(assert (not bm!2804))

(assert (not b!166107))

(assert (not b!166136))

(assert (not b!166134))

(assert (not b!166112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

