; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51820 () Bool)

(assert start!51820)

(declare-fun res!200058 () Bool)

(declare-fun e!165951 () Bool)

(assert (=> start!51820 (=> (not res!200058) (not e!165951))))

(declare-datatypes ((array!13012 0))(
  ( (array!13013 (arr!6690 (Array (_ BitVec 32) (_ BitVec 8))) (size!5703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10328 0))(
  ( (BitStream!10329 (buf!6157 array!13012) (currentByte!11466 (_ BitVec 32)) (currentBit!11461 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10328)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51820 (= res!200058 (validate_offset_bits!1 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11466 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11461 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51820 e!165951))

(declare-fun e!165952 () Bool)

(declare-fun inv!12 (BitStream!10328) Bool)

(assert (=> start!51820 (and (inv!12 thiss!1948) e!165952)))

(declare-fun b!239575 () Bool)

(assert (=> b!239575 (= e!165951 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11461 thiss!1948)) #b00000000000000000000000000000111)))))))

(declare-fun b!239576 () Bool)

(declare-fun array_inv!5444 (array!13012) Bool)

(assert (=> b!239576 (= e!165952 (array_inv!5444 (buf!6157 thiss!1948)))))

(assert (= (and start!51820 res!200058) b!239575))

(assert (= start!51820 b!239576))

(declare-fun m!361799 () Bool)

(assert (=> start!51820 m!361799))

(declare-fun m!361801 () Bool)

(assert (=> start!51820 m!361801))

(declare-fun m!361803 () Bool)

(assert (=> b!239575 m!361803))

(declare-fun m!361805 () Bool)

(assert (=> b!239576 m!361805))

(push 1)

(assert (not b!239575))

(assert (not start!51820))

(assert (not b!239576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80930 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80930 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11461 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11461 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20374 () Bool)

(assert (= bs!20374 d!80930))

(declare-fun m!361807 () Bool)

(assert (=> bs!20374 m!361807))

(assert (=> b!239575 d!80930))

(declare-fun d!80936 () Bool)

(assert (=> d!80936 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11466 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11461 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5703 (buf!6157 thiss!1948))) ((_ sign_extend 32) (currentByte!11466 thiss!1948)) ((_ sign_extend 32) (currentBit!11461 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11466 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11461 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20376 () Bool)

(assert (= bs!20376 d!80936))

(assert (=> bs!20376 m!361807))

(assert (=> start!51820 d!80936))

(declare-fun d!80940 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80940 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11461 thiss!1948) (currentByte!11466 thiss!1948) (size!5703 (buf!6157 thiss!1948))))))

(declare-fun bs!20378 () Bool)

(assert (= bs!20378 d!80940))

(declare-fun m!361811 () Bool)

(assert (=> bs!20378 m!361811))

(assert (=> start!51820 d!80940))

(declare-fun d!80946 () Bool)

(assert (=> d!80946 (= (array_inv!5444 (buf!6157 thiss!1948)) (bvsge (size!5703 (buf!6157 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239576 d!80946))

(push 1)

(assert (not d!80940))

(assert (not d!80930))

(assert (not d!80936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

