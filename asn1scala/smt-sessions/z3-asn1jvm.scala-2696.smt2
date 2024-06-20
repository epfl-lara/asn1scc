; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66054 () Bool)

(assert start!66054)

(declare-fun b!296162 () Bool)

(declare-fun res!244516 () Bool)

(declare-fun e!211865 () Bool)

(assert (=> b!296162 (=> (not res!244516) (not e!211865))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17722 0))(
  ( (array!17723 (arr!8738 (Array (_ BitVec 32) (_ BitVec 8))) (size!7679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13362 0))(
  ( (BitStream!13363 (buf!7742 array!17722) (currentByte!14263 (_ BitVec 32)) (currentBit!14258 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13362)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296162 (= res!244516 (validate_offset_bits!1 ((_ sign_extend 32) (size!7679 (buf!7742 thiss!1728))) ((_ sign_extend 32) (currentByte!14263 thiss!1728)) ((_ sign_extend 32) (currentBit!14258 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296163 () Bool)

(declare-fun res!244517 () Bool)

(assert (=> b!296163 (=> (not res!244517) (not e!211865))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!296163 (= res!244517 (bvslt from!505 to!474))))

(declare-fun b!296165 () Bool)

(declare-fun res!244520 () Bool)

(declare-fun e!211864 () Bool)

(assert (=> b!296165 (=> res!244520 e!211864)))

(declare-datatypes ((Unit!20643 0))(
  ( (Unit!20644) )
))
(declare-datatypes ((tuple3!1874 0))(
  ( (tuple3!1875 (_1!13037 Unit!20643) (_2!13037 BitStream!13362) (_3!1387 array!17722)) )
))
(declare-fun lt!431336 () tuple3!1874)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296165 (= res!244520 (not (invariant!0 (currentBit!14258 (_2!13037 lt!431336)) (currentByte!14263 (_2!13037 lt!431336)) (size!7679 (buf!7742 (_2!13037 lt!431336))))))))

(declare-fun b!296166 () Bool)

(assert (=> b!296166 (= e!211865 (not e!211864))))

(declare-fun res!244519 () Bool)

(assert (=> b!296166 (=> res!244519 e!211864)))

(declare-fun lt!431335 () Bool)

(declare-datatypes ((tuple2!23300 0))(
  ( (tuple2!23301 (_1!13038 BitStream!13362) (_2!13038 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13362) tuple2!23300)

(assert (=> b!296166 (= res!244519 (not (= lt!431335 (_2!13038 (readBitPure!0 thiss!1728)))))))

(declare-fun e!211867 () Bool)

(assert (=> b!296166 e!211867))

(declare-fun res!244518 () Bool)

(assert (=> b!296166 (=> (not res!244518) (not e!211867))))

(declare-fun lt!431330 () array!17722)

(declare-fun bitAt!0 (array!17722 (_ BitVec 64)) Bool)

(assert (=> b!296166 (= res!244518 (= (bitAt!0 lt!431330 from!505) lt!431335))))

(assert (=> b!296166 (= lt!431335 (bitAt!0 (_3!1387 lt!431336) from!505))))

(declare-fun lt!431332 () Unit!20643)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17722 array!17722 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20643)

(assert (=> b!296166 (= lt!431332 (arrayBitRangesEqImpliesEq!0 lt!431330 (_3!1387 lt!431336) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17722)

(declare-fun arrayBitRangesEq!0 (array!17722 array!17722 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296166 (arrayBitRangesEq!0 arr!273 (_3!1387 lt!431336) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431331 () Unit!20643)

(declare-fun arrayBitRangesEqTransitive!0 (array!17722 array!17722 array!17722 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20643)

(assert (=> b!296166 (= lt!431331 (arrayBitRangesEqTransitive!0 arr!273 lt!431330 (_3!1387 lt!431336) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296166 (arrayBitRangesEq!0 arr!273 lt!431330 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23302 0))(
  ( (tuple2!23303 (_1!13039 Bool) (_2!13039 BitStream!13362)) )
))
(declare-fun lt!431328 () tuple2!23302)

(declare-fun lt!431329 () Unit!20643)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17722 (_ BitVec 64) Bool) Unit!20643)

(assert (=> b!296166 (= lt!431329 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13039 lt!431328)))))

(declare-fun e!211863 () Bool)

(assert (=> b!296166 e!211863))

(declare-fun res!244514 () Bool)

(assert (=> b!296166 (=> (not res!244514) (not e!211863))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296166 (= res!244514 (= (bvsub (bvadd (bitIndex!0 (size!7679 (buf!7742 thiss!1728)) (currentByte!14263 thiss!1728) (currentBit!14258 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7679 (buf!7742 (_2!13037 lt!431336))) (currentByte!14263 (_2!13037 lt!431336)) (currentBit!14258 (_2!13037 lt!431336)))))))

(declare-fun readBitsLoop!0 (BitStream!13362 (_ BitVec 64) array!17722 (_ BitVec 64) (_ BitVec 64)) tuple3!1874)

(assert (=> b!296166 (= lt!431336 (readBitsLoop!0 (_2!13039 lt!431328) nBits!523 lt!431330 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296166 (validate_offset_bits!1 ((_ sign_extend 32) (size!7679 (buf!7742 (_2!13039 lt!431328)))) ((_ sign_extend 32) (currentByte!14263 (_2!13039 lt!431328))) ((_ sign_extend 32) (currentBit!14258 (_2!13039 lt!431328))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431334 () Unit!20643)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13362 BitStream!13362 (_ BitVec 64) (_ BitVec 64)) Unit!20643)

(assert (=> b!296166 (= lt!431334 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13039 lt!431328) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431337 () (_ BitVec 32))

(declare-fun lt!431333 () (_ BitVec 32))

(assert (=> b!296166 (= lt!431330 (array!17723 (store (arr!8738 arr!273) lt!431337 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8738 arr!273) lt!431337)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431333)))) ((_ sign_extend 24) (ite (_1!13039 lt!431328) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431333) #b00000000))))) (size!7679 arr!273)))))

(assert (=> b!296166 (= lt!431333 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296166 (= lt!431337 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13362) tuple2!23302)

(assert (=> b!296166 (= lt!431328 (readBit!0 thiss!1728))))

(declare-fun b!296167 () Bool)

(assert (=> b!296167 (= e!211867 (= lt!431335 (_1!13039 lt!431328)))))

(declare-fun b!296164 () Bool)

(declare-fun e!211866 () Bool)

(declare-fun array_inv!7291 (array!17722) Bool)

(assert (=> b!296164 (= e!211866 (array_inv!7291 (buf!7742 thiss!1728)))))

(declare-fun res!244515 () Bool)

(assert (=> start!66054 (=> (not res!244515) (not e!211865))))

(assert (=> start!66054 (= res!244515 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7679 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66054 e!211865))

(declare-fun inv!12 (BitStream!13362) Bool)

(assert (=> start!66054 (and (inv!12 thiss!1728) e!211866)))

(assert (=> start!66054 true))

(assert (=> start!66054 (array_inv!7291 arr!273)))

(declare-fun b!296168 () Bool)

(assert (=> b!296168 (= e!211863 (and (= (buf!7742 thiss!1728) (buf!7742 (_2!13037 lt!431336))) (= (size!7679 arr!273) (size!7679 (_3!1387 lt!431336)))))))

(declare-fun b!296169 () Bool)

(assert (=> b!296169 (= e!211864 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!66054 res!244515) b!296162))

(assert (= (and b!296162 res!244516) b!296163))

(assert (= (and b!296163 res!244517) b!296166))

(assert (= (and b!296166 res!244514) b!296168))

(assert (= (and b!296166 res!244518) b!296167))

(assert (= (and b!296166 (not res!244519)) b!296165))

(assert (= (and b!296165 (not res!244520)) b!296169))

(assert (= start!66054 b!296164))

(declare-fun m!434037 () Bool)

(assert (=> b!296162 m!434037))

(declare-fun m!434039 () Bool)

(assert (=> b!296164 m!434039))

(declare-fun m!434041 () Bool)

(assert (=> b!296165 m!434041))

(declare-fun m!434043 () Bool)

(assert (=> b!296166 m!434043))

(declare-fun m!434045 () Bool)

(assert (=> b!296166 m!434045))

(declare-fun m!434047 () Bool)

(assert (=> b!296166 m!434047))

(declare-fun m!434049 () Bool)

(assert (=> b!296166 m!434049))

(declare-fun m!434051 () Bool)

(assert (=> b!296166 m!434051))

(declare-fun m!434053 () Bool)

(assert (=> b!296166 m!434053))

(declare-fun m!434055 () Bool)

(assert (=> b!296166 m!434055))

(declare-fun m!434057 () Bool)

(assert (=> b!296166 m!434057))

(declare-fun m!434059 () Bool)

(assert (=> b!296166 m!434059))

(declare-fun m!434061 () Bool)

(assert (=> b!296166 m!434061))

(declare-fun m!434063 () Bool)

(assert (=> b!296166 m!434063))

(declare-fun m!434065 () Bool)

(assert (=> b!296166 m!434065))

(declare-fun m!434067 () Bool)

(assert (=> b!296166 m!434067))

(declare-fun m!434069 () Bool)

(assert (=> b!296166 m!434069))

(declare-fun m!434071 () Bool)

(assert (=> b!296166 m!434071))

(declare-fun m!434073 () Bool)

(assert (=> b!296166 m!434073))

(declare-fun m!434075 () Bool)

(assert (=> b!296166 m!434075))

(declare-fun m!434077 () Bool)

(assert (=> start!66054 m!434077))

(declare-fun m!434079 () Bool)

(assert (=> start!66054 m!434079))

(check-sat (not start!66054) (not b!296164) (not b!296166) (not b!296165) (not b!296162))
(check-sat)
