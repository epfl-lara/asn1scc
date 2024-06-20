; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63278 () Bool)

(assert start!63278)

(declare-fun res!235025 () Bool)

(declare-fun e!202438 () Bool)

(assert (=> start!63278 (=> (not res!235025) (not e!202438))))

(declare-datatypes ((array!16449 0))(
  ( (array!16450 (arr!8102 (Array (_ BitVec 32) (_ BitVec 8))) (size!7106 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12582 0))(
  ( (BitStream!12583 (buf!7352 array!16449) (currentByte!13618 (_ BitVec 32)) (currentBit!13613 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12582)

(assert (=> start!63278 (= res!235025 (and (bvsle ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13618 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13613 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13618 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13613 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63278 e!202438))

(declare-fun e!202439 () Bool)

(declare-fun inv!12 (BitStream!12582) Bool)

(assert (=> start!63278 (and (inv!12 thiss!1939) e!202439)))

(declare-fun b!283559 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283559 (= e!202438 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13613 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13618 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939)))))))))

(declare-fun b!283560 () Bool)

(declare-fun array_inv!6799 (array!16449) Bool)

(assert (=> b!283560 (= e!202439 (array_inv!6799 (buf!7352 thiss!1939)))))

(assert (= (and start!63278 res!235025) b!283559))

(assert (= start!63278 b!283560))

(declare-fun m!416587 () Bool)

(assert (=> start!63278 m!416587))

(declare-fun m!416589 () Bool)

(assert (=> b!283559 m!416589))

(declare-fun m!416591 () Bool)

(assert (=> b!283560 m!416591))

(check-sat (not b!283560) (not start!63278) (not b!283559))
(check-sat)
(get-model)

(declare-fun d!97278 () Bool)

(assert (=> d!97278 (= (array_inv!6799 (buf!7352 thiss!1939)) (bvsge (size!7106 (buf!7352 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283560 d!97278))

(declare-fun d!97280 () Bool)

(assert (=> d!97280 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13613 thiss!1939) (currentByte!13618 thiss!1939) (size!7106 (buf!7352 thiss!1939))))))

(declare-fun bs!24543 () Bool)

(assert (= bs!24543 d!97280))

(declare-fun m!416599 () Bool)

(assert (=> bs!24543 m!416599))

(assert (=> start!63278 d!97280))

(declare-fun d!97282 () Bool)

(assert (=> d!97282 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13613 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13618 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13613 thiss!1939))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13613 thiss!1939))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13618 thiss!1939))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13618 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13613 thiss!1939))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13618 thiss!1939))) ((_ extract 31 0) ((_ sign_extend 32) (size!7106 (buf!7352 thiss!1939)))))))))))

(assert (=> b!283559 d!97282))

(check-sat (not d!97280))
(check-sat)
