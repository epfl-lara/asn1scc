; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37196 () Bool)

(assert start!37196)

(declare-fun res!140592 () Bool)

(declare-fun e!117561 () Bool)

(assert (=> start!37196 (=> (not res!140592) (not e!117561))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37196 (= res!140592 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37196 e!117561))

(assert (=> start!37196 true))

(declare-datatypes ((array!8893 0))(
  ( (array!8894 (arr!4857 (Array (_ BitVec 32) (_ BitVec 8))) (size!3936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7028 0))(
  ( (BitStream!7029 (buf!4388 array!8893) (currentByte!8366 (_ BitVec 32)) (currentBit!8361 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7028)

(declare-fun e!117562 () Bool)

(declare-fun inv!12 (BitStream!7028) Bool)

(assert (=> start!37196 (and (inv!12 thiss!1894) e!117562)))

(declare-fun b!169054 () Bool)

(declare-datatypes ((Unit!11792 0))(
  ( (Unit!11793) )
))
(declare-datatypes ((tuple3!976 0))(
  ( (tuple3!977 (_1!7943 Unit!11792) (_2!7943 (_ BitVec 8)) (_3!614 BitStream!7028)) )
))
(declare-fun lt!262056 () tuple3!976)

(declare-fun e!117563 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!169054 (= e!117563 (not (= (bitIndex!0 (size!3936 (buf!4388 (_3!614 lt!262056))) (currentByte!8366 (_3!614 lt!262056)) (currentBit!8361 (_3!614 lt!262056))) (bvadd (bitIndex!0 (size!3936 (buf!4388 thiss!1894)) (currentByte!8366 thiss!1894) (currentBit!8361 thiss!1894)) ((_ sign_extend 32) nBits!600)))))))

(declare-fun b!169055 () Bool)

(declare-fun array_inv!3677 (array!8893) Bool)

(assert (=> b!169055 (= e!117562 (array_inv!3677 (buf!4388 thiss!1894)))))

(declare-fun e!117560 () tuple3!976)

(declare-datatypes ((tuple2!14658 0))(
  ( (tuple2!14659 (_1!7944 Unit!11792) (_2!7944 BitStream!7028)) )
))
(declare-fun lt!262057 () tuple2!14658)

(declare-fun b!169056 () Bool)

(assert (=> b!169056 (= e!117560 (tuple3!977 (_1!7944 lt!262057) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4857 (buf!4388 thiss!1894)) (currentByte!8366 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8361 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7944 lt!262057)))))

(declare-fun moveBitIndex!0 (BitStream!7028 (_ BitVec 64)) tuple2!14658)

(assert (=> b!169056 (= lt!262057 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!169057 () Bool)

(declare-fun res!140594 () Bool)

(assert (=> b!169057 (=> (not res!140594) (not e!117561))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169057 (= res!140594 (validate_offset_bits!1 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))) ((_ sign_extend 32) (currentByte!8366 thiss!1894)) ((_ sign_extend 32) (currentBit!8361 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!169058 () Bool)

(assert (=> b!169058 (= e!117561 e!117563)))

(declare-fun res!140593 () Bool)

(assert (=> b!169058 (=> res!140593 e!117563)))

(assert (=> b!169058 (= res!140593 (not (= (buf!4388 (_3!614 lt!262056)) (buf!4388 thiss!1894))))))

(assert (=> b!169058 (= lt!262056 e!117560)))

(declare-fun c!8723 () Bool)

(assert (=> b!169058 (= c!8723 (bvsle (bvadd (currentBit!8361 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun lt!262055 () (_ BitVec 32))

(declare-fun b!169059 () Bool)

(declare-fun Unit!11794 () Unit!11792)

(assert (=> b!169059 (= e!117560 (tuple3!977 Unit!11794 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4857 (buf!4388 thiss!1894)) (currentByte!8366 thiss!1894))) lt!262055))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4857 (buf!4388 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8366 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!262055))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7029 (buf!4388 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8366 thiss!1894)) lt!262055)))))

(assert (=> b!169059 (= lt!262055 (bvsub (bvadd (currentBit!8361 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(assert (= (and start!37196 res!140592) b!169057))

(assert (= (and b!169057 res!140594) b!169058))

(assert (= (and b!169058 c!8723) b!169056))

(assert (= (and b!169058 (not c!8723)) b!169059))

(assert (= (and b!169058 (not res!140593)) b!169054))

(assert (= start!37196 b!169055))

(declare-fun m!268617 () Bool)

(assert (=> b!169057 m!268617))

(declare-fun m!268619 () Bool)

(assert (=> b!169055 m!268619))

(declare-fun m!268621 () Bool)

(assert (=> b!169056 m!268621))

(declare-fun m!268623 () Bool)

(assert (=> b!169056 m!268623))

(declare-fun m!268625 () Bool)

(assert (=> b!169056 m!268625))

(declare-fun m!268627 () Bool)

(assert (=> start!37196 m!268627))

(declare-fun m!268629 () Bool)

(assert (=> b!169054 m!268629))

(declare-fun m!268631 () Bool)

(assert (=> b!169054 m!268631))

(assert (=> b!169059 m!268621))

(declare-fun m!268633 () Bool)

(assert (=> b!169059 m!268633))

(assert (=> b!169059 m!268623))

(push 1)

(assert (not b!169057))

(assert (not b!169055))

(assert (not b!169054))

(assert (not b!169056))

(assert (not start!37196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59775 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59775 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))) ((_ sign_extend 32) (currentByte!8366 thiss!1894)) ((_ sign_extend 32) (currentBit!8361 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))) ((_ sign_extend 32) (currentByte!8366 thiss!1894)) ((_ sign_extend 32) (currentBit!8361 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14822 () Bool)

(assert (= bs!14822 d!59775))

(declare-fun m!268643 () Bool)

(assert (=> bs!14822 m!268643))

(assert (=> b!169057 d!59775))

(declare-fun d!59777 () Bool)

(declare-fun lt!262157 () (_ BitVec 32))

(assert (=> d!59777 (= lt!262157 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!262154 () (_ BitVec 32))

(assert (=> d!59777 (= lt!262154 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117590 () Bool)

(assert (=> d!59777 e!117590))

(declare-fun res!140628 () Bool)

(assert (=> d!59777 (=> (not res!140628) (not e!117590))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7028 (_ BitVec 64)) Bool)

(assert (=> d!59777 (= res!140628 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11807 () Unit!11792)

(declare-fun Unit!11808 () Unit!11792)

(declare-fun Unit!11809 () Unit!11792)

(assert (=> d!59777 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8361 thiss!1894) lt!262157) #b00000000000000000000000000000000) (tuple2!14659 Unit!11807 (BitStream!7029 (buf!4388 thiss!1894) (bvsub (bvadd (currentByte!8366 thiss!1894) lt!262154) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262157 (currentBit!8361 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8361 thiss!1894) lt!262157) #b00000000000000000000000000001000) (tuple2!14659 Unit!11808 (BitStream!7029 (buf!4388 thiss!1894) (bvadd (currentByte!8366 thiss!1894) lt!262154 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8361 thiss!1894) lt!262157) #b00000000000000000000000000001000))) (tuple2!14659 Unit!11809 (BitStream!7029 (buf!4388 thiss!1894) (bvadd (currentByte!8366 thiss!1894) lt!262154) (bvadd (currentBit!8361 thiss!1894) lt!262157))))))))

(declare-fun b!169092 () Bool)

(declare-fun e!117589 () Bool)

(assert (=> b!169092 (= e!117590 e!117589)))

(declare-fun res!140627 () Bool)

(assert (=> b!169092 (=> (not res!140627) (not e!117589))))

(declare-fun lt!262158 () (_ BitVec 64))

(declare-fun lt!262155 () tuple2!14658)

(assert (=> b!169092 (= res!140627 (= (bvadd lt!262158 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3936 (buf!4388 (_2!7944 lt!262155))) (currentByte!8366 (_2!7944 lt!262155)) (currentBit!8361 (_2!7944 lt!262155)))))))

(assert (=> b!169092 (or (not (= (bvand lt!262158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!262158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!262158 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!169092 (= lt!262158 (bitIndex!0 (size!3936 (buf!4388 thiss!1894)) (currentByte!8366 thiss!1894) (currentBit!8361 thiss!1894)))))

(declare-fun lt!262156 () (_ BitVec 32))

(declare-fun lt!262159 () (_ BitVec 32))

(declare-fun Unit!11810 () Unit!11792)

(declare-fun Unit!11811 () Unit!11792)

(declare-fun Unit!11812 () Unit!11792)

(assert (=> b!169092 (= lt!262155 (ite (bvslt (bvadd (currentBit!8361 thiss!1894) lt!262156) #b00000000000000000000000000000000) (tuple2!14659 Unit!11810 (BitStream!7029 (buf!4388 thiss!1894) (bvsub (bvadd (currentByte!8366 thiss!1894) lt!262159) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262156 (currentBit!8361 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8361 thiss!1894) lt!262156) #b00000000000000000000000000001000) (tuple2!14659 Unit!11811 (BitStream!7029 (buf!4388 thiss!1894) (bvadd (currentByte!8366 thiss!1894) lt!262159 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8361 thiss!1894) lt!262156) #b00000000000000000000000000001000))) (tuple2!14659 Unit!11812 (BitStream!7029 (buf!4388 thiss!1894) (bvadd (currentByte!8366 thiss!1894) lt!262159) (bvadd (currentBit!8361 thiss!1894) lt!262156))))))))

(assert (=> b!169092 (= lt!262156 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169092 (= lt!262159 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!169093 () Bool)

(assert (=> b!169093 (= e!117589 (and (= (size!3936 (buf!4388 thiss!1894)) (size!3936 (buf!4388 (_2!7944 lt!262155)))) (= (buf!4388 thiss!1894) (buf!4388 (_2!7944 lt!262155)))))))

(assert (= (and d!59777 res!140628) b!169092))

(assert (= (and b!169092 res!140627) b!169093))

(declare-fun m!268661 () Bool)

(assert (=> d!59777 m!268661))

(declare-fun m!268663 () Bool)

(assert (=> b!169092 m!268663))

(assert (=> b!169092 m!268631))

(assert (=> b!169056 d!59777))

(declare-fun d!59791 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59791 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8361 thiss!1894) (currentByte!8366 thiss!1894) (size!3936 (buf!4388 thiss!1894))))))

(declare-fun bs!14825 () Bool)

(assert (= bs!14825 d!59791))

(declare-fun m!268665 () Bool)

(assert (=> bs!14825 m!268665))

(assert (=> start!37196 d!59791))

(declare-fun d!59793 () Bool)

(assert (=> d!59793 (= (array_inv!3677 (buf!4388 thiss!1894)) (bvsge (size!3936 (buf!4388 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!169055 d!59793))

(declare-fun d!59795 () Bool)

(declare-fun e!117593 () Bool)

(assert (=> d!59795 e!117593))

(declare-fun res!140633 () Bool)

(assert (=> d!59795 (=> (not res!140633) (not e!117593))))

(declare-fun lt!262174 () (_ BitVec 64))

(declare-fun lt!262176 () (_ BitVec 64))

(declare-fun lt!262172 () (_ BitVec 64))

(assert (=> d!59795 (= res!140633 (= lt!262174 (bvsub lt!262172 lt!262176)))))

(assert (=> d!59795 (or (= (bvand lt!262172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262172 lt!262176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59795 (= lt!262176 (remainingBits!0 ((_ sign_extend 32) (size!3936 (buf!4388 (_3!614 lt!262056)))) ((_ sign_extend 32) (currentByte!8366 (_3!614 lt!262056))) ((_ sign_extend 32) (currentBit!8361 (_3!614 lt!262056)))))))

(declare-fun lt!262173 () (_ BitVec 64))

(declare-fun lt!262177 () (_ BitVec 64))

(assert (=> d!59795 (= lt!262172 (bvmul lt!262173 lt!262177))))

(assert (=> d!59795 (or (= lt!262173 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262177 (bvsdiv (bvmul lt!262173 lt!262177) lt!262173)))))

(assert (=> d!59795 (= lt!262177 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59795 (= lt!262173 ((_ sign_extend 32) (size!3936 (buf!4388 (_3!614 lt!262056)))))))

(assert (=> d!59795 (= lt!262174 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8366 (_3!614 lt!262056))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8361 (_3!614 lt!262056)))))))

(assert (=> d!59795 (invariant!0 (currentBit!8361 (_3!614 lt!262056)) (currentByte!8366 (_3!614 lt!262056)) (size!3936 (buf!4388 (_3!614 lt!262056))))))

(assert (=> d!59795 (= (bitIndex!0 (size!3936 (buf!4388 (_3!614 lt!262056))) (currentByte!8366 (_3!614 lt!262056)) (currentBit!8361 (_3!614 lt!262056))) lt!262174)))

(declare-fun b!169098 () Bool)

(declare-fun res!140634 () Bool)

(assert (=> b!169098 (=> (not res!140634) (not e!117593))))

(assert (=> b!169098 (= res!140634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262174))))

(declare-fun b!169099 () Bool)

(declare-fun lt!262175 () (_ BitVec 64))

(assert (=> b!169099 (= e!117593 (bvsle lt!262174 (bvmul lt!262175 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169099 (or (= lt!262175 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262175 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262175)))))

(assert (=> b!169099 (= lt!262175 ((_ sign_extend 32) (size!3936 (buf!4388 (_3!614 lt!262056)))))))

(assert (= (and d!59795 res!140633) b!169098))

(assert (= (and b!169098 res!140634) b!169099))

(declare-fun m!268667 () Bool)

(assert (=> d!59795 m!268667))

(declare-fun m!268669 () Bool)

(assert (=> d!59795 m!268669))

(assert (=> b!169054 d!59795))

(declare-fun d!59797 () Bool)

(declare-fun e!117594 () Bool)

(assert (=> d!59797 e!117594))

(declare-fun res!140635 () Bool)

(assert (=> d!59797 (=> (not res!140635) (not e!117594))))

(declare-fun lt!262180 () (_ BitVec 64))

(declare-fun lt!262182 () (_ BitVec 64))

(declare-fun lt!262178 () (_ BitVec 64))

(assert (=> d!59797 (= res!140635 (= lt!262180 (bvsub lt!262178 lt!262182)))))

(assert (=> d!59797 (or (= (bvand lt!262178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262178 lt!262182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59797 (= lt!262182 (remainingBits!0 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))) ((_ sign_extend 32) (currentByte!8366 thiss!1894)) ((_ sign_extend 32) (currentBit!8361 thiss!1894))))))

(declare-fun lt!262179 () (_ BitVec 64))

(declare-fun lt!262183 () (_ BitVec 64))

(assert (=> d!59797 (= lt!262178 (bvmul lt!262179 lt!262183))))

(assert (=> d!59797 (or (= lt!262179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262183 (bvsdiv (bvmul lt!262179 lt!262183) lt!262179)))))

(assert (=> d!59797 (= lt!262183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59797 (= lt!262179 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))))))

(assert (=> d!59797 (= lt!262180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8366 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8361 thiss!1894))))))

(assert (=> d!59797 (invariant!0 (currentBit!8361 thiss!1894) (currentByte!8366 thiss!1894) (size!3936 (buf!4388 thiss!1894)))))

(assert (=> d!59797 (= (bitIndex!0 (size!3936 (buf!4388 thiss!1894)) (currentByte!8366 thiss!1894) (currentBit!8361 thiss!1894)) lt!262180)))

(declare-fun b!169100 () Bool)

(declare-fun res!140636 () Bool)

(assert (=> b!169100 (=> (not res!140636) (not e!117594))))

(assert (=> b!169100 (= res!140636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262180))))

(declare-fun b!169101 () Bool)

(declare-fun lt!262181 () (_ BitVec 64))

(assert (=> b!169101 (= e!117594 (bvsle lt!262180 (bvmul lt!262181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169101 (or (= lt!262181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262181)))))

(assert (=> b!169101 (= lt!262181 ((_ sign_extend 32) (size!3936 (buf!4388 thiss!1894))))))

(assert (= (and d!59797 res!140635) b!169100))

(assert (= (and b!169100 res!140636) b!169101))

(assert (=> d!59797 m!268643))

(assert (=> d!59797 m!268665))

(assert (=> b!169054 d!59797))

(push 1)

(assert (not d!59777))

(assert (not d!59775))

(assert (not d!59795))

(assert (not b!169092))

(assert (not d!59797))

(assert (not d!59791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

