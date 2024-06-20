; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65306 () Bool)

(assert start!65306)

(declare-fun b!292932 () Bool)

(declare-fun e!209065 () Bool)

(declare-datatypes ((array!17454 0))(
  ( (array!17455 (arr!8586 (Array (_ BitVec 32) (_ BitVec 8))) (size!7560 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13124 0))(
  ( (BitStream!13125 (buf!7623 array!17454) (currentByte!14087 (_ BitVec 32)) (currentBit!14082 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13124)

(declare-fun array_inv!7172 (array!17454) Bool)

(assert (=> b!292932 (= e!209065 (array_inv!7172 (buf!7623 thiss!1728)))))

(declare-fun b!292929 () Bool)

(declare-fun res!241924 () Bool)

(declare-fun e!209066 () Bool)

(assert (=> b!292929 (=> (not res!241924) (not e!209066))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292929 (= res!241924 (validate_offset_bits!1 ((_ sign_extend 32) (size!7560 (buf!7623 thiss!1728))) ((_ sign_extend 32) (currentByte!14087 thiss!1728)) ((_ sign_extend 32) (currentBit!14082 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292931 () Bool)

(assert (=> b!292931 (= e!209066 false)))

(declare-datatypes ((tuple2!22950 0))(
  ( (tuple2!22951 (_1!12780 Bool) (_2!12780 BitStream!13124)) )
))
(declare-fun lt!425139 () tuple2!22950)

(declare-fun readBit!0 (BitStream!13124) tuple2!22950)

(assert (=> b!292931 (= lt!425139 (readBit!0 thiss!1728))))

(declare-fun b!292930 () Bool)

(declare-fun res!241925 () Bool)

(assert (=> b!292930 (=> (not res!241925) (not e!209066))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292930 (= res!241925 (bvslt from!505 to!474))))

(declare-fun res!241923 () Bool)

(assert (=> start!65306 (=> (not res!241923) (not e!209066))))

(declare-fun arr!273 () array!17454)

(assert (=> start!65306 (= res!241923 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7560 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65306 e!209066))

(declare-fun inv!12 (BitStream!13124) Bool)

(assert (=> start!65306 (and (inv!12 thiss!1728) e!209065)))

(assert (=> start!65306 true))

(assert (=> start!65306 (array_inv!7172 arr!273)))

(assert (= (and start!65306 res!241923) b!292929))

(assert (= (and b!292929 res!241924) b!292930))

(assert (= (and b!292930 res!241925) b!292931))

(assert (= start!65306 b!292932))

(declare-fun m!428535 () Bool)

(assert (=> b!292932 m!428535))

(declare-fun m!428537 () Bool)

(assert (=> b!292929 m!428537))

(declare-fun m!428539 () Bool)

(assert (=> b!292931 m!428539))

(declare-fun m!428541 () Bool)

(assert (=> start!65306 m!428541))

(declare-fun m!428543 () Bool)

(assert (=> start!65306 m!428543))

(push 1)

(assert (not b!292929))

(assert (not b!292931))

(assert (not b!292932))

(assert (not start!65306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

