; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65412 () Bool)

(assert start!65412)

(declare-fun b!293440 () Bool)

(declare-fun res!242311 () Bool)

(declare-fun e!209589 () Bool)

(assert (=> b!293440 (=> (not res!242311) (not e!209589))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293440 (= res!242311 (bvslt from!505 to!474))))

(declare-fun b!293441 () Bool)

(assert (=> b!293441 (= e!209589 false)))

(declare-datatypes ((array!17539 0))(
  ( (array!17540 (arr!8627 (Array (_ BitVec 32) (_ BitVec 8))) (size!7601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13206 0))(
  ( (BitStream!13207 (buf!7664 array!17539) (currentByte!14131 (_ BitVec 32)) (currentBit!14126 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23034 0))(
  ( (tuple2!23035 (_1!12822 Bool) (_2!12822 BitStream!13206)) )
))
(declare-fun lt!425352 () tuple2!23034)

(declare-fun thiss!1728 () BitStream!13206)

(declare-fun readBit!0 (BitStream!13206) tuple2!23034)

(assert (=> b!293441 (= lt!425352 (readBit!0 thiss!1728))))

(declare-fun b!293442 () Bool)

(declare-fun e!209587 () Bool)

(declare-fun array_inv!7213 (array!17539) Bool)

(assert (=> b!293442 (= e!209587 (array_inv!7213 (buf!7664 thiss!1728)))))

(declare-fun res!242312 () Bool)

(assert (=> start!65412 (=> (not res!242312) (not e!209589))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17539)

(assert (=> start!65412 (= res!242312 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7601 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65412 e!209589))

(declare-fun inv!12 (BitStream!13206) Bool)

(assert (=> start!65412 (and (inv!12 thiss!1728) e!209587)))

(assert (=> start!65412 true))

(assert (=> start!65412 (array_inv!7213 arr!273)))

(declare-fun b!293439 () Bool)

(declare-fun res!242310 () Bool)

(assert (=> b!293439 (=> (not res!242310) (not e!209589))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293439 (= res!242310 (validate_offset_bits!1 ((_ sign_extend 32) (size!7601 (buf!7664 thiss!1728))) ((_ sign_extend 32) (currentByte!14131 thiss!1728)) ((_ sign_extend 32) (currentBit!14126 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65412 res!242312) b!293439))

(assert (= (and b!293439 res!242310) b!293440))

(assert (= (and b!293440 res!242311) b!293441))

(assert (= start!65412 b!293442))

(declare-fun m!428969 () Bool)

(assert (=> b!293441 m!428969))

(declare-fun m!428971 () Bool)

(assert (=> b!293442 m!428971))

(declare-fun m!428973 () Bool)

(assert (=> start!65412 m!428973))

(declare-fun m!428975 () Bool)

(assert (=> start!65412 m!428975))

(declare-fun m!428977 () Bool)

(assert (=> b!293439 m!428977))

(check-sat (not b!293442) (not b!293441) (not start!65412) (not b!293439))
