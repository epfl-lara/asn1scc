; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65372 () Bool)

(assert start!65372)

(declare-fun b!293334 () Bool)

(declare-fun res!242231 () Bool)

(declare-fun e!209469 () Bool)

(assert (=> b!293334 (=> (not res!242231) (not e!209469))))

(declare-datatypes ((array!17520 0))(
  ( (array!17521 (arr!8619 (Array (_ BitVec 32) (_ BitVec 8))) (size!7593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13190 0))(
  ( (BitStream!13191 (buf!7656 array!17520) (currentByte!14120 (_ BitVec 32)) (currentBit!14115 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13190)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293334 (= res!242231 (validate_offset_bits!1 ((_ sign_extend 32) (size!7593 (buf!7656 thiss!1728))) ((_ sign_extend 32) (currentByte!14120 thiss!1728)) ((_ sign_extend 32) (currentBit!14115 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242230 () Bool)

(assert (=> start!65372 (=> (not res!242230) (not e!209469))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17520)

(assert (=> start!65372 (= res!242230 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7593 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65372 e!209469))

(declare-fun e!209472 () Bool)

(declare-fun inv!12 (BitStream!13190) Bool)

(assert (=> start!65372 (and (inv!12 thiss!1728) e!209472)))

(assert (=> start!65372 true))

(declare-fun array_inv!7205 (array!17520) Bool)

(assert (=> start!65372 (array_inv!7205 arr!273)))

(declare-fun b!293336 () Bool)

(assert (=> b!293336 (= e!209469 (and (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23016 0))(
  ( (tuple2!23017 (_1!12813 Bool) (_2!12813 BitStream!13190)) )
))
(declare-fun lt!425265 () tuple2!23016)

(declare-fun readBit!0 (BitStream!13190) tuple2!23016)

(assert (=> b!293336 (= lt!425265 (readBit!0 thiss!1728))))

(declare-fun b!293337 () Bool)

(assert (=> b!293337 (= e!209472 (array_inv!7205 (buf!7656 thiss!1728)))))

(declare-fun b!293335 () Bool)

(declare-fun res!242229 () Bool)

(assert (=> b!293335 (=> (not res!242229) (not e!209469))))

(assert (=> b!293335 (= res!242229 (bvslt from!505 to!474))))

(assert (= (and start!65372 res!242230) b!293334))

(assert (= (and b!293334 res!242231) b!293335))

(assert (= (and b!293335 res!242229) b!293336))

(assert (= start!65372 b!293337))

(declare-fun m!428865 () Bool)

(assert (=> b!293334 m!428865))

(declare-fun m!428867 () Bool)

(assert (=> start!65372 m!428867))

(declare-fun m!428869 () Bool)

(assert (=> start!65372 m!428869))

(declare-fun m!428871 () Bool)

(assert (=> b!293336 m!428871))

(declare-fun m!428873 () Bool)

(assert (=> b!293337 m!428873))

(push 1)

(assert (not start!65372))

(assert (not b!293337))

(assert (not b!293336))

(assert (not b!293334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

