; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65632 () Bool)

(assert start!65632)

(declare-fun b!294269 () Bool)

(declare-fun res!242992 () Bool)

(declare-fun e!210288 () Bool)

(assert (=> b!294269 (=> (not res!242992) (not e!210288))))

(declare-datatypes ((array!17615 0))(
  ( (array!17616 (arr!8668 (Array (_ BitVec 32) (_ BitVec 8))) (size!7633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13270 0))(
  ( (BitStream!13271 (buf!7696 array!17615) (currentByte!14187 (_ BitVec 32)) (currentBit!14182 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13270)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294269 (= res!242992 (validate_offset_bits!1 ((_ sign_extend 32) (size!7633 (buf!7696 thiss!1728))) ((_ sign_extend 32) (currentByte!14187 thiss!1728)) ((_ sign_extend 32) (currentBit!14182 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294270 () Bool)

(declare-fun e!210291 () Bool)

(declare-fun array_inv!7245 (array!17615) Bool)

(assert (=> b!294270 (= e!210291 (array_inv!7245 (buf!7696 thiss!1728)))))

(declare-fun res!242990 () Bool)

(assert (=> start!65632 (=> (not res!242990) (not e!210288))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17615)

(assert (=> start!65632 (= res!242990 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7633 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65632 e!210288))

(declare-fun inv!12 (BitStream!13270) Bool)

(assert (=> start!65632 (and (inv!12 thiss!1728) e!210291)))

(assert (=> start!65632 true))

(assert (=> start!65632 (array_inv!7245 arr!273)))

(declare-fun b!294271 () Bool)

(declare-fun res!242993 () Bool)

(assert (=> b!294271 (=> (not res!242993) (not e!210288))))

(assert (=> b!294271 (= res!242993 (bvslt from!505 to!474))))

(declare-datatypes ((Unit!20491 0))(
  ( (Unit!20492) )
))
(declare-datatypes ((tuple3!1782 0))(
  ( (tuple3!1783 (_1!12896 Unit!20491) (_2!12896 BitStream!13270) (_3!1326 array!17615)) )
))
(declare-fun lt!427326 () tuple3!1782)

(declare-fun e!210289 () Bool)

(declare-fun b!294272 () Bool)

(assert (=> b!294272 (= e!210289 (and (= (buf!7696 thiss!1728) (buf!7696 (_2!12896 lt!427326))) (= (size!7633 arr!273) (size!7633 (_3!1326 lt!427326)))))))

(declare-fun b!294273 () Bool)

(assert (=> b!294273 (= e!210288 (not (or (bvsgt from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (let ((bdg!17510 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7633 arr!273))))) (and (bvsle from!505 bdg!17510) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) bdg!17510))))))))

(declare-fun lt!427324 () array!17615)

(declare-fun arrayBitRangesEq!0 (array!17615 array!17615 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294273 (arrayBitRangesEq!0 arr!273 lt!427324 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!427323 () Unit!20491)

(declare-datatypes ((tuple2!23140 0))(
  ( (tuple2!23141 (_1!12897 Bool) (_2!12897 BitStream!13270)) )
))
(declare-fun lt!427325 () tuple2!23140)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17615 (_ BitVec 64) Bool) Unit!20491)

(assert (=> b!294273 (= lt!427323 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12897 lt!427325)))))

(assert (=> b!294273 e!210289))

(declare-fun res!242991 () Bool)

(assert (=> b!294273 (=> (not res!242991) (not e!210289))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294273 (= res!242991 (= (bvsub (bvadd (bitIndex!0 (size!7633 (buf!7696 thiss!1728)) (currentByte!14187 thiss!1728) (currentBit!14182 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7633 (buf!7696 (_2!12896 lt!427326))) (currentByte!14187 (_2!12896 lt!427326)) (currentBit!14182 (_2!12896 lt!427326)))))))

(declare-fun readBitsLoop!0 (BitStream!13270 (_ BitVec 64) array!17615 (_ BitVec 64) (_ BitVec 64)) tuple3!1782)

(assert (=> b!294273 (= lt!427326 (readBitsLoop!0 (_2!12897 lt!427325) nBits!523 lt!427324 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294273 (validate_offset_bits!1 ((_ sign_extend 32) (size!7633 (buf!7696 (_2!12897 lt!427325)))) ((_ sign_extend 32) (currentByte!14187 (_2!12897 lt!427325))) ((_ sign_extend 32) (currentBit!14182 (_2!12897 lt!427325))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427329 () Unit!20491)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13270 BitStream!13270 (_ BitVec 64) (_ BitVec 64)) Unit!20491)

(assert (=> b!294273 (= lt!427329 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12897 lt!427325) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427327 () (_ BitVec 32))

(declare-fun lt!427328 () (_ BitVec 32))

(assert (=> b!294273 (= lt!427324 (array!17616 (store (arr!8668 arr!273) lt!427328 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8668 arr!273) lt!427328)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427327)))) ((_ sign_extend 24) (ite (_1!12897 lt!427325) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427327) #b00000000))))) (size!7633 arr!273)))))

(assert (=> b!294273 (= lt!427327 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294273 (= lt!427328 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13270) tuple2!23140)

(assert (=> b!294273 (= lt!427325 (readBit!0 thiss!1728))))

(assert (= (and start!65632 res!242990) b!294269))

(assert (= (and b!294269 res!242992) b!294271))

(assert (= (and b!294271 res!242993) b!294273))

(assert (= (and b!294273 res!242991) b!294272))

(assert (= start!65632 b!294270))

(declare-fun m!430435 () Bool)

(assert (=> b!294269 m!430435))

(declare-fun m!430437 () Bool)

(assert (=> b!294270 m!430437))

(declare-fun m!430439 () Bool)

(assert (=> start!65632 m!430439))

(declare-fun m!430441 () Bool)

(assert (=> start!65632 m!430441))

(declare-fun m!430443 () Bool)

(assert (=> b!294273 m!430443))

(declare-fun m!430445 () Bool)

(assert (=> b!294273 m!430445))

(declare-fun m!430447 () Bool)

(assert (=> b!294273 m!430447))

(declare-fun m!430449 () Bool)

(assert (=> b!294273 m!430449))

(declare-fun m!430451 () Bool)

(assert (=> b!294273 m!430451))

(declare-fun m!430453 () Bool)

(assert (=> b!294273 m!430453))

(declare-fun m!430455 () Bool)

(assert (=> b!294273 m!430455))

(declare-fun m!430457 () Bool)

(assert (=> b!294273 m!430457))

(declare-fun m!430459 () Bool)

(assert (=> b!294273 m!430459))

(declare-fun m!430461 () Bool)

(assert (=> b!294273 m!430461))

(declare-fun m!430463 () Bool)

(assert (=> b!294273 m!430463))

(push 1)

(assert (not b!294270))

(assert (not start!65632))

(assert (not b!294269))

(assert (not b!294273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

