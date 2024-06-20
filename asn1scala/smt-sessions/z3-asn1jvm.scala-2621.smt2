; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64644 () Bool)

(assert start!64644)

(declare-fun b!290273 () Bool)

(declare-fun res!239813 () Bool)

(declare-fun e!206729 () Bool)

(assert (=> b!290273 (=> (not res!239813) (not e!206729))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290273 (= res!239813 (bvslt from!505 to!474))))

(declare-fun b!290274 () Bool)

(declare-datatypes ((array!17233 0))(
  ( (array!17234 (arr!8462 (Array (_ BitVec 32) (_ BitVec 8))) (size!7460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12930 0))(
  ( (BitStream!12931 (buf!7526 array!17233) (currentByte!13933 (_ BitVec 32)) (currentBit!13928 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20161 0))(
  ( (Unit!20162) )
))
(declare-datatypes ((tuple3!1664 0))(
  ( (tuple3!1665 (_1!12643 Unit!20161) (_2!12643 BitStream!12930) (_3!1246 array!17233)) )
))
(declare-fun lt!421039 () tuple3!1664)

(assert (=> b!290274 (= e!206729 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7460 (_3!1246 lt!421039)))))))))

(declare-fun lt!421037 () array!17233)

(declare-fun bitAt!0 (array!17233 (_ BitVec 64)) Bool)

(assert (=> b!290274 (= (bitAt!0 lt!421037 from!505) (bitAt!0 (_3!1246 lt!421039) from!505))))

(declare-fun lt!421042 () Unit!20161)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17233 array!17233 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20161)

