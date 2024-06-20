; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5170 () Bool)

(assert start!5170)

(declare-fun b!20855 () Bool)

(declare-fun e!14205 () Bool)

(declare-fun e!14202 () Bool)

(assert (=> b!20855 (= e!14205 e!14202)))

(declare-fun res!18104 () Bool)

(assert (=> b!20855 (=> res!18104 e!14202)))

(declare-datatypes ((array!1505 0))(
  ( (array!1506 (arr!1087 (Array (_ BitVec 32) (_ BitVec 8))) (size!643 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1120 0))(
  ( (BitStream!1121 (buf!952 array!1505) (currentByte!2241 (_ BitVec 32)) (currentBit!2236 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1120)

(declare-datatypes ((Unit!1839 0))(
  ( (Unit!1840) )
))
(declare-datatypes ((tuple2!2480 0))(
  ( (tuple2!2481 (_1!1325 Unit!1839) (_2!1325 BitStream!1120)) )
))
(declare-fun lt!29569 () tuple2!2480)

(declare-fun isPrefixOf!0 (BitStream!1120 BitStream!1120) Bool)

(assert (=> b!20855 (= res!18104 (not (isPrefixOf!0 thiss!1379 (_2!1325 lt!29569))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20855 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29575 () Unit!1839)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1120 BitStream!1120 (_ BitVec 64) (_ BitVec 64)) Unit!1839)

(assert (=> b!20855 (= lt!29575 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1325 lt!29569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1505)

(declare-fun appendBitFromByte!0 (BitStream!1120 (_ BitVec 8) (_ BitVec 32)) tuple2!2480)

(assert (=> b!20855 (= lt!29569 (appendBitFromByte!0 thiss!1379 (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20856 () Bool)

(declare-fun e!14198 () Bool)

(declare-fun lt!29568 () tuple2!2480)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!20856 (= e!14198 (invariant!0 (currentBit!2236 (_2!1325 lt!29568)) (currentByte!2241 (_2!1325 lt!29568)) (size!643 (buf!952 (_2!1325 lt!29568)))))))

(declare-fun e!14199 () Bool)

(declare-fun b!20857 () Bool)

(declare-datatypes ((tuple2!2482 0))(
  ( (tuple2!2483 (_1!1326 BitStream!1120) (_2!1326 BitStream!1120)) )
))
(declare-fun lt!29570 () tuple2!2482)

(declare-datatypes ((List!261 0))(
  ( (Nil!258) (Cons!257 (h!376 Bool) (t!1011 List!261)) )
))
(declare-fun head!98 (List!261) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1120 array!1505 (_ BitVec 64) (_ BitVec 64)) List!261)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1120 BitStream!1120 (_ BitVec 64)) List!261)

(assert (=> b!20857 (= e!14199 (= (head!98 (byteArrayBitContentToList!0 (_2!1325 lt!29569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!98 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29569) (_1!1326 lt!29570) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20858 () Bool)

(declare-fun res!18105 () Bool)

(declare-fun e!14203 () Bool)

(assert (=> b!20858 (=> (not res!18105) (not e!14203))))

(assert (=> b!20858 (= res!18105 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20859 () Bool)

(assert (=> b!20859 (= e!14203 (not e!14205))))

(declare-fun res!18102 () Bool)

(assert (=> b!20859 (=> res!18102 e!14205)))

(assert (=> b!20859 (= res!18102 (bvsge i!635 to!314))))

(assert (=> b!20859 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29573 () Unit!1839)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1120) Unit!1839)

(assert (=> b!20859 (= lt!29573 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29571 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20859 (= lt!29571 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)))))

(declare-fun b!20860 () Bool)

(assert (=> b!20860 (= e!14202 e!14198)))

(declare-fun res!18103 () Bool)

(assert (=> b!20860 (=> res!18103 e!14198)))

(assert (=> b!20860 (= res!18103 (not (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29568))))))

(assert (=> b!20860 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29568))))

(declare-fun lt!29572 () Unit!1839)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1120 BitStream!1120 BitStream!1120) Unit!1839)

(assert (=> b!20860 (= lt!29572 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1325 lt!29569) (_2!1325 lt!29568)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1120 array!1505 (_ BitVec 64) (_ BitVec 64)) tuple2!2480)

(assert (=> b!20860 (= lt!29568 (appendBitsMSBFirstLoop!0 (_2!1325 lt!29569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!20860 e!14199))

(declare-fun res!18106 () Bool)

(assert (=> b!20860 (=> (not res!18106) (not e!14199))))

(assert (=> b!20860 (= res!18106 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29574 () Unit!1839)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1120 array!1505 (_ BitVec 64)) Unit!1839)

(assert (=> b!20860 (= lt!29574 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!952 (_2!1325 lt!29569)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1120 BitStream!1120) tuple2!2482)

(assert (=> b!20860 (= lt!29570 (reader!0 thiss!1379 (_2!1325 lt!29569)))))

(declare-fun res!18107 () Bool)

(assert (=> start!5170 (=> (not res!18107) (not e!14203))))

(assert (=> start!5170 (= res!18107 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!643 srcBuffer!2))))))))

(assert (=> start!5170 e!14203))

(assert (=> start!5170 true))

(declare-fun array_inv!613 (array!1505) Bool)

(assert (=> start!5170 (array_inv!613 srcBuffer!2)))

(declare-fun e!14204 () Bool)

(declare-fun inv!12 (BitStream!1120) Bool)

(assert (=> start!5170 (and (inv!12 thiss!1379) e!14204)))

(declare-fun b!20861 () Bool)

(assert (=> b!20861 (= e!14204 (array_inv!613 (buf!952 thiss!1379)))))

(assert (= (and start!5170 res!18107) b!20858))

(assert (= (and b!20858 res!18105) b!20859))

(assert (= (and b!20859 (not res!18102)) b!20855))

(assert (= (and b!20855 (not res!18104)) b!20860))

(assert (= (and b!20860 res!18106) b!20857))

(assert (= (and b!20860 (not res!18103)) b!20856))

(assert (= start!5170 b!20861))

(declare-fun m!28605 () Bool)

(assert (=> b!20857 m!28605))

(assert (=> b!20857 m!28605))

(declare-fun m!28607 () Bool)

(assert (=> b!20857 m!28607))

(declare-fun m!28609 () Bool)

(assert (=> b!20857 m!28609))

(assert (=> b!20857 m!28609))

(declare-fun m!28611 () Bool)

(assert (=> b!20857 m!28611))

(declare-fun m!28613 () Bool)

(assert (=> b!20860 m!28613))

(declare-fun m!28615 () Bool)

(assert (=> b!20860 m!28615))

(declare-fun m!28617 () Bool)

(assert (=> b!20860 m!28617))

(declare-fun m!28619 () Bool)

(assert (=> b!20860 m!28619))

(declare-fun m!28621 () Bool)

(assert (=> b!20860 m!28621))

(declare-fun m!28623 () Bool)

(assert (=> b!20860 m!28623))

(declare-fun m!28625 () Bool)

(assert (=> b!20860 m!28625))

(declare-fun m!28627 () Bool)

(assert (=> b!20859 m!28627))

(declare-fun m!28629 () Bool)

(assert (=> b!20859 m!28629))

(declare-fun m!28631 () Bool)

(assert (=> b!20859 m!28631))

(declare-fun m!28633 () Bool)

(assert (=> b!20858 m!28633))

(declare-fun m!28635 () Bool)

(assert (=> b!20856 m!28635))

(declare-fun m!28637 () Bool)

(assert (=> b!20861 m!28637))

(declare-fun m!28639 () Bool)

(assert (=> start!5170 m!28639))

(declare-fun m!28641 () Bool)

(assert (=> start!5170 m!28641))

(declare-fun m!28643 () Bool)

(assert (=> b!20855 m!28643))

(declare-fun m!28645 () Bool)

(assert (=> b!20855 m!28645))

(declare-fun m!28647 () Bool)

(assert (=> b!20855 m!28647))

(declare-fun m!28649 () Bool)

(assert (=> b!20855 m!28649))

(assert (=> b!20855 m!28645))

(declare-fun m!28651 () Bool)

(assert (=> b!20855 m!28651))

(push 1)

(assert (not b!20855))

(assert (not b!20858))

(assert (not b!20856))

(assert (not b!20861))

(assert (not b!20859))

(assert (not b!20857))

(assert (not start!5170))

(assert (not b!20860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6648 () Bool)

(assert (=> d!6648 (= (head!98 (byteArrayBitContentToList!0 (_2!1325 lt!29569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!376 (byteArrayBitContentToList!0 (_2!1325 lt!29569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!20857 d!6648))

(declare-fun d!6652 () Bool)

(declare-fun c!1462 () Bool)

(assert (=> d!6652 (= c!1462 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!14260 () List!261)

(assert (=> d!6652 (= (byteArrayBitContentToList!0 (_2!1325 lt!29569) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!14260)))

(declare-fun b!20914 () Bool)

(assert (=> b!20914 (= e!14260 Nil!258)))

(declare-fun b!20915 () Bool)

(assert (=> b!20915 (= e!14260 (Cons!257 (not (= (bvand ((_ sign_extend 24) (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1325 lt!29569) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6652 c!1462) b!20914))

(assert (= (and d!6652 (not c!1462)) b!20915))

(assert (=> b!20915 m!28645))

(declare-fun m!28753 () Bool)

(assert (=> b!20915 m!28753))

(declare-fun m!28755 () Bool)

(assert (=> b!20915 m!28755))

(assert (=> b!20857 d!6652))

(declare-fun d!6654 () Bool)

(assert (=> d!6654 (= (head!98 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29569) (_1!1326 lt!29570) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!376 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29569) (_1!1326 lt!29570) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!20857 d!6654))

(declare-fun b!20932 () Bool)

(declare-fun e!14270 () Bool)

(declare-fun lt!29637 () List!261)

(declare-fun isEmpty!55 (List!261) Bool)

(assert (=> b!20932 (= e!14270 (isEmpty!55 lt!29637))))

(declare-fun b!20931 () Bool)

(declare-datatypes ((tuple2!2492 0))(
  ( (tuple2!2493 (_1!1331 List!261) (_2!1331 BitStream!1120)) )
))
(declare-fun e!14269 () tuple2!2492)

(declare-fun lt!29636 () (_ BitVec 64))

(declare-datatypes ((tuple2!2494 0))(
  ( (tuple2!2495 (_1!1332 Bool) (_2!1332 BitStream!1120)) )
))
(declare-fun lt!29638 () tuple2!2494)

(assert (=> b!20931 (= e!14269 (tuple2!2493 (Cons!257 (_1!1332 lt!29638) (bitStreamReadBitsIntoList!0 (_2!1325 lt!29569) (_2!1332 lt!29638) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!29636))) (_2!1332 lt!29638)))))

(declare-fun readBit!0 (BitStream!1120) tuple2!2494)

(assert (=> b!20931 (= lt!29638 (readBit!0 (_1!1326 lt!29570)))))

(assert (=> b!20931 (= lt!29636 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!6656 () Bool)

(assert (=> d!6656 e!14270))

(declare-fun c!1467 () Bool)

(assert (=> d!6656 (= c!1467 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6656 (= lt!29637 (_1!1331 e!14269))))

(declare-fun c!1468 () Bool)

(assert (=> d!6656 (= c!1468 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6656 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6656 (= (bitStreamReadBitsIntoList!0 (_2!1325 lt!29569) (_1!1326 lt!29570) #b0000000000000000000000000000000000000000000000000000000000000001) lt!29637)))

(declare-fun b!20933 () Bool)

(declare-fun length!50 (List!261) Int)

(assert (=> b!20933 (= e!14270 (> (length!50 lt!29637) 0))))

(declare-fun b!20930 () Bool)

(assert (=> b!20930 (= e!14269 (tuple2!2493 Nil!258 (_1!1326 lt!29570)))))

(assert (= (and d!6656 c!1468) b!20930))

(assert (= (and d!6656 (not c!1468)) b!20931))

(assert (= (and d!6656 c!1467) b!20932))

(assert (= (and d!6656 (not c!1467)) b!20933))

(declare-fun m!28767 () Bool)

(assert (=> b!20932 m!28767))

(declare-fun m!28769 () Bool)

(assert (=> b!20931 m!28769))

(declare-fun m!28771 () Bool)

(assert (=> b!20931 m!28771))

(declare-fun m!28773 () Bool)

(assert (=> b!20933 m!28773))

(assert (=> b!20857 d!6656))

(declare-fun d!6664 () Bool)

(assert (=> d!6664 (= (array_inv!613 (buf!952 thiss!1379)) (bvsge (size!643 (buf!952 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!20861 d!6664))

(declare-fun d!6668 () Bool)

(assert (=> d!6668 (= (invariant!0 (currentBit!2236 (_2!1325 lt!29568)) (currentByte!2241 (_2!1325 lt!29568)) (size!643 (buf!952 (_2!1325 lt!29568)))) (and (bvsge (currentBit!2236 (_2!1325 lt!29568)) #b00000000000000000000000000000000) (bvslt (currentBit!2236 (_2!1325 lt!29568)) #b00000000000000000000000000001000) (bvsge (currentByte!2241 (_2!1325 lt!29568)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2241 (_2!1325 lt!29568)) (size!643 (buf!952 (_2!1325 lt!29568)))) (and (= (currentBit!2236 (_2!1325 lt!29568)) #b00000000000000000000000000000000) (= (currentByte!2241 (_2!1325 lt!29568)) (size!643 (buf!952 (_2!1325 lt!29568))))))))))

(assert (=> b!20856 d!6668))

(declare-fun d!6670 () Bool)

(assert (=> d!6670 (= (array_inv!613 srcBuffer!2) (bvsge (size!643 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5170 d!6670))

(declare-fun d!6672 () Bool)

(assert (=> d!6672 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2236 thiss!1379) (currentByte!2241 thiss!1379) (size!643 (buf!952 thiss!1379))))))

(declare-fun bs!1976 () Bool)

(assert (= bs!1976 d!6672))

(declare-fun m!28775 () Bool)

(assert (=> bs!1976 m!28775))

(assert (=> start!5170 d!6672))

(declare-fun d!6674 () Bool)

(declare-fun res!18173 () Bool)

(declare-fun e!14281 () Bool)

(assert (=> d!6674 (=> (not res!18173) (not e!14281))))

(assert (=> d!6674 (= res!18173 (= (size!643 (buf!952 thiss!1379)) (size!643 (buf!952 (_2!1325 lt!29569)))))))

(assert (=> d!6674 (= (isPrefixOf!0 thiss!1379 (_2!1325 lt!29569)) e!14281)))

(declare-fun b!20949 () Bool)

(declare-fun res!18171 () Bool)

(assert (=> b!20949 (=> (not res!18171) (not e!14281))))

(assert (=> b!20949 (= res!18171 (bvsle (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)) (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569)))))))

(declare-fun b!20950 () Bool)

(declare-fun e!14282 () Bool)

(assert (=> b!20950 (= e!14281 e!14282)))

(declare-fun res!18172 () Bool)

(assert (=> b!20950 (=> res!18172 e!14282)))

(assert (=> b!20950 (= res!18172 (= (size!643 (buf!952 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20951 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1505 array!1505 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20951 (= e!14282 (arrayBitRangesEq!0 (buf!952 thiss!1379) (buf!952 (_2!1325 lt!29569)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379))))))

(assert (= (and d!6674 res!18173) b!20949))

(assert (= (and b!20949 res!18171) b!20950))

(assert (= (and b!20950 (not res!18172)) b!20951))

(assert (=> b!20949 m!28631))

(declare-fun m!28781 () Bool)

(assert (=> b!20949 m!28781))

(assert (=> b!20951 m!28631))

(assert (=> b!20951 m!28631))

(declare-fun m!28783 () Bool)

(assert (=> b!20951 m!28783))

(assert (=> b!20855 d!6674))

(declare-fun d!6680 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1979 () Bool)

(assert (= bs!1979 d!6680))

(declare-fun m!28785 () Bool)

(assert (=> bs!1979 m!28785))

(assert (=> b!20855 d!6680))

(declare-fun d!6682 () Bool)

(declare-fun e!14285 () Bool)

(assert (=> d!6682 e!14285))

(declare-fun res!18176 () Bool)

(assert (=> d!6682 (=> (not res!18176) (not e!14285))))

(assert (=> d!6682 (= res!18176 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!29644 () Unit!1839)

(declare-fun choose!27 (BitStream!1120 BitStream!1120 (_ BitVec 64) (_ BitVec 64)) Unit!1839)

(assert (=> d!6682 (= lt!29644 (choose!27 thiss!1379 (_2!1325 lt!29569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6682 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6682 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1325 lt!29569) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!29644)))

(declare-fun b!20954 () Bool)

(assert (=> b!20954 (= e!14285 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6682 res!18176) b!20954))

(declare-fun m!28787 () Bool)

(assert (=> d!6682 m!28787))

(assert (=> b!20954 m!28649))

(assert (=> b!20855 d!6682))

(declare-fun b!20999 () Bool)

(declare-fun res!18219 () Bool)

(declare-fun e!14308 () Bool)

(assert (=> b!20999 (=> (not res!18219) (not e!14308))))

(declare-fun lt!29758 () (_ BitVec 64))

(declare-fun lt!29757 () tuple2!2480)

(declare-fun lt!29761 () (_ BitVec 64))

(assert (=> b!20999 (= res!18219 (= (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29757))) (currentByte!2241 (_2!1325 lt!29757)) (currentBit!2236 (_2!1325 lt!29757))) (bvadd lt!29761 lt!29758)))))

(assert (=> b!20999 (or (not (= (bvand lt!29761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!29758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!29761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!29761 lt!29758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20999 (= lt!29758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!20999 (= lt!29761 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)))))

(declare-fun b!21000 () Bool)

(declare-fun e!14310 () Bool)

(assert (=> b!21000 (= e!14308 e!14310)))

(declare-fun res!18218 () Bool)

(assert (=> b!21000 (=> (not res!18218) (not e!14310))))

(declare-datatypes ((tuple2!2496 0))(
  ( (tuple2!2497 (_1!1333 BitStream!1120) (_2!1333 Bool)) )
))
(declare-fun lt!29756 () tuple2!2496)

(declare-fun lt!29754 () (_ BitVec 8))

(assert (=> b!21000 (= res!18218 (and (= (_2!1333 lt!29756) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!29754)) #b00000000000000000000000000000000))) (= (_1!1333 lt!29756) (_2!1325 lt!29757))))))

(declare-datatypes ((tuple2!2498 0))(
  ( (tuple2!2499 (_1!1334 array!1505) (_2!1334 BitStream!1120)) )
))
(declare-fun lt!29759 () tuple2!2498)

(declare-fun lt!29760 () BitStream!1120)

(declare-fun readBits!0 (BitStream!1120 (_ BitVec 64)) tuple2!2498)

(assert (=> b!21000 (= lt!29759 (readBits!0 lt!29760 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1120) tuple2!2496)

(assert (=> b!21000 (= lt!29756 (readBitPure!0 lt!29760))))

(declare-fun readerFrom!0 (BitStream!1120 (_ BitVec 32) (_ BitVec 32)) BitStream!1120)

(assert (=> b!21000 (= lt!29760 (readerFrom!0 (_2!1325 lt!29757) (currentBit!2236 thiss!1379) (currentByte!2241 thiss!1379)))))

(declare-fun b!21001 () Bool)

(assert (=> b!21001 (= e!14310 (= (bitIndex!0 (size!643 (buf!952 (_1!1333 lt!29756))) (currentByte!2241 (_1!1333 lt!29756)) (currentBit!2236 (_1!1333 lt!29756))) (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29757))) (currentByte!2241 (_2!1325 lt!29757)) (currentBit!2236 (_2!1325 lt!29757)))))))

(declare-fun b!21002 () Bool)

(declare-fun res!18216 () Bool)

(assert (=> b!21002 (=> (not res!18216) (not e!14308))))

(assert (=> b!21002 (= res!18216 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29757)))))

(declare-fun b!21003 () Bool)

(declare-fun res!18214 () Bool)

(declare-fun e!14311 () Bool)

(assert (=> b!21003 (=> (not res!18214) (not e!14311))))

(declare-fun lt!29752 () tuple2!2480)

(assert (=> b!21003 (= res!18214 (= (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29752))) (currentByte!2241 (_2!1325 lt!29752)) (currentBit!2236 (_2!1325 lt!29752))) (bvadd (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!21004 () Bool)

(declare-fun e!14309 () Bool)

(declare-fun lt!29751 () tuple2!2496)

(assert (=> b!21004 (= e!14309 (= (bitIndex!0 (size!643 (buf!952 (_1!1333 lt!29751))) (currentByte!2241 (_1!1333 lt!29751)) (currentBit!2236 (_1!1333 lt!29751))) (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29752))) (currentByte!2241 (_2!1325 lt!29752)) (currentBit!2236 (_2!1325 lt!29752)))))))

(declare-fun b!21005 () Bool)

(declare-fun res!18221 () Bool)

(assert (=> b!21005 (=> (not res!18221) (not e!14311))))

(assert (=> b!21005 (= res!18221 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29752)))))

(declare-fun b!21006 () Bool)

(assert (=> b!21006 (= e!14311 e!14309)))

(declare-fun res!18215 () Bool)

(assert (=> b!21006 (=> (not res!18215) (not e!14309))))

(declare-fun lt!29755 () Bool)

(assert (=> b!21006 (= res!18215 (and (= (_2!1333 lt!29751) lt!29755) (= (_1!1333 lt!29751) (_2!1325 lt!29752))))))

(assert (=> b!21006 (= lt!29751 (readBitPure!0 (readerFrom!0 (_2!1325 lt!29752) (currentBit!2236 thiss!1379) (currentByte!2241 thiss!1379))))))

(declare-fun d!6684 () Bool)

(assert (=> d!6684 e!14308))

(declare-fun res!18217 () Bool)

(assert (=> d!6684 (=> (not res!18217) (not e!14308))))

(assert (=> d!6684 (= res!18217 (= (size!643 (buf!952 (_2!1325 lt!29757))) (size!643 (buf!952 thiss!1379))))))

(declare-fun lt!29753 () array!1505)

(assert (=> d!6684 (= lt!29754 (select (arr!1087 lt!29753) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6684 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!643 lt!29753)))))

(assert (=> d!6684 (= lt!29753 (array!1506 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!29750 () tuple2!2480)

(assert (=> d!6684 (= lt!29757 (tuple2!2481 (_1!1325 lt!29750) (_2!1325 lt!29750)))))

(assert (=> d!6684 (= lt!29750 lt!29752)))

(assert (=> d!6684 e!14311))

(declare-fun res!18220 () Bool)

(assert (=> d!6684 (=> (not res!18220) (not e!14311))))

(assert (=> d!6684 (= res!18220 (= (size!643 (buf!952 thiss!1379)) (size!643 (buf!952 (_2!1325 lt!29752)))))))

(declare-fun appendBit!0 (BitStream!1120 Bool) tuple2!2480)

(assert (=> d!6684 (= lt!29752 (appendBit!0 thiss!1379 lt!29755))))

(assert (=> d!6684 (= lt!29755 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6684 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6684 (= (appendBitFromByte!0 thiss!1379 (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!29757)))

(assert (= (and d!6684 res!18220) b!21003))

(assert (= (and b!21003 res!18214) b!21005))

(assert (= (and b!21005 res!18221) b!21006))

(assert (= (and b!21006 res!18215) b!21004))

(assert (= (and d!6684 res!18217) b!20999))

(assert (= (and b!20999 res!18219) b!21002))

(assert (= (and b!21002 res!18216) b!21000))

(assert (= (and b!21000 res!18218) b!21001))

(declare-fun m!28827 () Bool)

(assert (=> b!21001 m!28827))

(declare-fun m!28829 () Bool)

(assert (=> b!21001 m!28829))

(declare-fun m!28831 () Bool)

(assert (=> b!21000 m!28831))

(declare-fun m!28833 () Bool)

(assert (=> b!21000 m!28833))

(declare-fun m!28835 () Bool)

(assert (=> b!21000 m!28835))

(declare-fun m!28837 () Bool)

(assert (=> b!21006 m!28837))

(assert (=> b!21006 m!28837))

(declare-fun m!28839 () Bool)

(assert (=> b!21006 m!28839))

(declare-fun m!28841 () Bool)

(assert (=> b!21005 m!28841))

(declare-fun m!28843 () Bool)

(assert (=> b!21003 m!28843))

(assert (=> b!21003 m!28631))

(declare-fun m!28845 () Bool)

(assert (=> b!21004 m!28845))

(assert (=> b!21004 m!28843))

(declare-fun m!28847 () Bool)

(assert (=> d!6684 m!28847))

(declare-fun m!28849 () Bool)

(assert (=> d!6684 m!28849))

(assert (=> d!6684 m!28753))

(assert (=> b!20999 m!28829))

(assert (=> b!20999 m!28631))

(declare-fun m!28851 () Bool)

(assert (=> b!21002 m!28851))

(assert (=> b!20855 d!6684))

(declare-fun d!6696 () Bool)

(assert (=> d!6696 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29568))))

(declare-fun lt!29774 () Unit!1839)

(declare-fun choose!30 (BitStream!1120 BitStream!1120 BitStream!1120) Unit!1839)

(assert (=> d!6696 (= lt!29774 (choose!30 thiss!1379 (_2!1325 lt!29569) (_2!1325 lt!29568)))))

(assert (=> d!6696 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29569))))

(assert (=> d!6696 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1325 lt!29569) (_2!1325 lt!29568)) lt!29774)))

(declare-fun bs!1981 () Bool)

(assert (= bs!1981 d!6696))

(assert (=> bs!1981 m!28619))

(declare-fun m!28853 () Bool)

(assert (=> bs!1981 m!28853))

(assert (=> bs!1981 m!28643))

(assert (=> b!20860 d!6696))

(declare-fun d!6698 () Bool)

(declare-fun e!14335 () Bool)

(assert (=> d!6698 e!14335))

(declare-fun res!18265 () Bool)

(assert (=> d!6698 (=> (not res!18265) (not e!14335))))

(declare-fun lt!29977 () tuple2!2480)

(declare-fun lt!30011 () (_ BitVec 64))

(assert (=> d!6698 (= res!18265 (= (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29977))) (currentByte!2241 (_2!1325 lt!29977)) (currentBit!2236 (_2!1325 lt!29977))) (bvsub lt!30011 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6698 (or (= (bvand lt!30011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30011 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!29976 () (_ BitVec 64))

(assert (=> d!6698 (= lt!30011 (bvadd lt!29976 to!314))))

(assert (=> d!6698 (or (not (= (bvand lt!29976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!29976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!29976 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6698 (= lt!29976 (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569))))))

(declare-fun e!14334 () tuple2!2480)

(assert (=> d!6698 (= lt!29977 e!14334)))

(declare-fun c!1476 () Bool)

(assert (=> d!6698 (= c!1476 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!30014 () Unit!1839)

(declare-fun lt!29984 () Unit!1839)

(assert (=> d!6698 (= lt!30014 lt!29984)))

(assert (=> d!6698 (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29569))))

(assert (=> d!6698 (= lt!29984 (lemmaIsPrefixRefl!0 (_2!1325 lt!29569)))))

(declare-fun lt!29981 () (_ BitVec 64))

(assert (=> d!6698 (= lt!29981 (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569))))))

(assert (=> d!6698 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6698 (= (appendBitsMSBFirstLoop!0 (_2!1325 lt!29569) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!29977)))

(declare-fun b!21055 () Bool)

(declare-fun res!18264 () Bool)

(assert (=> b!21055 (=> (not res!18264) (not e!14335))))

(assert (=> b!21055 (= res!18264 (= (size!643 (buf!952 (_2!1325 lt!29977))) (size!643 (buf!952 (_2!1325 lt!29569)))))))

(declare-fun b!21056 () Bool)

(declare-fun res!18261 () Bool)

(assert (=> b!21056 (=> (not res!18261) (not e!14335))))

(assert (=> b!21056 (= res!18261 (= (size!643 (buf!952 (_2!1325 lt!29569))) (size!643 (buf!952 (_2!1325 lt!29977)))))))

(declare-fun b!21057 () Bool)

(declare-fun Unit!1845 () Unit!1839)

(assert (=> b!21057 (= e!14334 (tuple2!2481 Unit!1845 (_2!1325 lt!29569)))))

(assert (=> b!21057 (= (size!643 (buf!952 (_2!1325 lt!29569))) (size!643 (buf!952 (_2!1325 lt!29569))))))

(declare-fun lt!29987 () Unit!1839)

(declare-fun Unit!1846 () Unit!1839)

(assert (=> b!21057 (= lt!29987 Unit!1846)))

(declare-fun call!298 () tuple2!2482)

(declare-fun checkByteArrayBitContent!0 (BitStream!1120 array!1505 array!1505 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21057 (checkByteArrayBitContent!0 (_2!1325 lt!29569) srcBuffer!2 (_1!1334 (readBits!0 (_1!1326 call!298) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!21058 () Bool)

(declare-fun res!18263 () Bool)

(assert (=> b!21058 (=> (not res!18263) (not e!14335))))

(assert (=> b!21058 (= res!18263 (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29977)))))

(declare-fun b!21059 () Bool)

(declare-fun lt!29971 () tuple2!2482)

(assert (=> b!21059 (= e!14335 (= (bitStreamReadBitsIntoList!0 (_2!1325 lt!29977) (_1!1326 lt!29971) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1325 lt!29977) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21059 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21059 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!29973 () Unit!1839)

(declare-fun lt!29989 () Unit!1839)

(assert (=> b!21059 (= lt!29973 lt!29989)))

(declare-fun lt!29975 () (_ BitVec 64))

(assert (=> b!21059 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29977)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) lt!29975)))

(assert (=> b!21059 (= lt!29989 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1325 lt!29569) (buf!952 (_2!1325 lt!29977)) lt!29975))))

(declare-fun e!14336 () Bool)

(assert (=> b!21059 e!14336))

(declare-fun res!18262 () Bool)

(assert (=> b!21059 (=> (not res!18262) (not e!14336))))

(assert (=> b!21059 (= res!18262 (and (= (size!643 (buf!952 (_2!1325 lt!29569))) (size!643 (buf!952 (_2!1325 lt!29977)))) (bvsge lt!29975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21059 (= lt!29975 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21059 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21059 (= lt!29971 (reader!0 (_2!1325 lt!29569) (_2!1325 lt!29977)))))

(declare-fun b!21060 () Bool)

(declare-fun res!18266 () Bool)

(assert (=> b!21060 (=> (not res!18266) (not e!14335))))

(assert (=> b!21060 (= res!18266 (invariant!0 (currentBit!2236 (_2!1325 lt!29977)) (currentByte!2241 (_2!1325 lt!29977)) (size!643 (buf!952 (_2!1325 lt!29977)))))))

(declare-fun b!21061 () Bool)

(declare-fun lt!29978 () tuple2!2480)

(declare-fun Unit!1847 () Unit!1839)

(assert (=> b!21061 (= e!14334 (tuple2!2481 Unit!1847 (_2!1325 lt!29978)))))

(declare-fun lt!29997 () tuple2!2480)

(assert (=> b!21061 (= lt!29997 (appendBitFromByte!0 (_2!1325 lt!29569) (select (arr!1087 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!29985 () (_ BitVec 64))

(assert (=> b!21061 (= lt!29985 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!29980 () (_ BitVec 64))

(assert (=> b!21061 (= lt!29980 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!29974 () Unit!1839)

(assert (=> b!21061 (= lt!29974 (validateOffsetBitsIneqLemma!0 (_2!1325 lt!29569) (_2!1325 lt!29997) lt!29985 lt!29980))))

(assert (=> b!21061 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29997)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29997))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29997))) (bvsub lt!29985 lt!29980))))

(declare-fun lt!29998 () Unit!1839)

(assert (=> b!21061 (= lt!29998 lt!29974)))

(declare-fun lt!29991 () tuple2!2482)

(assert (=> b!21061 (= lt!29991 (reader!0 (_2!1325 lt!29569) (_2!1325 lt!29997)))))

(declare-fun lt!30010 () (_ BitVec 64))

(assert (=> b!21061 (= lt!30010 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!29972 () Unit!1839)

(assert (=> b!21061 (= lt!29972 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1325 lt!29569) (buf!952 (_2!1325 lt!29997)) lt!30010))))

(assert (=> b!21061 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29997)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) lt!30010)))

(declare-fun lt!30006 () Unit!1839)

(assert (=> b!21061 (= lt!30006 lt!29972)))

(assert (=> b!21061 (= (head!98 (byteArrayBitContentToList!0 (_2!1325 lt!29997) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!98 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29997) (_1!1326 lt!29991) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!29979 () Unit!1839)

(declare-fun Unit!1848 () Unit!1839)

(assert (=> b!21061 (= lt!29979 Unit!1848)))

(assert (=> b!21061 (= lt!29978 (appendBitsMSBFirstLoop!0 (_2!1325 lt!29997) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!30003 () Unit!1839)

(assert (=> b!21061 (= lt!30003 (lemmaIsPrefixTransitive!0 (_2!1325 lt!29569) (_2!1325 lt!29997) (_2!1325 lt!29978)))))

(assert (=> b!21061 (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29978))))

(declare-fun lt!29990 () Unit!1839)

(assert (=> b!21061 (= lt!29990 lt!30003)))

(assert (=> b!21061 (= (size!643 (buf!952 (_2!1325 lt!29978))) (size!643 (buf!952 (_2!1325 lt!29569))))))

(declare-fun lt!30002 () Unit!1839)

(declare-fun Unit!1849 () Unit!1839)

(assert (=> b!21061 (= lt!30002 Unit!1849)))

(assert (=> b!21061 (= (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29978))) (currentByte!2241 (_2!1325 lt!29978)) (currentBit!2236 (_2!1325 lt!29978))) (bvsub (bvadd (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!29994 () Unit!1839)

(declare-fun Unit!1850 () Unit!1839)

(assert (=> b!21061 (= lt!29994 Unit!1850)))

(assert (=> b!21061 (= (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29978))) (currentByte!2241 (_2!1325 lt!29978)) (currentBit!2236 (_2!1325 lt!29978))) (bvsub (bvsub (bvadd (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29997))) (currentByte!2241 (_2!1325 lt!29997)) (currentBit!2236 (_2!1325 lt!29997))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30007 () Unit!1839)

(declare-fun Unit!1851 () Unit!1839)

(assert (=> b!21061 (= lt!30007 Unit!1851)))

(declare-fun lt!30000 () tuple2!2482)

(assert (=> b!21061 (= lt!30000 call!298)))

(declare-fun lt!29988 () (_ BitVec 64))

(assert (=> b!21061 (= lt!29988 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!30008 () Unit!1839)

(assert (=> b!21061 (= lt!30008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1325 lt!29569) (buf!952 (_2!1325 lt!29978)) lt!29988))))

(assert (=> b!21061 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29978)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) lt!29988)))

(declare-fun lt!29983 () Unit!1839)

(assert (=> b!21061 (= lt!29983 lt!30008)))

(declare-fun lt!30005 () tuple2!2482)

(assert (=> b!21061 (= lt!30005 (reader!0 (_2!1325 lt!29997) (_2!1325 lt!29978)))))

(declare-fun lt!30009 () (_ BitVec 64))

(assert (=> b!21061 (= lt!30009 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30013 () Unit!1839)

(assert (=> b!21061 (= lt!30013 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1325 lt!29997) (buf!952 (_2!1325 lt!29978)) lt!30009))))

(assert (=> b!21061 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29978)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29997))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29997))) lt!30009)))

(declare-fun lt!29992 () Unit!1839)

(assert (=> b!21061 (= lt!29992 lt!30013)))

(declare-fun lt!29999 () List!261)

(assert (=> b!21061 (= lt!29999 (byteArrayBitContentToList!0 (_2!1325 lt!29978) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!30004 () List!261)

(assert (=> b!21061 (= lt!30004 (byteArrayBitContentToList!0 (_2!1325 lt!29978) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!29995 () List!261)

(assert (=> b!21061 (= lt!29995 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29978) (_1!1326 lt!30000) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!29982 () List!261)

(assert (=> b!21061 (= lt!29982 (bitStreamReadBitsIntoList!0 (_2!1325 lt!29978) (_1!1326 lt!30005) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!29986 () (_ BitVec 64))

(assert (=> b!21061 (= lt!29986 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!29993 () Unit!1839)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1120 BitStream!1120 BitStream!1120 BitStream!1120 (_ BitVec 64) List!261) Unit!1839)

(assert (=> b!21061 (= lt!29993 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1325 lt!29978) (_2!1325 lt!29978) (_1!1326 lt!30000) (_1!1326 lt!30005) lt!29986 lt!29995))))

(declare-fun tail!76 (List!261) List!261)

(assert (=> b!21061 (= (bitStreamReadBitsIntoList!0 (_2!1325 lt!29978) (_1!1326 lt!30005) (bvsub lt!29986 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!76 lt!29995))))

(declare-fun lt!30001 () Unit!1839)

(assert (=> b!21061 (= lt!30001 lt!29993)))

(declare-fun lt!29996 () Unit!1839)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1505 array!1505 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1839)

(assert (=> b!21061 (= lt!29996 (arrayBitRangesEqImpliesEq!0 (buf!952 (_2!1325 lt!29997)) (buf!952 (_2!1325 lt!29978)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!29981 (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29997))) (currentByte!2241 (_2!1325 lt!29997)) (currentBit!2236 (_2!1325 lt!29997)))))))

(declare-fun bitAt!0 (array!1505 (_ BitVec 64)) Bool)

(assert (=> b!21061 (= (bitAt!0 (buf!952 (_2!1325 lt!29997)) lt!29981) (bitAt!0 (buf!952 (_2!1325 lt!29978)) lt!29981))))

(declare-fun lt!30012 () Unit!1839)

(assert (=> b!21061 (= lt!30012 lt!29996)))

(declare-fun bm!295 () Bool)

(assert (=> bm!295 (= call!298 (reader!0 (_2!1325 lt!29569) (ite c!1476 (_2!1325 lt!29978) (_2!1325 lt!29569))))))

(declare-fun b!21062 () Bool)

(assert (=> b!21062 (= e!14336 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 (_2!1325 lt!29569))) ((_ sign_extend 32) (currentBit!2236 (_2!1325 lt!29569))) lt!29975))))

(assert (= (and d!6698 c!1476) b!21061))

(assert (= (and d!6698 (not c!1476)) b!21057))

(assert (= (or b!21061 b!21057) bm!295))

(assert (= (and d!6698 res!18265) b!21060))

(assert (= (and b!21060 res!18266) b!21056))

(assert (= (and b!21056 res!18261) b!21058))

(assert (= (and b!21058 res!18263) b!21055))

(assert (= (and b!21055 res!18264) b!21059))

(assert (= (and b!21059 res!18262) b!21062))

(declare-fun m!28893 () Bool)

(assert (=> d!6698 m!28893))

(assert (=> d!6698 m!28781))

(declare-fun m!28895 () Bool)

(assert (=> d!6698 m!28895))

(declare-fun m!28897 () Bool)

(assert (=> d!6698 m!28897))

(declare-fun m!28899 () Bool)

(assert (=> bm!295 m!28899))

(declare-fun m!28901 () Bool)

(assert (=> b!21058 m!28901))

(declare-fun m!28903 () Bool)

(assert (=> b!21059 m!28903))

(declare-fun m!28905 () Bool)

(assert (=> b!21059 m!28905))

(declare-fun m!28907 () Bool)

(assert (=> b!21059 m!28907))

(declare-fun m!28909 () Bool)

(assert (=> b!21059 m!28909))

(declare-fun m!28911 () Bool)

(assert (=> b!21059 m!28911))

(declare-fun m!28913 () Bool)

(assert (=> b!21060 m!28913))

(declare-fun m!28915 () Bool)

(assert (=> b!21062 m!28915))

(declare-fun m!28917 () Bool)

(assert (=> b!21057 m!28917))

(declare-fun m!28919 () Bool)

(assert (=> b!21057 m!28919))

(declare-fun m!28921 () Bool)

(assert (=> b!21061 m!28921))

(declare-fun m!28923 () Bool)

(assert (=> b!21061 m!28923))

(declare-fun m!28925 () Bool)

(assert (=> b!21061 m!28925))

(declare-fun m!28927 () Bool)

(assert (=> b!21061 m!28927))

(declare-fun m!28929 () Bool)

(assert (=> b!21061 m!28929))

(declare-fun m!28931 () Bool)

(assert (=> b!21061 m!28931))

(declare-fun m!28933 () Bool)

(assert (=> b!21061 m!28933))

(declare-fun m!28935 () Bool)

(assert (=> b!21061 m!28935))

(declare-fun m!28937 () Bool)

(assert (=> b!21061 m!28937))

(declare-fun m!28939 () Bool)

(assert (=> b!21061 m!28939))

(declare-fun m!28941 () Bool)

(assert (=> b!21061 m!28941))

(declare-fun m!28943 () Bool)

(assert (=> b!21061 m!28943))

(declare-fun m!28945 () Bool)

(assert (=> b!21061 m!28945))

(declare-fun m!28947 () Bool)

(assert (=> b!21061 m!28947))

(assert (=> b!21061 m!28781))

(declare-fun m!28949 () Bool)

(assert (=> b!21061 m!28949))

(declare-fun m!28951 () Bool)

(assert (=> b!21061 m!28951))

(declare-fun m!28953 () Bool)

(assert (=> b!21061 m!28953))

(declare-fun m!28955 () Bool)

(assert (=> b!21061 m!28955))

(declare-fun m!28957 () Bool)

(assert (=> b!21061 m!28957))

(declare-fun m!28959 () Bool)

(assert (=> b!21061 m!28959))

(declare-fun m!28961 () Bool)

(assert (=> b!21061 m!28961))

(declare-fun m!28963 () Bool)

(assert (=> b!21061 m!28963))

(declare-fun m!28965 () Bool)

(assert (=> b!21061 m!28965))

(assert (=> b!21061 m!28925))

(declare-fun m!28967 () Bool)

(assert (=> b!21061 m!28967))

(assert (=> b!21061 m!28931))

(declare-fun m!28969 () Bool)

(assert (=> b!21061 m!28969))

(assert (=> b!21061 m!28963))

(declare-fun m!28971 () Bool)

(assert (=> b!21061 m!28971))

(declare-fun m!28973 () Bool)

(assert (=> b!21061 m!28973))

(declare-fun m!28975 () Bool)

(assert (=> b!21061 m!28975))

(assert (=> b!21061 m!28959))

(declare-fun m!28977 () Bool)

(assert (=> b!21061 m!28977))

(declare-fun m!28979 () Bool)

(assert (=> b!21061 m!28979))

(declare-fun m!28981 () Bool)

(assert (=> b!21061 m!28981))

(assert (=> b!20860 d!6698))

(declare-fun d!6710 () Bool)

(declare-fun res!18281 () Bool)

(declare-fun e!14341 () Bool)

(assert (=> d!6710 (=> (not res!18281) (not e!14341))))

(assert (=> d!6710 (= res!18281 (= (size!643 (buf!952 thiss!1379)) (size!643 (buf!952 (_2!1325 lt!29568)))))))

(assert (=> d!6710 (= (isPrefixOf!0 thiss!1379 (_2!1325 lt!29568)) e!14341)))

(declare-fun b!21075 () Bool)

(declare-fun res!18279 () Bool)

(assert (=> b!21075 (=> (not res!18279) (not e!14341))))

(assert (=> b!21075 (= res!18279 (bvsle (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)) (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29568))) (currentByte!2241 (_2!1325 lt!29568)) (currentBit!2236 (_2!1325 lt!29568)))))))

(declare-fun b!21076 () Bool)

(declare-fun e!14342 () Bool)

(assert (=> b!21076 (= e!14341 e!14342)))

(declare-fun res!18280 () Bool)

(assert (=> b!21076 (=> res!18280 e!14342)))

(assert (=> b!21076 (= res!18280 (= (size!643 (buf!952 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21077 () Bool)

(assert (=> b!21077 (= e!14342 (arrayBitRangesEq!0 (buf!952 thiss!1379) (buf!952 (_2!1325 lt!29568)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379))))))

(assert (= (and d!6710 res!18281) b!21075))

(assert (= (and b!21075 res!18279) b!21076))

(assert (= (and b!21076 (not res!18280)) b!21077))

(assert (=> b!21075 m!28631))

(declare-fun m!28983 () Bool)

(assert (=> b!21075 m!28983))

(assert (=> b!21077 m!28631))

(assert (=> b!21077 m!28631))

(declare-fun m!28985 () Bool)

(assert (=> b!21077 m!28985))

(assert (=> b!20860 d!6710))

(declare-fun d!6712 () Bool)

(declare-fun res!18284 () Bool)

(declare-fun e!14343 () Bool)

(assert (=> d!6712 (=> (not res!18284) (not e!14343))))

(assert (=> d!6712 (= res!18284 (= (size!643 (buf!952 (_2!1325 lt!29569))) (size!643 (buf!952 (_2!1325 lt!29568)))))))

(assert (=> d!6712 (= (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29568)) e!14343)))

(declare-fun b!21078 () Bool)

(declare-fun res!18282 () Bool)

(assert (=> b!21078 (=> (not res!18282) (not e!14343))))

(assert (=> b!21078 (= res!18282 (bvsle (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569))) (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29568))) (currentByte!2241 (_2!1325 lt!29568)) (currentBit!2236 (_2!1325 lt!29568)))))))

(declare-fun b!21079 () Bool)

(declare-fun e!14344 () Bool)

(assert (=> b!21079 (= e!14343 e!14344)))

(declare-fun res!18283 () Bool)

(assert (=> b!21079 (=> res!18283 e!14344)))

(assert (=> b!21079 (= res!18283 (= (size!643 (buf!952 (_2!1325 lt!29569))) #b00000000000000000000000000000000))))

(declare-fun b!21080 () Bool)

(assert (=> b!21080 (= e!14344 (arrayBitRangesEq!0 (buf!952 (_2!1325 lt!29569)) (buf!952 (_2!1325 lt!29568)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569)))))))

(assert (= (and d!6712 res!18284) b!21078))

(assert (= (and b!21078 res!18282) b!21079))

(assert (= (and b!21079 (not res!18283)) b!21080))

(assert (=> b!21078 m!28781))

(assert (=> b!21078 m!28983))

(assert (=> b!21080 m!28781))

(assert (=> b!21080 m!28781))

(declare-fun m!28987 () Bool)

(assert (=> b!21080 m!28987))

(assert (=> b!20860 d!6712))

(declare-fun d!6714 () Bool)

(assert (=> d!6714 (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!30029 () Unit!1839)

(declare-fun choose!9 (BitStream!1120 array!1505 (_ BitVec 64) BitStream!1120) Unit!1839)

(assert (=> d!6714 (= lt!30029 (choose!9 thiss!1379 (buf!952 (_2!1325 lt!29569)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1121 (buf!952 (_2!1325 lt!29569)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379))))))

(assert (=> d!6714 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!952 (_2!1325 lt!29569)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!30029)))

(declare-fun bs!1985 () Bool)

(assert (= bs!1985 d!6714))

(assert (=> bs!1985 m!28623))

(declare-fun m!28989 () Bool)

(assert (=> bs!1985 m!28989))

(assert (=> b!20860 d!6714))

(declare-fun b!21115 () Bool)

(declare-fun res!18311 () Bool)

(declare-fun e!14359 () Bool)

(assert (=> b!21115 (=> (not res!18311) (not e!14359))))

(declare-fun lt!30202 () tuple2!2482)

(assert (=> b!21115 (= res!18311 (isPrefixOf!0 (_2!1326 lt!30202) (_2!1325 lt!29569)))))

(declare-fun b!21116 () Bool)

(declare-fun e!14358 () Unit!1839)

(declare-fun lt!30211 () Unit!1839)

(assert (=> b!21116 (= e!14358 lt!30211)))

(declare-fun lt!30208 () (_ BitVec 64))

(assert (=> b!21116 (= lt!30208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!30221 () (_ BitVec 64))

(assert (=> b!21116 (= lt!30221 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1505 array!1505 (_ BitVec 64) (_ BitVec 64)) Unit!1839)

(assert (=> b!21116 (= lt!30211 (arrayBitRangesEqSymmetric!0 (buf!952 thiss!1379) (buf!952 (_2!1325 lt!29569)) lt!30208 lt!30221))))

(assert (=> b!21116 (arrayBitRangesEq!0 (buf!952 (_2!1325 lt!29569)) (buf!952 thiss!1379) lt!30208 lt!30221)))

(declare-fun lt!30214 () (_ BitVec 64))

(declare-fun lt!30213 () (_ BitVec 64))

(declare-fun b!21117 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1120 (_ BitVec 64)) BitStream!1120)

(assert (=> b!21117 (= e!14359 (= (_1!1326 lt!30202) (withMovedBitIndex!0 (_2!1326 lt!30202) (bvsub lt!30214 lt!30213))))))

(assert (=> b!21117 (or (= (bvand lt!30214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30214 lt!30213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21117 (= lt!30213 (bitIndex!0 (size!643 (buf!952 (_2!1325 lt!29569))) (currentByte!2241 (_2!1325 lt!29569)) (currentBit!2236 (_2!1325 lt!29569))))))

(assert (=> b!21117 (= lt!30214 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)))))

(declare-fun b!21118 () Bool)

(declare-fun res!18309 () Bool)

(assert (=> b!21118 (=> (not res!18309) (not e!14359))))

(assert (=> b!21118 (= res!18309 (isPrefixOf!0 (_1!1326 lt!30202) thiss!1379))))

(declare-fun b!21119 () Bool)

(declare-fun Unit!1854 () Unit!1839)

(assert (=> b!21119 (= e!14358 Unit!1854)))

(declare-fun d!6716 () Bool)

(assert (=> d!6716 e!14359))

(declare-fun res!18310 () Bool)

(assert (=> d!6716 (=> (not res!18310) (not e!14359))))

(assert (=> d!6716 (= res!18310 (isPrefixOf!0 (_1!1326 lt!30202) (_2!1326 lt!30202)))))

(declare-fun lt!30210 () BitStream!1120)

(assert (=> d!6716 (= lt!30202 (tuple2!2483 lt!30210 (_2!1325 lt!29569)))))

(declare-fun lt!30209 () Unit!1839)

(declare-fun lt!30219 () Unit!1839)

(assert (=> d!6716 (= lt!30209 lt!30219)))

(assert (=> d!6716 (isPrefixOf!0 lt!30210 (_2!1325 lt!29569))))

(assert (=> d!6716 (= lt!30219 (lemmaIsPrefixTransitive!0 lt!30210 (_2!1325 lt!29569) (_2!1325 lt!29569)))))

(declare-fun lt!30215 () Unit!1839)

(declare-fun lt!30212 () Unit!1839)

(assert (=> d!6716 (= lt!30215 lt!30212)))

(assert (=> d!6716 (isPrefixOf!0 lt!30210 (_2!1325 lt!29569))))

(assert (=> d!6716 (= lt!30212 (lemmaIsPrefixTransitive!0 lt!30210 thiss!1379 (_2!1325 lt!29569)))))

(declare-fun lt!30220 () Unit!1839)

(assert (=> d!6716 (= lt!30220 e!14358)))

(declare-fun c!1482 () Bool)

(assert (=> d!6716 (= c!1482 (not (= (size!643 (buf!952 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!30217 () Unit!1839)

(declare-fun lt!30206 () Unit!1839)

(assert (=> d!6716 (= lt!30217 lt!30206)))

(assert (=> d!6716 (isPrefixOf!0 (_2!1325 lt!29569) (_2!1325 lt!29569))))

(assert (=> d!6716 (= lt!30206 (lemmaIsPrefixRefl!0 (_2!1325 lt!29569)))))

(declare-fun lt!30207 () Unit!1839)

(declare-fun lt!30205 () Unit!1839)

(assert (=> d!6716 (= lt!30207 lt!30205)))

(assert (=> d!6716 (= lt!30205 (lemmaIsPrefixRefl!0 (_2!1325 lt!29569)))))

(declare-fun lt!30204 () Unit!1839)

(declare-fun lt!30218 () Unit!1839)

(assert (=> d!6716 (= lt!30204 lt!30218)))

(assert (=> d!6716 (isPrefixOf!0 lt!30210 lt!30210)))

(assert (=> d!6716 (= lt!30218 (lemmaIsPrefixRefl!0 lt!30210))))

(declare-fun lt!30216 () Unit!1839)

(declare-fun lt!30203 () Unit!1839)

(assert (=> d!6716 (= lt!30216 lt!30203)))

(assert (=> d!6716 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6716 (= lt!30203 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6716 (= lt!30210 (BitStream!1121 (buf!952 (_2!1325 lt!29569)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)))))

(assert (=> d!6716 (isPrefixOf!0 thiss!1379 (_2!1325 lt!29569))))

(assert (=> d!6716 (= (reader!0 thiss!1379 (_2!1325 lt!29569)) lt!30202)))

(assert (= (and d!6716 c!1482) b!21116))

(assert (= (and d!6716 (not c!1482)) b!21119))

(assert (= (and d!6716 res!18310) b!21118))

(assert (= (and b!21118 res!18309) b!21115))

(assert (= (and b!21115 res!18311) b!21117))

(declare-fun m!29081 () Bool)

(assert (=> b!21118 m!29081))

(declare-fun m!29083 () Bool)

(assert (=> b!21115 m!29083))

(assert (=> b!21116 m!28631))

(declare-fun m!29085 () Bool)

(assert (=> b!21116 m!29085))

(declare-fun m!29087 () Bool)

(assert (=> b!21116 m!29087))

(assert (=> d!6716 m!28629))

(assert (=> d!6716 m!28643))

(assert (=> d!6716 m!28627))

(declare-fun m!29089 () Bool)

(assert (=> d!6716 m!29089))

(declare-fun m!29091 () Bool)

(assert (=> d!6716 m!29091))

(assert (=> d!6716 m!28895))

(declare-fun m!29093 () Bool)

(assert (=> d!6716 m!29093))

(assert (=> d!6716 m!28897))

(declare-fun m!29095 () Bool)

(assert (=> d!6716 m!29095))

(declare-fun m!29097 () Bool)

(assert (=> d!6716 m!29097))

(declare-fun m!29099 () Bool)

(assert (=> d!6716 m!29099))

(declare-fun m!29101 () Bool)

(assert (=> b!21117 m!29101))

(assert (=> b!21117 m!28781))

(assert (=> b!21117 m!28631))

(assert (=> b!20860 d!6716))

(declare-fun d!6720 () Bool)

(assert (=> d!6720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!643 (buf!952 (_2!1325 lt!29569)))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1986 () Bool)

(assert (= bs!1986 d!6720))

(declare-fun m!29103 () Bool)

(assert (=> bs!1986 m!29103))

(assert (=> b!20860 d!6720))

(declare-fun d!6722 () Bool)

(assert (=> d!6722 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1987 () Bool)

(assert (= bs!1987 d!6722))

(declare-fun m!29105 () Bool)

(assert (=> bs!1987 m!29105))

(assert (=> b!20858 d!6722))

(declare-fun d!6724 () Bool)

(declare-fun res!18314 () Bool)

(declare-fun e!14360 () Bool)

(assert (=> d!6724 (=> (not res!18314) (not e!14360))))

(assert (=> d!6724 (= res!18314 (= (size!643 (buf!952 thiss!1379)) (size!643 (buf!952 thiss!1379))))))

(assert (=> d!6724 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14360)))

(declare-fun b!21120 () Bool)

(declare-fun res!18312 () Bool)

(assert (=> b!21120 (=> (not res!18312) (not e!14360))))

(assert (=> b!21120 (= res!18312 (bvsle (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)) (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379))))))

(declare-fun b!21121 () Bool)

(declare-fun e!14361 () Bool)

(assert (=> b!21121 (= e!14360 e!14361)))

(declare-fun res!18313 () Bool)

(assert (=> b!21121 (=> res!18313 e!14361)))

(assert (=> b!21121 (= res!18313 (= (size!643 (buf!952 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21122 () Bool)

(assert (=> b!21122 (= e!14361 (arrayBitRangesEq!0 (buf!952 thiss!1379) (buf!952 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379))))))

(assert (= (and d!6724 res!18314) b!21120))

(assert (= (and b!21120 res!18312) b!21121))

(assert (= (and b!21121 (not res!18313)) b!21122))

(assert (=> b!21120 m!28631))

(assert (=> b!21120 m!28631))

(assert (=> b!21122 m!28631))

(assert (=> b!21122 m!28631))

(declare-fun m!29107 () Bool)

(assert (=> b!21122 m!29107))

(assert (=> b!20859 d!6724))

(declare-fun d!6726 () Bool)

(assert (=> d!6726 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!30308 () Unit!1839)

(declare-fun choose!11 (BitStream!1120) Unit!1839)

(assert (=> d!6726 (= lt!30308 (choose!11 thiss!1379))))

(assert (=> d!6726 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!30308)))

(declare-fun bs!1989 () Bool)

(assert (= bs!1989 d!6726))

(assert (=> bs!1989 m!28627))

(declare-fun m!29109 () Bool)

(assert (=> bs!1989 m!29109))

(assert (=> b!20859 d!6726))

(declare-fun d!6728 () Bool)

(declare-fun e!14379 () Bool)

(assert (=> d!6728 e!14379))

(declare-fun res!18341 () Bool)

(assert (=> d!6728 (=> (not res!18341) (not e!14379))))

(declare-fun lt!30345 () (_ BitVec 64))

(declare-fun lt!30341 () (_ BitVec 64))

(declare-fun lt!30344 () (_ BitVec 64))

(assert (=> d!6728 (= res!18341 (= lt!30345 (bvsub lt!30341 lt!30344)))))

(assert (=> d!6728 (or (= (bvand lt!30341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30341 lt!30344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6728 (= lt!30344 (remainingBits!0 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))) ((_ sign_extend 32) (currentByte!2241 thiss!1379)) ((_ sign_extend 32) (currentBit!2236 thiss!1379))))))

(declare-fun lt!30342 () (_ BitVec 64))

(declare-fun lt!30346 () (_ BitVec 64))

(assert (=> d!6728 (= lt!30341 (bvmul lt!30342 lt!30346))))

(assert (=> d!6728 (or (= lt!30342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!30346 (bvsdiv (bvmul lt!30342 lt!30346) lt!30342)))))

(assert (=> d!6728 (= lt!30346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6728 (= lt!30342 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))))))

(assert (=> d!6728 (= lt!30345 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2241 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2236 thiss!1379))))))

(assert (=> d!6728 (invariant!0 (currentBit!2236 thiss!1379) (currentByte!2241 thiss!1379) (size!643 (buf!952 thiss!1379)))))

(assert (=> d!6728 (= (bitIndex!0 (size!643 (buf!952 thiss!1379)) (currentByte!2241 thiss!1379) (currentBit!2236 thiss!1379)) lt!30345)))

(declare-fun b!21160 () Bool)

(declare-fun res!18340 () Bool)

(assert (=> b!21160 (=> (not res!18340) (not e!14379))))

(assert (=> b!21160 (= res!18340 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!30345))))

(declare-fun b!21161 () Bool)

(declare-fun lt!30343 () (_ BitVec 64))

(assert (=> b!21161 (= e!14379 (bvsle lt!30345 (bvmul lt!30343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21161 (or (= lt!30343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!30343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!30343)))))

(assert (=> b!21161 (= lt!30343 ((_ sign_extend 32) (size!643 (buf!952 thiss!1379))))))

(assert (= (and d!6728 res!18341) b!21160))

(assert (= (and b!21160 res!18340) b!21161))

(assert (=> d!6728 m!29105))

(assert (=> d!6728 m!28775))

(assert (=> b!20859 d!6728))

(push 1)

(assert (not d!6720))

(assert (not d!6722))

(assert (not b!21061))

(assert (not b!20954))

(assert (not b!21116))

(assert (not d!6682))

(assert (not b!20999))

(assert (not b!20931))

(assert (not b!21115))

(assert (not d!6714))

(assert (not d!6672))

(assert (not b!21062))

(assert (not b!21059))

(assert (not d!6728))

(assert (not b!21078))

(assert (not b!21005))

(assert (not b!21003))

(assert (not b!21004))

(assert (not b!21077))

(assert (not b!21002))

(assert (not b!21006))

(assert (not b!21058))

(assert (not d!6726))

(assert (not b!21001))

(assert (not b!21080))

(assert (not b!21000))

(assert (not b!21057))

(assert (not b!20933))

(assert (not bm!295))

(assert (not d!6696))

(assert (not b!20915))

(assert (not b!21120))

(assert (not b!20949))

(assert (not b!20951))

(assert (not b!20932))

(assert (not d!6680))

(assert (not d!6684))

(assert (not d!6698))

(assert (not b!21075))

(assert (not b!21122))

(assert (not b!21118))

(assert (not b!21060))

(assert (not d!6716))

(assert (not b!21117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

