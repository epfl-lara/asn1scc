; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51874 () Bool)

(assert start!51874)

(declare-fun lt!374205 () (_ BitVec 32))

(declare-datatypes ((array!13034 0))(
  ( (array!13035 (arr!6698 (Array (_ BitVec 32) (_ BitVec 8))) (size!5711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10344 0))(
  ( (BitStream!10345 (buf!6165 array!13034) (currentByte!11478 (_ BitVec 32)) (currentBit!11473 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10344)

(assert (=> start!51874 (= lt!374205 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11478 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11473 thiss!1948)))))

(assert (=> start!51874 (and (not (= #b00000000000000000000000000000000 (bvand lt!374205 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000100000 lt!374205) #b10000000000000000000000000000000))))))

(declare-fun e!166000 () Bool)

(declare-fun inv!12 (BitStream!10344) Bool)

(assert (=> start!51874 (and (inv!12 thiss!1948) e!166000)))

(declare-fun b!239600 () Bool)

(declare-fun array_inv!5452 (array!13034) Bool)

(assert (=> b!239600 (= e!166000 (array_inv!5452 (buf!6165 thiss!1948)))))

(assert (= start!51874 b!239600))

(declare-fun m!361853 () Bool)

(assert (=> start!51874 m!361853))

(declare-fun m!361855 () Bool)

(assert (=> b!239600 m!361855))

(check-sat (not b!239600) (not start!51874))
(check-sat)
(get-model)

(declare-fun d!80974 () Bool)

(assert (=> d!80974 (= (array_inv!5452 (buf!6165 thiss!1948)) (bvsge (size!5711 (buf!6165 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239600 d!80974))

(declare-fun d!80980 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80980 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11473 thiss!1948) (currentByte!11478 thiss!1948) (size!5711 (buf!6165 thiss!1948))))))

(declare-fun bs!20399 () Bool)

(assert (= bs!20399 d!80980))

(declare-fun m!361863 () Bool)

(assert (=> bs!20399 m!361863))

(assert (=> start!51874 d!80980))

(check-sat (not d!80980))
(check-sat)
(get-model)

(declare-fun d!80988 () Bool)

(assert (=> d!80988 (= (invariant!0 (currentBit!11473 thiss!1948) (currentByte!11478 thiss!1948) (size!5711 (buf!6165 thiss!1948))) (and (bvsge (currentBit!11473 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11473 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11478 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11478 thiss!1948) (size!5711 (buf!6165 thiss!1948))) (and (= (currentBit!11473 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11478 thiss!1948) (size!5711 (buf!6165 thiss!1948)))))))))

(assert (=> d!80980 d!80988))

(check-sat)