(assert (=> b!290274 (= lt!421042 (arrayBitRangesEqImpliesEq!0 lt!421037 (_3!1246 lt!421039) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17233)

(declare-fun arrayBitRangesEq!0 (array!17233 array!17233 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290274 (arrayBitRangesEq!0 arr!273 (_3!1246 lt!421039) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421041 () Unit!20161)

(declare-fun arrayBitRangesEqTransitive!0 (array!17233 array!17233 array!17233 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20161)

(assert (=> b!290274 (= lt!421041 (arrayBitRangesEqTransitive!0 arr!273 lt!421037 (_3!1246 lt!421039) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290274 (arrayBitRangesEq!0 arr!273 lt!421037 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421040 () Unit!20161)

(declare-datatypes ((tuple2!22794 0))(
  ( (tuple2!22795 (_1!12644 Bool) (_2!12644 BitStream!12930)) )
))
(declare-fun lt!421044 () tuple2!22794)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17233 (_ BitVec 64) Bool) Unit!20161)

(assert (=> b!290274 (= lt!421040 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12644 lt!421044)))))

(declare-fun e!206732 () Bool)

(assert (=> b!290274 e!206732))

(declare-fun res!239812 () Bool)

(assert (=> b!290274 (=> (not res!239812) (not e!206732))))

(declare-fun thiss!1728 () BitStream!12930)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290274 (= res!239812 (= (bvsub (bvadd (bitIndex!0 (size!7460 (buf!7526 thiss!1728)) (currentByte!13933 thiss!1728) (currentBit!13928 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7460 (buf!7526 (_2!12643 lt!421039))) (currentByte!13933 (_2!12643 lt!421039)) (currentBit!13928 (_2!12643 lt!421039)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12930 (_ BitVec 64) array!17233 (_ BitVec 64) (_ BitVec 64)) tuple3!1664)

(assert (=> b!290274 (= lt!421039 (readBitsLoop!0 (_2!12644 lt!421044) nBits!523 lt!421037 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290274 (validate_offset_bits!1 ((_ sign_extend 32) (size!7460 (buf!7526 (_2!12644 lt!421044)))) ((_ sign_extend 32) (currentByte!13933 (_2!12644 lt!421044))) ((_ sign_extend 32) (currentBit!13928 (_2!12644 lt!421044))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421036 () Unit!20161)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12930 BitStream!12930 (_ BitVec 64) (_ BitVec 64)) Unit!20161)

(assert (=> b!290274 (= lt!421036 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12644 lt!421044) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421043 () (_ BitVec 32))

(declare-fun lt!421038 () (_ BitVec 32))

(assert (=> b!290274 (= lt!421037 (array!17234 (store (arr!8462 arr!273) lt!421043 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8462 arr!273) lt!421043)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421038)))) ((_ sign_extend 24) (ite (_1!12644 lt!421044) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421038) #b00000000))))) (size!7460 arr!273)))))

(assert (=> b!290274 (= lt!421038 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290274 (= lt!421043 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12930) tuple2!22794)

(assert (=> b!290274 (= lt!421044 (readBit!0 thiss!1728))))

(declare-fun b!290275 () Bool)

(declare-fun e!206731 () Bool)

(declare-fun array_inv!7072 (array!17233) Bool)

(assert (=> b!290275 (= e!206731 (array_inv!7072 (buf!7526 thiss!1728)))))

(declare-fun b!290276 () Bool)

(declare-fun res!239811 () Bool)

(assert (=> b!290276 (=> (not res!239811) (not e!206729))))

(assert (=> b!290276 (= res!239811 (validate_offset_bits!1 ((_ sign_extend 32) (size!7460 (buf!7526 thiss!1728))) ((_ sign_extend 32) (currentByte!13933 thiss!1728)) ((_ sign_extend 32) (currentBit!13928 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239810 () Bool)

(assert (=> start!64644 (=> (not res!239810) (not e!206729))))

(assert (=> start!64644 (= res!239810 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7460 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64644 e!206729))

(declare-fun inv!12 (BitStream!12930) Bool)

(assert (=> start!64644 (and (inv!12 thiss!1728) e!206731)))

(assert (=> start!64644 true))

(assert (=> start!64644 (array_inv!7072 arr!273)))

(declare-fun b!290277 () Bool)

(assert (=> b!290277 (= e!206732 (and (= (buf!7526 thiss!1728) (buf!7526 (_2!12643 lt!421039))) (= (size!7460 arr!273) (size!7460 (_3!1246 lt!421039)))))))

(assert (= (and start!64644 res!239810) b!290276))

(assert (= (and b!290276 res!239811) b!290273))

(assert (= (and b!290273 res!239813) b!290274))

(assert (= (and b!290274 res!239812) b!290277))

(assert (= start!64644 b!290275))

(declare-fun m!424175 () Bool)

(assert (=> b!290274 m!424175))

(declare-fun m!424177 () Bool)

(assert (=> b!290274 m!424177))

(declare-fun m!424179 () Bool)

(assert (=> b!290274 m!424179))

(declare-fun m!424181 () Bool)

(assert (=> b!290274 m!424181))

(declare-fun m!424183 () Bool)

(assert (=> b!290274 m!424183))

(declare-fun m!424185 () Bool)

(assert (=> b!290274 m!424185))

(declare-fun m!424187 () Bool)

(assert (=> b!290274 m!424187))

(declare-fun m!424189 () Bool)

(assert (=> b!290274 m!424189))

(declare-fun m!424191 () Bool)

(assert (=> b!290274 m!424191))

(declare-fun m!424193 () Bool)

(assert (=> b!290274 m!424193))

(declare-fun m!424195 () Bool)

(assert (=> b!290274 m!424195))

(declare-fun m!424197 () Bool)

(assert (=> b!290274 m!424197))

(declare-fun m!424199 () Bool)

(assert (=> b!290274 m!424199))

(declare-fun m!424201 () Bool)

(assert (=> b!290274 m!424201))

(declare-fun m!424203 () Bool)

(assert (=> b!290274 m!424203))

(declare-fun m!424205 () Bool)

(assert (=> b!290274 m!424205))

(declare-fun m!424207 () Bool)

(assert (=> b!290275 m!424207))

(declare-fun m!424209 () Bool)

(assert (=> b!290276 m!424209))

(declare-fun m!424211 () Bool)

(assert (=> start!64644 m!424211))

(declare-fun m!424213 () Bool)

(assert (=> start!64644 m!424213))

(check-sat (not b!290274) (not b!290275) (not b!290276) (not start!64644))
(check-sat)
