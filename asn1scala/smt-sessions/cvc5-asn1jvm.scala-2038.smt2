; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52014 () Bool)

(assert start!52014)

(declare-fun res!200190 () Bool)

(declare-fun e!166211 () Bool)

(assert (=> start!52014 (=> (not res!200190) (not e!166211))))

(declare-datatypes ((array!13077 0))(
  ( (array!13078 (arr!6715 (Array (_ BitVec 32) (_ BitVec 8))) (size!5728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10378 0))(
  ( (BitStream!10379 (buf!6182 array!13077) (currentByte!11521 (_ BitVec 32)) (currentBit!11516 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10378)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!52014 (= res!200190 (validate_offset_bits!1 ((_ sign_extend 32) (size!5728 (buf!6182 thiss!1948))) ((_ sign_extend 32) (currentByte!11521 thiss!1948)) ((_ sign_extend 32) (currentBit!11516 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11521 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11516 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!52014 e!166211))

(declare-fun e!166209 () Bool)

(declare-fun inv!12 (BitStream!10378) Bool)

(assert (=> start!52014 (and (inv!12 thiss!1948) e!166209)))

(declare-fun b!239782 () Bool)

(declare-fun lt!374454 () (_ BitVec 32))

(assert (=> b!239782 (= e!166211 (and (not (= lt!374454 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000100 (bvsdiv (bvmul #b00000000000000000000000000000100 lt!374454) lt!374454)))))))

(declare-datatypes ((Unit!17569 0))(
  ( (Unit!17570) )
))
(declare-datatypes ((tuple2!20274 0))(
  ( (tuple2!20275 (_1!11059 Unit!17569) (_2!11059 BitStream!10378)) )
))
(declare-fun alignToByte!0 (BitStream!10378) tuple2!20274)

(assert (=> b!239782 (= lt!374454 (bvsdiv (bvadd #b00000000000000000000000000000011 (currentByte!11521 (_2!11059 (alignToByte!0 thiss!1948)))) #b00000000000000000000000000000100))))

(declare-fun b!239783 () Bool)

(declare-fun array_inv!5469 (array!13077) Bool)

(assert (=> b!239783 (= e!166209 (array_inv!5469 (buf!6182 thiss!1948)))))

(assert (= (and start!52014 res!200190) b!239782))

(assert (= start!52014 b!239783))

(declare-fun m!362083 () Bool)

(assert (=> start!52014 m!362083))

(declare-fun m!362085 () Bool)

(assert (=> start!52014 m!362085))

(declare-fun m!362087 () Bool)

(assert (=> b!239782 m!362087))

(declare-fun m!362089 () Bool)

(assert (=> b!239783 m!362089))

(push 1)

(assert (not b!239782))

(assert (not start!52014))

(assert (not b!239783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

