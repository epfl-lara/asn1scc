; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51948 () Bool)

(assert start!51948)

(declare-fun res!200112 () Bool)

(declare-fun e!166072 () Bool)

(assert (=> start!51948 (=> (not res!200112) (not e!166072))))

(declare-datatypes ((array!13050 0))(
  ( (array!13051 (arr!6703 (Array (_ BitVec 32) (_ BitVec 8))) (size!5716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10354 0))(
  ( (BitStream!10355 (buf!6170 array!13050) (currentByte!11497 (_ BitVec 32)) (currentBit!11492 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10354)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51948 (= res!200112 (validate_offset_bits!1 ((_ sign_extend 32) (size!5716 (buf!6170 thiss!1948))) ((_ sign_extend 32) (currentByte!11497 thiss!1948)) ((_ sign_extend 32) (currentBit!11492 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11497 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11492 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51948 e!166072))

(declare-fun e!166071 () Bool)

(declare-fun inv!12 (BitStream!10354) Bool)

(assert (=> start!51948 (and (inv!12 thiss!1948) e!166071)))

(declare-fun b!239668 () Bool)

(assert (=> b!239668 (= e!166072 false)))

(declare-datatypes ((Unit!17533 0))(
  ( (Unit!17534) )
))
(declare-datatypes ((tuple2!20250 0))(
  ( (tuple2!20251 (_1!11047 Unit!17533) (_2!11047 BitStream!10354)) )
))
(declare-fun lt!374319 () tuple2!20250)

(declare-fun alignToByte!0 (BitStream!10354) tuple2!20250)

(assert (=> b!239668 (= lt!374319 (alignToByte!0 thiss!1948))))

(declare-fun b!239669 () Bool)

(declare-fun array_inv!5457 (array!13050) Bool)

(assert (=> b!239669 (= e!166071 (array_inv!5457 (buf!6170 thiss!1948)))))

(assert (= (and start!51948 res!200112) b!239668))

(assert (= start!51948 b!239669))

(declare-fun m!361945 () Bool)

(assert (=> start!51948 m!361945))

(declare-fun m!361947 () Bool)

(assert (=> start!51948 m!361947))

(declare-fun m!361949 () Bool)

(assert (=> b!239668 m!361949))

(declare-fun m!361951 () Bool)

(assert (=> b!239669 m!361951))

(push 1)

(assert (not start!51948))

(assert (not b!239668))

(assert (not b!239669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

