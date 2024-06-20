; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65378 () Bool)

(assert start!65378)

(declare-fun b!293373 () Bool)

(declare-fun e!209506 () Bool)

(declare-datatypes ((array!17526 0))(
  ( (array!17527 (arr!8622 (Array (_ BitVec 32) (_ BitVec 8))) (size!7596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13196 0))(
  ( (BitStream!13197 (buf!7659 array!17526) (currentByte!14123 (_ BitVec 32)) (currentBit!14118 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13196)

(declare-fun array_inv!7208 (array!17526) Bool)

(assert (=> b!293373 (= e!209506 (array_inv!7208 (buf!7659 thiss!1728)))))

(declare-fun b!293371 () Bool)

(declare-fun res!242256 () Bool)

(declare-fun e!209507 () Bool)

(assert (=> b!293371 (=> (not res!242256) (not e!209507))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293371 (= res!242256 (bvslt from!505 to!474))))

(declare-fun b!293370 () Bool)

(declare-fun res!242257 () Bool)

(assert (=> b!293370 (=> (not res!242257) (not e!209507))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293370 (= res!242257 (validate_offset_bits!1 ((_ sign_extend 32) (size!7596 (buf!7659 thiss!1728))) ((_ sign_extend 32) (currentByte!14123 thiss!1728)) ((_ sign_extend 32) (currentBit!14118 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242258 () Bool)

(assert (=> start!65378 (=> (not res!242258) (not e!209507))))

(declare-fun arr!273 () array!17526)

(assert (=> start!65378 (= res!242258 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7596 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65378 e!209507))

(declare-fun inv!12 (BitStream!13196) Bool)

(assert (=> start!65378 (and (inv!12 thiss!1728) e!209506)))

(assert (=> start!65378 true))

(assert (=> start!65378 (array_inv!7208 arr!273)))

(declare-fun b!293372 () Bool)

(assert (=> b!293372 (= e!209507 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(declare-datatypes ((tuple2!23022 0))(
  ( (tuple2!23023 (_1!12816 Bool) (_2!12816 BitStream!13196)) )
))
(declare-fun lt!425274 () tuple2!23022)

(declare-fun readBit!0 (BitStream!13196) tuple2!23022)

(assert (=> b!293372 (= lt!425274 (readBit!0 thiss!1728))))

(assert (= (and start!65378 res!242258) b!293370))

(assert (= (and b!293370 res!242257) b!293371))

(assert (= (and b!293371 res!242256) b!293372))

(assert (= start!65378 b!293373))

(declare-fun m!428895 () Bool)

(assert (=> b!293373 m!428895))

(declare-fun m!428897 () Bool)

(assert (=> b!293370 m!428897))

(declare-fun m!428899 () Bool)

(assert (=> start!65378 m!428899))

(declare-fun m!428901 () Bool)

(assert (=> start!65378 m!428901))

(declare-fun m!428903 () Bool)

(assert (=> b!293372 m!428903))

(push 1)

(assert (not start!65378))

(assert (not b!293370))

(assert (not b!293373))

(assert (not b!293372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

