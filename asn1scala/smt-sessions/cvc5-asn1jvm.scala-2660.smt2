; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65326 () Bool)

(assert start!65326)

(declare-fun b!293051 () Bool)

(declare-fun e!209184 () Bool)

(assert (=> b!293051 (= e!209184 false)))

(declare-datatypes ((array!17474 0))(
  ( (array!17475 (arr!8596 (Array (_ BitVec 32) (_ BitVec 8))) (size!7570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13144 0))(
  ( (BitStream!13145 (buf!7633 array!17474) (currentByte!14097 (_ BitVec 32)) (currentBit!14092 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22970 0))(
  ( (tuple2!22971 (_1!12790 Bool) (_2!12790 BitStream!13144)) )
))
(declare-fun lt!425169 () tuple2!22970)

(declare-fun thiss!1728 () BitStream!13144)

(declare-fun readBit!0 (BitStream!13144) tuple2!22970)

(assert (=> b!293051 (= lt!425169 (readBit!0 thiss!1728))))

(declare-fun b!293052 () Bool)

(declare-fun e!209187 () Bool)

(declare-fun array_inv!7182 (array!17474) Bool)

(assert (=> b!293052 (= e!209187 (array_inv!7182 (buf!7633 thiss!1728)))))

(declare-fun b!293050 () Bool)

(declare-fun res!242013 () Bool)

(assert (=> b!293050 (=> (not res!242013) (not e!209184))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293050 (= res!242013 (bvslt from!505 to!474))))

(declare-fun b!293049 () Bool)

(declare-fun res!242015 () Bool)

(assert (=> b!293049 (=> (not res!242015) (not e!209184))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293049 (= res!242015 (validate_offset_bits!1 ((_ sign_extend 32) (size!7570 (buf!7633 thiss!1728))) ((_ sign_extend 32) (currentByte!14097 thiss!1728)) ((_ sign_extend 32) (currentBit!14092 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242014 () Bool)

(assert (=> start!65326 (=> (not res!242014) (not e!209184))))

(declare-fun arr!273 () array!17474)

(assert (=> start!65326 (= res!242014 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7570 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65326 e!209184))

(declare-fun inv!12 (BitStream!13144) Bool)

(assert (=> start!65326 (and (inv!12 thiss!1728) e!209187)))

(assert (=> start!65326 true))

(assert (=> start!65326 (array_inv!7182 arr!273)))

(assert (= (and start!65326 res!242014) b!293049))

(assert (= (and b!293049 res!242015) b!293050))

(assert (= (and b!293050 res!242013) b!293051))

(assert (= start!65326 b!293052))

(declare-fun m!428635 () Bool)

(assert (=> b!293051 m!428635))

(declare-fun m!428637 () Bool)

(assert (=> b!293052 m!428637))

(declare-fun m!428639 () Bool)

(assert (=> b!293049 m!428639))

(declare-fun m!428641 () Bool)

(assert (=> start!65326 m!428641))

(declare-fun m!428643 () Bool)

(assert (=> start!65326 m!428643))

(push 1)

(assert (not b!293052))

(assert (not start!65326))

(assert (not b!293049))

(assert (not b!293051))

(check-sat)

