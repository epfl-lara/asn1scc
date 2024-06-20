; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51876 () Bool)

(assert start!51876)

(declare-fun lt!374208 () (_ BitVec 32))

(declare-datatypes ((array!13036 0))(
  ( (array!13037 (arr!6699 (Array (_ BitVec 32) (_ BitVec 8))) (size!5712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10346 0))(
  ( (BitStream!10347 (buf!6166 array!13036) (currentByte!11479 (_ BitVec 32)) (currentBit!11474 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10346)

(assert (=> start!51876 (= lt!374208 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11479 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11474 thiss!1948)))))

(assert (=> start!51876 (and (not (= #b00000000000000000000000000000000 (bvand lt!374208 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000100000 lt!374208) #b10000000000000000000000000000000))))))

(declare-fun e!166006 () Bool)

(declare-fun inv!12 (BitStream!10346) Bool)

(assert (=> start!51876 (and (inv!12 thiss!1948) e!166006)))

(declare-fun b!239603 () Bool)

(declare-fun array_inv!5453 (array!13036) Bool)

(assert (=> b!239603 (= e!166006 (array_inv!5453 (buf!6166 thiss!1948)))))

(assert (= start!51876 b!239603))

(declare-fun m!361857 () Bool)

(assert (=> start!51876 m!361857))

(declare-fun m!361859 () Bool)

(assert (=> b!239603 m!361859))

(push 1)

(assert (not start!51876))

(assert (not b!239603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80984 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80984 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11474 thiss!1948) (currentByte!11479 thiss!1948) (size!5712 (buf!6166 thiss!1948))))))

(declare-fun bs!20400 () Bool)

(assert (= bs!20400 d!80984))

(declare-fun m!361865 () Bool)

(assert (=> bs!20400 m!361865))

(assert (=> start!51876 d!80984))

(declare-fun d!80986 () Bool)

(assert (=> d!80986 (= (array_inv!5453 (buf!6166 thiss!1948)) (bvsge (size!5712 (buf!6166 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239603 d!80986))

(push 1)

