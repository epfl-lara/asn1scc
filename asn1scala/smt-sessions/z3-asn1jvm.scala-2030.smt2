; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51854 () Bool)

(assert start!51854)

(declare-fun lt!374193 () (_ BitVec 32))

(declare-fun lt!374192 () (_ BitVec 32))

(assert (=> start!51854 (= lt!374193 (bvand lt!374192 #b10000000000000000000000000000000))))

(declare-datatypes ((array!13025 0))(
  ( (array!13026 (arr!6695 (Array (_ BitVec 32) (_ BitVec 8))) (size!5708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10338 0))(
  ( (BitStream!10339 (buf!6162 array!13025) (currentByte!11474 (_ BitVec 32)) (currentBit!11469 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10338)

(assert (=> start!51854 (= lt!374192 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11474 thiss!1948) #b00000000000000000000000000000011)))))

(assert (=> start!51854 (and (= lt!374193 (bvand (currentBit!11469 thiss!1948) #b10000000000000000000000000000000)) (not (= lt!374193 (bvand (bvadd lt!374192 (currentBit!11469 thiss!1948)) #b10000000000000000000000000000000))))))

(declare-fun e!165982 () Bool)

(declare-fun inv!12 (BitStream!10338) Bool)

(assert (=> start!51854 (and (inv!12 thiss!1948) e!165982)))

(declare-fun b!239591 () Bool)

(declare-fun array_inv!5449 (array!13025) Bool)

(assert (=> b!239591 (= e!165982 (array_inv!5449 (buf!6162 thiss!1948)))))

(assert (= start!51854 b!239591))

(declare-fun m!361835 () Bool)

(assert (=> start!51854 m!361835))

(declare-fun m!361837 () Bool)

(assert (=> b!239591 m!361837))

(check-sat (not start!51854) (not b!239591))
(check-sat)
(get-model)

(declare-fun d!80962 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80962 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11469 thiss!1948) (currentByte!11474 thiss!1948) (size!5708 (buf!6162 thiss!1948))))))

(declare-fun bs!20393 () Bool)

(assert (= bs!20393 d!80962))

(declare-fun m!361845 () Bool)

(assert (=> bs!20393 m!361845))

(assert (=> start!51854 d!80962))

(declare-fun d!80968 () Bool)

(assert (=> d!80968 (= (array_inv!5449 (buf!6162 thiss!1948)) (bvsge (size!5708 (buf!6162 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239591 d!80968))

(check-sat (not d!80962))
(check-sat)
(get-model)

