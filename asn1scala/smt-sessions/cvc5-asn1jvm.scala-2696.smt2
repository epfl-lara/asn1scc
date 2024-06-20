; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66052 () Bool)

(assert start!66052)

(declare-fun res!244496 () Bool)

(declare-fun e!211848 () Bool)

(assert (=> start!66052 (=> (not res!244496) (not e!211848))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17720 0))(
  ( (array!17721 (arr!8737 (Array (_ BitVec 32) (_ BitVec 8))) (size!7678 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17720)

(assert (=> start!66052 (= res!244496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7678 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66052 e!211848))

(declare-datatypes ((BitStream!13360 0))(
  ( (BitStream!13361 (buf!7741 array!17720) (currentByte!14262 (_ BitVec 32)) (currentBit!14257 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13360)

(declare-fun e!211845 () Bool)

(declare-fun inv!12 (BitStream!13360) Bool)

(assert (=> start!66052 (and (inv!12 thiss!1728) e!211845)))

(assert (=> start!66052 true))

(declare-fun array_inv!7290 (array!17720) Bool)

(assert (=> start!66052 (array_inv!7290 arr!273)))

(declare-fun b!296138 () Bool)

(declare-fun e!211843 () Bool)

(declare-fun lt!431301 () Bool)

(declare-datatypes ((tuple2!23296 0))(
  ( (tuple2!23297 (_1!13034 Bool) (_2!13034 BitStream!13360)) )
))
(declare-fun lt!431302 () tuple2!23296)

(assert (=> b!296138 (= e!211843 (= lt!431301 (_1!13034 lt!431302)))))

(declare-fun b!296139 () Bool)

(declare-fun res!244494 () Bool)

(assert (=> b!296139 (=> (not res!244494) (not e!211848))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296139 (= res!244494 (validate_offset_bits!1 ((_ sign_extend 32) (size!7678 (buf!7741 thiss!1728))) ((_ sign_extend 32) (currentByte!14262 thiss!1728)) ((_ sign_extend 32) (currentBit!14257 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun e!211842 () Bool)

(declare-datatypes ((Unit!20641 0))(
  ( (Unit!20642) )
))
(declare-datatypes ((tuple3!1872 0))(
  ( (tuple3!1873 (_1!13035 Unit!20641) (_2!13035 BitStream!13360) (_3!1386 array!17720)) )
))
(declare-fun lt!431300 () tuple3!1872)

(declare-fun b!296140 () Bool)

(assert (=> b!296140 (= e!211842 (and (= (buf!7741 thiss!1728) (buf!7741 (_2!13035 lt!431300))) (= (size!7678 arr!273) (size!7678 (_3!1386 lt!431300)))))))

(declare-fun b!296141 () Bool)

(declare-fun res!244493 () Bool)

(declare-fun e!211847 () Bool)

(assert (=> b!296141 (=> res!244493 e!211847)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296141 (= res!244493 (not (invariant!0 (currentBit!14257 (_2!13035 lt!431300)) (currentByte!14262 (_2!13035 lt!431300)) (size!7678 (buf!7741 (_2!13035 lt!431300))))))))

(declare-fun b!296142 () Bool)

(assert (=> b!296142 (= e!211848 (not e!211847))))

(declare-fun res!244495 () Bool)

(assert (=> b!296142 (=> res!244495 e!211847)))

(declare-datatypes ((tuple2!23298 0))(
  ( (tuple2!23299 (_1!13036 BitStream!13360) (_2!13036 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13360) tuple2!23298)

(assert (=> b!296142 (= res!244495 (not (= lt!431301 (_2!13036 (readBitPure!0 thiss!1728)))))))

(assert (=> b!296142 e!211843))

(declare-fun res!244497 () Bool)

(assert (=> b!296142 (=> (not res!244497) (not e!211843))))

(declare-fun lt!431306 () array!17720)

(declare-fun bitAt!0 (array!17720 (_ BitVec 64)) Bool)

(assert (=> b!296142 (= res!244497 (= (bitAt!0 lt!431306 from!505) lt!431301))))

(assert (=> b!296142 (= lt!431301 (bitAt!0 (_3!1386 lt!431300) from!505))))

(declare-fun lt!431298 () Unit!20641)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17720 array!17720 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20641)

(assert (=> b!296142 (= lt!431298 (arrayBitRangesEqImpliesEq!0 lt!431306 (_3!1386 lt!431300) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17720 array!17720 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296142 (arrayBitRangesEq!0 arr!273 (_3!1386 lt!431300) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431305 () Unit!20641)

(declare-fun arrayBitRangesEqTransitive!0 (array!17720 array!17720 array!17720 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20641)

(assert (=> b!296142 (= lt!431305 (arrayBitRangesEqTransitive!0 arr!273 lt!431306 (_3!1386 lt!431300) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296142 (arrayBitRangesEq!0 arr!273 lt!431306 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431299 () Unit!20641)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17720 (_ BitVec 64) Bool) Unit!20641)

(assert (=> b!296142 (= lt!431299 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13034 lt!431302)))))

(assert (=> b!296142 e!211842))

(declare-fun res!244499 () Bool)

(assert (=> b!296142 (=> (not res!244499) (not e!211842))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296142 (= res!244499 (= (bvsub (bvadd (bitIndex!0 (size!7678 (buf!7741 thiss!1728)) (currentByte!14262 thiss!1728) (currentBit!14257 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7678 (buf!7741 (_2!13035 lt!431300))) (currentByte!14262 (_2!13035 lt!431300)) (currentBit!14257 (_2!13035 lt!431300)))))))

(declare-fun readBitsLoop!0 (BitStream!13360 (_ BitVec 64) array!17720 (_ BitVec 64) (_ BitVec 64)) tuple3!1872)

(assert (=> b!296142 (= lt!431300 (readBitsLoop!0 (_2!13034 lt!431302) nBits!523 lt!431306 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296142 (validate_offset_bits!1 ((_ sign_extend 32) (size!7678 (buf!7741 (_2!13034 lt!431302)))) ((_ sign_extend 32) (currentByte!14262 (_2!13034 lt!431302))) ((_ sign_extend 32) (currentBit!14257 (_2!13034 lt!431302))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431303 () Unit!20641)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13360 BitStream!13360 (_ BitVec 64) (_ BitVec 64)) Unit!20641)

(assert (=> b!296142 (= lt!431303 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13034 lt!431302) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431307 () (_ BitVec 32))

(declare-fun lt!431304 () (_ BitVec 32))

(assert (=> b!296142 (= lt!431306 (array!17721 (store (arr!8737 arr!273) lt!431307 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8737 arr!273) lt!431307)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431304)))) ((_ sign_extend 24) (ite (_1!13034 lt!431302) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431304) #b00000000))))) (size!7678 arr!273)))))

(assert (=> b!296142 (= lt!431304 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296142 (= lt!431307 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13360) tuple2!23296)

(assert (=> b!296142 (= lt!431302 (readBit!0 thiss!1728))))

(declare-fun b!296143 () Bool)

(assert (=> b!296143 (= e!211847 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!296144 () Bool)

(assert (=> b!296144 (= e!211845 (array_inv!7290 (buf!7741 thiss!1728)))))

(declare-fun b!296145 () Bool)

(declare-fun res!244498 () Bool)

(assert (=> b!296145 (=> (not res!244498) (not e!211848))))

(assert (=> b!296145 (= res!244498 (bvslt from!505 to!474))))

(assert (= (and start!66052 res!244496) b!296139))

(assert (= (and b!296139 res!244494) b!296145))

(assert (= (and b!296145 res!244498) b!296142))

(assert (= (and b!296142 res!244499) b!296140))

(assert (= (and b!296142 res!244497) b!296138))

(assert (= (and b!296142 (not res!244495)) b!296141))

(assert (= (and b!296141 (not res!244493)) b!296143))

(assert (= start!66052 b!296144))

(declare-fun m!433993 () Bool)

(assert (=> b!296144 m!433993))

(declare-fun m!433995 () Bool)

(assert (=> b!296142 m!433995))

(declare-fun m!433997 () Bool)

(assert (=> b!296142 m!433997))

(declare-fun m!433999 () Bool)

(assert (=> b!296142 m!433999))

(declare-fun m!434001 () Bool)

(assert (=> b!296142 m!434001))

(declare-fun m!434003 () Bool)

(assert (=> b!296142 m!434003))

(declare-fun m!434005 () Bool)

(assert (=> b!296142 m!434005))

(declare-fun m!434007 () Bool)

(assert (=> b!296142 m!434007))

(declare-fun m!434009 () Bool)

(assert (=> b!296142 m!434009))

(declare-fun m!434011 () Bool)

(assert (=> b!296142 m!434011))

(declare-fun m!434013 () Bool)

(assert (=> b!296142 m!434013))

(declare-fun m!434015 () Bool)

(assert (=> b!296142 m!434015))

(declare-fun m!434017 () Bool)

(assert (=> b!296142 m!434017))

(declare-fun m!434019 () Bool)

(assert (=> b!296142 m!434019))

(declare-fun m!434021 () Bool)

(assert (=> b!296142 m!434021))

(declare-fun m!434023 () Bool)

(assert (=> b!296142 m!434023))

(declare-fun m!434025 () Bool)

(assert (=> b!296142 m!434025))

(declare-fun m!434027 () Bool)

(assert (=> b!296142 m!434027))

(declare-fun m!434029 () Bool)

(assert (=> b!296141 m!434029))

(declare-fun m!434031 () Bool)

(assert (=> b!296139 m!434031))

(declare-fun m!434033 () Bool)

(assert (=> start!66052 m!434033))

(declare-fun m!434035 () Bool)

(assert (=> start!66052 m!434035))

(push 1)

(assert (not b!296144))

(assert (not b!296139))

(assert (not b!296142))

(assert (not start!66052))

(assert (not b!296141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

