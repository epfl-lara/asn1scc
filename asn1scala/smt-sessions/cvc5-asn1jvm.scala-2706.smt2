; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66352 () Bool)

(assert start!66352)

(declare-fun b!297347 () Bool)

(declare-fun e!212838 () Bool)

(assert (=> b!297347 (= e!212838 (not true))))

(declare-datatypes ((array!17789 0))(
  ( (array!17790 (arr!8788 (Array (_ BitVec 32) (_ BitVec 8))) (size!7708 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17789)

(declare-fun arrayBitRangesEq!0 (array!17789 array!17789 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297347 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7708 arr!273))))))

(declare-datatypes ((Unit!20737 0))(
  ( (Unit!20738) )
))
(declare-fun lt!433665 () Unit!20737)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17789) Unit!20737)

(assert (=> b!297347 (= lt!433665 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245423 () Bool)

(assert (=> start!66352 (=> (not res!245423) (not e!212838))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!66352 (= res!245423 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7708 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66352 e!212838))

(declare-datatypes ((BitStream!13420 0))(
  ( (BitStream!13421 (buf!7771 array!17789) (currentByte!14313 (_ BitVec 32)) (currentBit!14308 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13420)

(declare-fun e!212836 () Bool)

(declare-fun inv!12 (BitStream!13420) Bool)

(assert (=> start!66352 (and (inv!12 thiss!1728) e!212836)))

(assert (=> start!66352 true))

(declare-fun array_inv!7320 (array!17789) Bool)

(assert (=> start!66352 (array_inv!7320 arr!273)))

(declare-fun b!297348 () Bool)

(assert (=> b!297348 (= e!212836 (array_inv!7320 (buf!7771 thiss!1728)))))

(declare-fun b!297345 () Bool)

(declare-fun res!245422 () Bool)

(assert (=> b!297345 (=> (not res!245422) (not e!212838))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297345 (= res!245422 (validate_offset_bits!1 ((_ sign_extend 32) (size!7708 (buf!7771 thiss!1728))) ((_ sign_extend 32) (currentByte!14313 thiss!1728)) ((_ sign_extend 32) (currentBit!14308 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297346 () Bool)

(declare-fun res!245421 () Bool)

(assert (=> b!297346 (=> (not res!245421) (not e!212838))))

(assert (=> b!297346 (= res!245421 (bvsge from!505 to!474))))

(assert (= (and start!66352 res!245423) b!297345))

(assert (= (and b!297345 res!245422) b!297346))

(assert (= (and b!297346 res!245421) b!297347))

(assert (= start!66352 b!297348))

(declare-fun m!436165 () Bool)

(assert (=> b!297347 m!436165))

(declare-fun m!436167 () Bool)

(assert (=> b!297347 m!436167))

(declare-fun m!436169 () Bool)

(assert (=> start!66352 m!436169))

(declare-fun m!436171 () Bool)

(assert (=> start!66352 m!436171))

(declare-fun m!436173 () Bool)

(assert (=> b!297348 m!436173))

(declare-fun m!436175 () Bool)

(assert (=> b!297345 m!436175))

(push 1)

(assert (not b!297347))

(assert (not b!297348))

(assert (not start!66352))

(assert (not b!297345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

