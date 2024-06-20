; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5736 () Bool)

(assert start!5736)

(declare-fun b!25092 () Bool)

(declare-fun e!17176 () Bool)

(declare-datatypes ((array!1659 0))(
  ( (array!1660 (arr!1171 (Array (_ BitVec 32) (_ BitVec 8))) (size!715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1262 0))(
  ( (BitStream!1263 (buf!1036 array!1659) (currentByte!2349 (_ BitVec 32)) (currentBit!2344 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1262)

(declare-fun array_inv!684 (array!1659) Bool)

(assert (=> b!25092 (= e!17176 (array_inv!684 (buf!1036 thiss!1379)))))

(declare-fun b!25093 () Bool)

(declare-fun res!21708 () Bool)

(declare-fun e!17166 () Bool)

(assert (=> b!25093 (=> res!21708 e!17166)))

(declare-datatypes ((Unit!2073 0))(
  ( (Unit!2074) )
))
(declare-datatypes ((tuple2!2842 0))(
  ( (tuple2!2843 (_1!1508 Unit!2073) (_2!1508 BitStream!1262)) )
))
(declare-fun lt!35573 () tuple2!2842)

(declare-fun lt!35576 () tuple2!2842)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25093 (= res!21708 (not (invariant!0 (currentBit!2344 (_2!1508 lt!35573)) (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35576))))))))

(declare-fun b!25094 () Bool)

(declare-fun res!21698 () Bool)

(declare-fun e!17175 () Bool)

(assert (=> b!25094 (=> res!21698 e!17175)))

(assert (=> b!25094 (= res!21698 (not (invariant!0 (currentBit!2344 (_2!1508 lt!35576)) (currentByte!2349 (_2!1508 lt!35576)) (size!715 (buf!1036 (_2!1508 lt!35576))))))))

(declare-datatypes ((tuple2!2844 0))(
  ( (tuple2!2845 (_1!1509 BitStream!1262) (_2!1509 BitStream!1262)) )
))
(declare-fun lt!35571 () tuple2!2844)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!25095 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25095 (= e!17166 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_1!1509 lt!35571)))) ((_ sign_extend 32) (currentByte!2349 (_1!1509 lt!35571))) ((_ sign_extend 32) (currentBit!2344 (_1!1509 lt!35571))) (bvsub to!314 i!635)))))

(declare-fun lt!35574 () (_ BitVec 64))

(assert (=> b!25095 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!35574)))

(declare-fun lt!35570 () Unit!2073)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1262 array!1659 (_ BitVec 64)) Unit!2073)

(assert (=> b!25095 (= lt!35570 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!35576)) lt!35574))))

(declare-fun lt!35578 () tuple2!2844)

(declare-fun reader!0 (BitStream!1262 BitStream!1262) tuple2!2844)

(assert (=> b!25095 (= lt!35578 (reader!0 (_2!1508 lt!35573) (_2!1508 lt!35576)))))

(assert (=> b!25095 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35581 () Unit!2073)

(assert (=> b!25095 (= lt!35581 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1036 (_2!1508 lt!35576)) (bvsub to!314 i!635)))))

(assert (=> b!25095 (= lt!35571 (reader!0 thiss!1379 (_2!1508 lt!35576)))))

(declare-fun b!25096 () Bool)

(declare-fun res!21701 () Bool)

(declare-fun e!17169 () Bool)

(assert (=> b!25096 (=> (not res!21701) (not e!17169))))

(assert (=> b!25096 (= res!21701 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!21702 () Bool)

(assert (=> start!5736 (=> (not res!21702) (not e!17169))))

(declare-fun srcBuffer!2 () array!1659)

(assert (=> start!5736 (= res!21702 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!715 srcBuffer!2))))))))

(assert (=> start!5736 e!17169))

(assert (=> start!5736 true))

(assert (=> start!5736 (array_inv!684 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1262) Bool)

(assert (=> start!5736 (and (inv!12 thiss!1379) e!17176)))

(declare-fun b!25097 () Bool)

(declare-fun e!17170 () Bool)

(assert (=> b!25097 (= e!17169 (not e!17170))))

(declare-fun res!21703 () Bool)

(assert (=> b!25097 (=> res!21703 e!17170)))

(assert (=> b!25097 (= res!21703 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1262 BitStream!1262) Bool)

(assert (=> b!25097 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35580 () Unit!2073)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1262) Unit!2073)

(assert (=> b!25097 (= lt!35580 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!35572 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25097 (= lt!35572 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(declare-fun b!25098 () Bool)

(declare-fun e!17168 () Bool)

(declare-fun e!17174 () Bool)

(assert (=> b!25098 (= e!17168 e!17174)))

(declare-fun res!21697 () Bool)

(assert (=> b!25098 (=> res!21697 e!17174)))

(assert (=> b!25098 (= res!21697 (not (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35576))))))

(assert (=> b!25098 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35576))))

(declare-fun lt!35577 () Unit!2073)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1262 BitStream!1262 BitStream!1262) Unit!2073)

(assert (=> b!25098 (= lt!35577 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1508 lt!35573) (_2!1508 lt!35576)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1262 array!1659 (_ BitVec 64) (_ BitVec 64)) tuple2!2842)

(assert (=> b!25098 (= lt!35576 (appendBitsMSBFirstLoop!0 (_2!1508 lt!35573) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!17167 () Bool)

(assert (=> b!25098 e!17167))

(declare-fun res!21696 () Bool)

(assert (=> b!25098 (=> (not res!21696) (not e!17167))))

(assert (=> b!25098 (= res!21696 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35569 () Unit!2073)

(assert (=> b!25098 (= lt!35569 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1036 (_2!1508 lt!35573)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35579 () tuple2!2844)

(assert (=> b!25098 (= lt!35579 (reader!0 thiss!1379 (_2!1508 lt!35573)))))

(declare-fun b!25099 () Bool)

(declare-fun res!21699 () Bool)

(assert (=> b!25099 (=> res!21699 e!17175)))

(assert (=> b!25099 (= res!21699 (not (= (size!715 (buf!1036 thiss!1379)) (size!715 (buf!1036 (_2!1508 lt!35576))))))))

(declare-fun lt!35568 () (_ BitVec 64))

(declare-fun e!17172 () Bool)

(declare-fun b!25100 () Bool)

(assert (=> b!25100 (= e!17172 (= lt!35568 (bvsub (bvsub (bvadd (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25101 () Bool)

(assert (=> b!25101 (= e!17170 e!17168)))

(declare-fun res!21704 () Bool)

(assert (=> b!25101 (=> res!21704 e!17168)))

(assert (=> b!25101 (= res!21704 (not (isPrefixOf!0 thiss!1379 (_2!1508 lt!35573))))))

(assert (=> b!25101 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!35574)))

(assert (=> b!25101 (= lt!35574 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35575 () Unit!2073)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1262 BitStream!1262 (_ BitVec 64) (_ BitVec 64)) Unit!2073)

(assert (=> b!25101 (= lt!35575 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1508 lt!35573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1262 (_ BitVec 8) (_ BitVec 32)) tuple2!2842)

(assert (=> b!25101 (= lt!35573 (appendBitFromByte!0 thiss!1379 (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25102 () Bool)

(assert (=> b!25102 (= e!17175 e!17166)))

(declare-fun res!21700 () Bool)

(assert (=> b!25102 (=> res!21700 e!17166)))

(assert (=> b!25102 (= res!21700 (not (= (size!715 (buf!1036 (_2!1508 lt!35573))) (size!715 (buf!1036 (_2!1508 lt!35576))))))))

(assert (=> b!25102 e!17172))

(declare-fun res!21707 () Bool)

(assert (=> b!25102 (=> (not res!21707) (not e!17172))))

(assert (=> b!25102 (= res!21707 (= (size!715 (buf!1036 (_2!1508 lt!35576))) (size!715 (buf!1036 thiss!1379))))))

(declare-fun b!25103 () Bool)

(declare-datatypes ((List!332 0))(
  ( (Nil!329) (Cons!328 (h!447 Bool) (t!1082 List!332)) )
))
(declare-fun head!169 (List!332) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1262 array!1659 (_ BitVec 64) (_ BitVec 64)) List!332)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1262 BitStream!1262 (_ BitVec 64)) List!332)

(assert (=> b!25103 (= e!17167 (= (head!169 (byteArrayBitContentToList!0 (_2!1508 lt!35573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!169 (bitStreamReadBitsIntoList!0 (_2!1508 lt!35573) (_1!1509 lt!35579) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25104 () Bool)

(declare-fun res!21705 () Bool)

(assert (=> b!25104 (=> res!21705 e!17166)))

(assert (=> b!25104 (= res!21705 (not (invariant!0 (currentBit!2344 (_2!1508 lt!35573)) (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35573))))))))

(declare-fun b!25105 () Bool)

(assert (=> b!25105 (= e!17174 e!17175)))

(declare-fun res!21706 () Bool)

(assert (=> b!25105 (=> res!21706 e!17175)))

(assert (=> b!25105 (= res!21706 (not (= lt!35568 (bvsub (bvadd lt!35572 to!314) i!635))))))

(assert (=> b!25105 (= lt!35568 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576))))))

(assert (= (and start!5736 res!21702) b!25096))

(assert (= (and b!25096 res!21701) b!25097))

(assert (= (and b!25097 (not res!21703)) b!25101))

(assert (= (and b!25101 (not res!21704)) b!25098))

(assert (= (and b!25098 res!21696) b!25103))

(assert (= (and b!25098 (not res!21697)) b!25105))

(assert (= (and b!25105 (not res!21706)) b!25094))

(assert (= (and b!25094 (not res!21698)) b!25099))

(assert (= (and b!25099 (not res!21699)) b!25102))

(assert (= (and b!25102 res!21707) b!25100))

(assert (= (and b!25102 (not res!21700)) b!25104))

(assert (= (and b!25104 (not res!21705)) b!25093))

(assert (= (and b!25093 (not res!21708)) b!25095))

(assert (= start!5736 b!25092))

(declare-fun m!35573 () Bool)

(assert (=> start!5736 m!35573))

(declare-fun m!35575 () Bool)

(assert (=> start!5736 m!35575))

(declare-fun m!35577 () Bool)

(assert (=> b!25095 m!35577))

(declare-fun m!35579 () Bool)

(assert (=> b!25095 m!35579))

(declare-fun m!35581 () Bool)

(assert (=> b!25095 m!35581))

(declare-fun m!35583 () Bool)

(assert (=> b!25095 m!35583))

(declare-fun m!35585 () Bool)

(assert (=> b!25095 m!35585))

(declare-fun m!35587 () Bool)

(assert (=> b!25095 m!35587))

(declare-fun m!35589 () Bool)

(assert (=> b!25095 m!35589))

(declare-fun m!35591 () Bool)

(assert (=> b!25098 m!35591))

(declare-fun m!35593 () Bool)

(assert (=> b!25098 m!35593))

(declare-fun m!35595 () Bool)

(assert (=> b!25098 m!35595))

(declare-fun m!35597 () Bool)

(assert (=> b!25098 m!35597))

(declare-fun m!35599 () Bool)

(assert (=> b!25098 m!35599))

(declare-fun m!35601 () Bool)

(assert (=> b!25098 m!35601))

(declare-fun m!35603 () Bool)

(assert (=> b!25098 m!35603))

(declare-fun m!35605 () Bool)

(assert (=> b!25094 m!35605))

(declare-fun m!35607 () Bool)

(assert (=> b!25105 m!35607))

(declare-fun m!35609 () Bool)

(assert (=> b!25101 m!35609))

(declare-fun m!35611 () Bool)

(assert (=> b!25101 m!35611))

(declare-fun m!35613 () Bool)

(assert (=> b!25101 m!35613))

(declare-fun m!35615 () Bool)

(assert (=> b!25101 m!35615))

(assert (=> b!25101 m!35609))

(declare-fun m!35617 () Bool)

(assert (=> b!25101 m!35617))

(declare-fun m!35619 () Bool)

(assert (=> b!25097 m!35619))

(declare-fun m!35621 () Bool)

(assert (=> b!25097 m!35621))

(declare-fun m!35623 () Bool)

(assert (=> b!25097 m!35623))

(declare-fun m!35625 () Bool)

(assert (=> b!25104 m!35625))

(declare-fun m!35627 () Bool)

(assert (=> b!25092 m!35627))

(declare-fun m!35629 () Bool)

(assert (=> b!25103 m!35629))

(assert (=> b!25103 m!35629))

(declare-fun m!35631 () Bool)

(assert (=> b!25103 m!35631))

(declare-fun m!35633 () Bool)

(assert (=> b!25103 m!35633))

(assert (=> b!25103 m!35633))

(declare-fun m!35635 () Bool)

(assert (=> b!25103 m!35635))

(declare-fun m!35637 () Bool)

(assert (=> b!25100 m!35637))

(declare-fun m!35639 () Bool)

(assert (=> b!25096 m!35639))

(declare-fun m!35641 () Bool)

(assert (=> b!25093 m!35641))

(push 1)

(assert (not b!25094))

(assert (not b!25101))

(assert (not b!25098))

(assert (not b!25095))

(assert (not b!25100))

(assert (not b!25096))

(assert (not b!25092))

(assert (not b!25103))

(assert (not b!25104))

(assert (not start!5736))

(assert (not b!25097))

(assert (not b!25105))

(assert (not b!25093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7522 () Bool)

(assert (=> d!7522 (= (array_inv!684 (buf!1036 thiss!1379)) (bvsge (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!25092 d!7522))

(declare-fun d!7524 () Bool)

(assert (=> d!7524 (= (head!169 (byteArrayBitContentToList!0 (_2!1508 lt!35573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!447 (byteArrayBitContentToList!0 (_2!1508 lt!35573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25103 d!7524))

(declare-fun d!7526 () Bool)

(declare-fun c!1685 () Bool)

(assert (=> d!7526 (= c!1685 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!17240 () List!332)

(assert (=> d!7526 (= (byteArrayBitContentToList!0 (_2!1508 lt!35573) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!17240)))

(declare-fun b!25226 () Bool)

(assert (=> b!25226 (= e!17240 Nil!329)))

(declare-fun b!25227 () Bool)

(assert (=> b!25227 (= e!17240 (Cons!328 (not (= (bvand ((_ sign_extend 24) (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1508 lt!35573) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7526 c!1685) b!25226))

(assert (= (and d!7526 (not c!1685)) b!25227))

(assert (=> b!25227 m!35609))

(declare-fun m!35805 () Bool)

(assert (=> b!25227 m!35805))

(declare-fun m!35807 () Bool)

(assert (=> b!25227 m!35807))

(assert (=> b!25103 d!7526))

(declare-fun d!7528 () Bool)

(assert (=> d!7528 (= (head!169 (bitStreamReadBitsIntoList!0 (_2!1508 lt!35573) (_1!1509 lt!35579) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!447 (bitStreamReadBitsIntoList!0 (_2!1508 lt!35573) (_1!1509 lt!35579) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!25103 d!7528))

(declare-fun d!7530 () Bool)

(declare-fun e!17245 () Bool)

(assert (=> d!7530 e!17245))

(declare-fun c!1691 () Bool)

(assert (=> d!7530 (= c!1691 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!35806 () List!332)

(declare-datatypes ((tuple2!2858 0))(
  ( (tuple2!2859 (_1!1516 List!332) (_2!1516 BitStream!1262)) )
))
(declare-fun e!17246 () tuple2!2858)

(assert (=> d!7530 (= lt!35806 (_1!1516 e!17246))))

(declare-fun c!1690 () Bool)

(assert (=> d!7530 (= c!1690 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7530 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7530 (= (bitStreamReadBitsIntoList!0 (_2!1508 lt!35573) (_1!1509 lt!35579) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35806)))

(declare-fun b!25236 () Bool)

(assert (=> b!25236 (= e!17246 (tuple2!2859 Nil!329 (_1!1509 lt!35579)))))

(declare-fun lt!35804 () (_ BitVec 64))

(declare-datatypes ((tuple2!2860 0))(
  ( (tuple2!2861 (_1!1517 Bool) (_2!1517 BitStream!1262)) )
))
(declare-fun lt!35805 () tuple2!2860)

(declare-fun b!25237 () Bool)

(assert (=> b!25237 (= e!17246 (tuple2!2859 (Cons!328 (_1!1517 lt!35805) (bitStreamReadBitsIntoList!0 (_2!1508 lt!35573) (_2!1517 lt!35805) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!35804))) (_2!1517 lt!35805)))))

(declare-fun readBit!0 (BitStream!1262) tuple2!2860)

(assert (=> b!25237 (= lt!35805 (readBit!0 (_1!1509 lt!35579)))))

(assert (=> b!25237 (= lt!35804 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!25239 () Bool)

(declare-fun length!60 (List!332) Int)

(assert (=> b!25239 (= e!17245 (> (length!60 lt!35806) 0))))

(declare-fun b!25238 () Bool)

(declare-fun isEmpty!65 (List!332) Bool)

(assert (=> b!25238 (= e!17245 (isEmpty!65 lt!35806))))

(assert (= (and d!7530 c!1690) b!25236))

(assert (= (and d!7530 (not c!1690)) b!25237))

(assert (= (and d!7530 c!1691) b!25238))

(assert (= (and d!7530 (not c!1691)) b!25239))

(declare-fun m!35809 () Bool)

(assert (=> b!25237 m!35809))

(declare-fun m!35811 () Bool)

(assert (=> b!25237 m!35811))

(declare-fun m!35813 () Bool)

(assert (=> b!25239 m!35813))

(declare-fun m!35815 () Bool)

(assert (=> b!25238 m!35815))

(assert (=> b!25103 d!7530))

(declare-fun d!7532 () Bool)

(assert (=> d!7532 (= (invariant!0 (currentBit!2344 (_2!1508 lt!35573)) (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35576)))) (and (bvsge (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (bvslt (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000001000) (bvsge (currentByte!2349 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35576)))) (and (= (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (= (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35576))))))))))

(assert (=> b!25093 d!7532))

(declare-fun d!7534 () Bool)

(assert (=> d!7534 (= (invariant!0 (currentBit!2344 (_2!1508 lt!35573)) (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35573)))) (and (bvsge (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (bvslt (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000001000) (bvsge (currentByte!2349 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35573)))) (and (= (currentBit!2344 (_2!1508 lt!35573)) #b00000000000000000000000000000000) (= (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35573))))))))))

(assert (=> b!25104 d!7534))

(declare-fun d!7536 () Bool)

(assert (=> d!7536 (= (invariant!0 (currentBit!2344 (_2!1508 lt!35576)) (currentByte!2349 (_2!1508 lt!35576)) (size!715 (buf!1036 (_2!1508 lt!35576)))) (and (bvsge (currentBit!2344 (_2!1508 lt!35576)) #b00000000000000000000000000000000) (bvslt (currentBit!2344 (_2!1508 lt!35576)) #b00000000000000000000000000001000) (bvsge (currentByte!2349 (_2!1508 lt!35576)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2349 (_2!1508 lt!35576)) (size!715 (buf!1036 (_2!1508 lt!35576)))) (and (= (currentBit!2344 (_2!1508 lt!35576)) #b00000000000000000000000000000000) (= (currentByte!2349 (_2!1508 lt!35576)) (size!715 (buf!1036 (_2!1508 lt!35576))))))))))

(assert (=> b!25094 d!7536))

(declare-fun d!7538 () Bool)

(declare-fun e!17249 () Bool)

(assert (=> d!7538 e!17249))

(declare-fun res!21800 () Bool)

(assert (=> d!7538 (=> (not res!21800) (not e!17249))))

(declare-fun lt!35821 () (_ BitVec 64))

(declare-fun lt!35822 () (_ BitVec 64))

(declare-fun lt!35824 () (_ BitVec 64))

(assert (=> d!7538 (= res!21800 (= lt!35821 (bvsub lt!35822 lt!35824)))))

(assert (=> d!7538 (or (= (bvand lt!35822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35822 lt!35824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7538 (= lt!35824 (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35576))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35576)))))))

(declare-fun lt!35819 () (_ BitVec 64))

(declare-fun lt!35823 () (_ BitVec 64))

(assert (=> d!7538 (= lt!35822 (bvmul lt!35819 lt!35823))))

(assert (=> d!7538 (or (= lt!35819 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35823 (bvsdiv (bvmul lt!35819 lt!35823) lt!35819)))))

(assert (=> d!7538 (= lt!35823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7538 (= lt!35819 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))))))

(assert (=> d!7538 (= lt!35821 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35576))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35576)))))))

(assert (=> d!7538 (invariant!0 (currentBit!2344 (_2!1508 lt!35576)) (currentByte!2349 (_2!1508 lt!35576)) (size!715 (buf!1036 (_2!1508 lt!35576))))))

(assert (=> d!7538 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576))) lt!35821)))

(declare-fun b!25244 () Bool)

(declare-fun res!21801 () Bool)

(assert (=> b!25244 (=> (not res!21801) (not e!17249))))

(assert (=> b!25244 (= res!21801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35821))))

(declare-fun b!25245 () Bool)

(declare-fun lt!35820 () (_ BitVec 64))

(assert (=> b!25245 (= e!17249 (bvsle lt!35821 (bvmul lt!35820 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25245 (or (= lt!35820 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35820 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35820)))))

(assert (=> b!25245 (= lt!35820 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))))))

(assert (= (and d!7538 res!21800) b!25244))

(assert (= (and b!25244 res!21801) b!25245))

(declare-fun m!35817 () Bool)

(assert (=> d!7538 m!35817))

(assert (=> d!7538 m!35605))

(assert (=> b!25105 d!7538))

(declare-fun d!7540 () Bool)

(declare-fun e!17250 () Bool)

(assert (=> d!7540 e!17250))

(declare-fun res!21802 () Bool)

(assert (=> d!7540 (=> (not res!21802) (not e!17250))))

(declare-fun lt!35828 () (_ BitVec 64))

(declare-fun lt!35830 () (_ BitVec 64))

(declare-fun lt!35827 () (_ BitVec 64))

(assert (=> d!7540 (= res!21802 (= lt!35827 (bvsub lt!35828 lt!35830)))))

(assert (=> d!7540 (or (= (bvand lt!35828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35830 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35828 lt!35830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7540 (= lt!35830 (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573)))))))

(declare-fun lt!35825 () (_ BitVec 64))

(declare-fun lt!35829 () (_ BitVec 64))

(assert (=> d!7540 (= lt!35828 (bvmul lt!35825 lt!35829))))

(assert (=> d!7540 (or (= lt!35825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!35829 (bvsdiv (bvmul lt!35825 lt!35829) lt!35825)))))

(assert (=> d!7540 (= lt!35829 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7540 (= lt!35825 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))))))

(assert (=> d!7540 (= lt!35827 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573)))))))

(assert (=> d!7540 (invariant!0 (currentBit!2344 (_2!1508 lt!35573)) (currentByte!2349 (_2!1508 lt!35573)) (size!715 (buf!1036 (_2!1508 lt!35573))))))

(assert (=> d!7540 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))) lt!35827)))

(declare-fun b!25246 () Bool)

(declare-fun res!21803 () Bool)

(assert (=> b!25246 (=> (not res!21803) (not e!17250))))

(assert (=> b!25246 (= res!21803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!35827))))

(declare-fun b!25247 () Bool)

(declare-fun lt!35826 () (_ BitVec 64))

(assert (=> b!25247 (= e!17250 (bvsle lt!35827 (bvmul lt!35826 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25247 (or (= lt!35826 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!35826 #b0000000000000000000000000000000000000000000000000000000000001000) lt!35826)))))

(assert (=> b!25247 (= lt!35826 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))))))

(assert (= (and d!7540 res!21802) b!25246))

(assert (= (and b!25246 res!21803) b!25247))

(declare-fun m!35819 () Bool)

(assert (=> d!7540 m!35819))

(assert (=> d!7540 m!35625))

(assert (=> b!25100 d!7540))

(declare-fun d!7542 () Bool)

(declare-fun res!21810 () Bool)

(declare-fun e!17255 () Bool)

(assert (=> d!7542 (=> (not res!21810) (not e!17255))))

(assert (=> d!7542 (= res!21810 (= (size!715 (buf!1036 thiss!1379)) (size!715 (buf!1036 (_2!1508 lt!35573)))))))

(assert (=> d!7542 (= (isPrefixOf!0 thiss!1379 (_2!1508 lt!35573)) e!17255)))

(declare-fun b!25254 () Bool)

(declare-fun res!21812 () Bool)

(assert (=> b!25254 (=> (not res!21812) (not e!17255))))

(assert (=> b!25254 (= res!21812 (bvsle (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)) (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573)))))))

(declare-fun b!25255 () Bool)

(declare-fun e!17256 () Bool)

(assert (=> b!25255 (= e!17255 e!17256)))

(declare-fun res!21811 () Bool)

(assert (=> b!25255 (=> res!21811 e!17256)))

(assert (=> b!25255 (= res!21811 (= (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25256 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1659 array!1659 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25256 (= e!17256 (arrayBitRangesEq!0 (buf!1036 thiss!1379) (buf!1036 (_2!1508 lt!35573)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(assert (= (and d!7542 res!21810) b!25254))

(assert (= (and b!25254 res!21812) b!25255))

(assert (= (and b!25255 (not res!21811)) b!25256))

(assert (=> b!25254 m!35623))

(assert (=> b!25254 m!35637))

(assert (=> b!25256 m!35623))

(assert (=> b!25256 m!35623))

(declare-fun m!35821 () Bool)

(assert (=> b!25256 m!35821))

(assert (=> b!25101 d!7542))

(declare-fun d!7544 () Bool)

(assert (=> d!7544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!35574) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573)))) lt!35574))))

(declare-fun bs!2182 () Bool)

(assert (= bs!2182 d!7544))

(assert (=> bs!2182 m!35819))

(assert (=> b!25101 d!7544))

(declare-fun d!7546 () Bool)

(declare-fun e!17259 () Bool)

(assert (=> d!7546 e!17259))

(declare-fun res!21815 () Bool)

(assert (=> d!7546 (=> (not res!21815) (not e!17259))))

(assert (=> d!7546 (= res!21815 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35833 () Unit!2073)

(declare-fun choose!27 (BitStream!1262 BitStream!1262 (_ BitVec 64) (_ BitVec 64)) Unit!2073)

(assert (=> d!7546 (= lt!35833 (choose!27 thiss!1379 (_2!1508 lt!35573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7546 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1508 lt!35573) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35833)))

(declare-fun b!25259 () Bool)

(assert (=> b!25259 (= e!17259 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7546 res!21815) b!25259))

(declare-fun m!35823 () Bool)

(assert (=> d!7546 m!35823))

(declare-fun m!35825 () Bool)

(assert (=> b!25259 m!35825))

(assert (=> b!25101 d!7546))

(declare-fun d!7548 () Bool)

(declare-fun e!17270 () Bool)

(assert (=> d!7548 e!17270))

(declare-fun res!21836 () Bool)

(assert (=> d!7548 (=> (not res!21836) (not e!17270))))

(declare-fun lt!35865 () tuple2!2842)

(assert (=> d!7548 (= res!21836 (= (size!715 (buf!1036 (_2!1508 lt!35865))) (size!715 (buf!1036 thiss!1379))))))

(declare-fun lt!35859 () (_ BitVec 8))

(declare-fun lt!35862 () array!1659)

(assert (=> d!7548 (= lt!35859 (select (arr!1171 lt!35862) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7548 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!715 lt!35862)))))

(assert (=> d!7548 (= lt!35862 (array!1660 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!35858 () tuple2!2842)

(assert (=> d!7548 (= lt!35865 (tuple2!2843 (_1!1508 lt!35858) (_2!1508 lt!35858)))))

(declare-fun lt!35869 () tuple2!2842)

(assert (=> d!7548 (= lt!35858 lt!35869)))

(declare-fun e!17268 () Bool)

(assert (=> d!7548 e!17268))

(declare-fun res!21838 () Bool)

(assert (=> d!7548 (=> (not res!21838) (not e!17268))))

(assert (=> d!7548 (= res!21838 (= (size!715 (buf!1036 thiss!1379)) (size!715 (buf!1036 (_2!1508 lt!35869)))))))

(declare-fun lt!35864 () Bool)

(declare-fun appendBit!0 (BitStream!1262 Bool) tuple2!2842)

(assert (=> d!7548 (= lt!35869 (appendBit!0 thiss!1379 lt!35864))))

(assert (=> d!7548 (= lt!35864 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7548 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7548 (= (appendBitFromByte!0 thiss!1379 (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!35865)))

(declare-fun b!25277 () Bool)

(declare-fun res!21832 () Bool)

(assert (=> b!25277 (=> (not res!21832) (not e!17270))))

(declare-fun lt!35866 () (_ BitVec 64))

(declare-fun lt!35860 () (_ BitVec 64))

(assert (=> b!25277 (= res!21832 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35865))) (currentByte!2349 (_2!1508 lt!35865)) (currentBit!2344 (_2!1508 lt!35865))) (bvadd lt!35860 lt!35866)))))

(assert (=> b!25277 (or (not (= (bvand lt!35860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!35860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!35860 lt!35866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25277 (= lt!35866 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!25277 (= lt!35860 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(declare-fun b!25278 () Bool)

(declare-fun e!17271 () Bool)

(assert (=> b!25278 (= e!17268 e!17271)))

(declare-fun res!21835 () Bool)

(assert (=> b!25278 (=> (not res!21835) (not e!17271))))

(declare-datatypes ((tuple2!2866 0))(
  ( (tuple2!2867 (_1!1520 BitStream!1262) (_2!1520 Bool)) )
))
(declare-fun lt!35867 () tuple2!2866)

(assert (=> b!25278 (= res!21835 (and (= (_2!1520 lt!35867) lt!35864) (= (_1!1520 lt!35867) (_2!1508 lt!35869))))))

(declare-fun readBitPure!0 (BitStream!1262) tuple2!2866)

(declare-fun readerFrom!0 (BitStream!1262 (_ BitVec 32) (_ BitVec 32)) BitStream!1262)

(assert (=> b!25278 (= lt!35867 (readBitPure!0 (readerFrom!0 (_2!1508 lt!35869) (currentBit!2344 thiss!1379) (currentByte!2349 thiss!1379))))))

(declare-fun b!25279 () Bool)

(assert (=> b!25279 (= e!17271 (= (bitIndex!0 (size!715 (buf!1036 (_1!1520 lt!35867))) (currentByte!2349 (_1!1520 lt!35867)) (currentBit!2344 (_1!1520 lt!35867))) (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35869))) (currentByte!2349 (_2!1508 lt!35869)) (currentBit!2344 (_2!1508 lt!35869)))))))

(declare-fun b!25280 () Bool)

(declare-fun e!17269 () Bool)

(declare-fun lt!35868 () tuple2!2866)

(assert (=> b!25280 (= e!17269 (= (bitIndex!0 (size!715 (buf!1036 (_1!1520 lt!35868))) (currentByte!2349 (_1!1520 lt!35868)) (currentBit!2344 (_1!1520 lt!35868))) (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35865))) (currentByte!2349 (_2!1508 lt!35865)) (currentBit!2344 (_2!1508 lt!35865)))))))

(declare-fun b!25281 () Bool)

(declare-fun res!21833 () Bool)

(assert (=> b!25281 (=> (not res!21833) (not e!17268))))

(assert (=> b!25281 (= res!21833 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35869)))))

(declare-fun b!25282 () Bool)

(assert (=> b!25282 (= e!17270 e!17269)))

(declare-fun res!21839 () Bool)

(assert (=> b!25282 (=> (not res!21839) (not e!17269))))

(assert (=> b!25282 (= res!21839 (and (= (_2!1520 lt!35868) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!35859)) #b00000000000000000000000000000000))) (= (_1!1520 lt!35868) (_2!1508 lt!35865))))))

(declare-datatypes ((tuple2!2868 0))(
  ( (tuple2!2869 (_1!1521 array!1659) (_2!1521 BitStream!1262)) )
))
(declare-fun lt!35861 () tuple2!2868)

(declare-fun lt!35863 () BitStream!1262)

(declare-fun readBits!0 (BitStream!1262 (_ BitVec 64)) tuple2!2868)

(assert (=> b!25282 (= lt!35861 (readBits!0 lt!35863 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!25282 (= lt!35868 (readBitPure!0 lt!35863))))

(assert (=> b!25282 (= lt!35863 (readerFrom!0 (_2!1508 lt!35865) (currentBit!2344 thiss!1379) (currentByte!2349 thiss!1379)))))

(declare-fun b!25283 () Bool)

(declare-fun res!21834 () Bool)

(assert (=> b!25283 (=> (not res!21834) (not e!17268))))

(assert (=> b!25283 (= res!21834 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35869))) (currentByte!2349 (_2!1508 lt!35869)) (currentBit!2344 (_2!1508 lt!35869))) (bvadd (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25284 () Bool)

(declare-fun res!21837 () Bool)

(assert (=> b!25284 (=> (not res!21837) (not e!17270))))

(assert (=> b!25284 (= res!21837 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35865)))))

(assert (= (and d!7548 res!21838) b!25283))

(assert (= (and b!25283 res!21834) b!25281))

(assert (= (and b!25281 res!21833) b!25278))

(assert (= (and b!25278 res!21835) b!25279))

(assert (= (and d!7548 res!21836) b!25277))

(assert (= (and b!25277 res!21832) b!25284))

(assert (= (and b!25284 res!21837) b!25282))

(assert (= (and b!25282 res!21839) b!25280))

(declare-fun m!35827 () Bool)

(assert (=> b!25284 m!35827))

(declare-fun m!35829 () Bool)

(assert (=> d!7548 m!35829))

(declare-fun m!35831 () Bool)

(assert (=> d!7548 m!35831))

(assert (=> d!7548 m!35805))

(declare-fun m!35833 () Bool)

(assert (=> b!25283 m!35833))

(assert (=> b!25283 m!35623))

(declare-fun m!35835 () Bool)

(assert (=> b!25281 m!35835))

(declare-fun m!35837 () Bool)

(assert (=> b!25277 m!35837))

(assert (=> b!25277 m!35623))

(declare-fun m!35839 () Bool)

(assert (=> b!25282 m!35839))

(declare-fun m!35841 () Bool)

(assert (=> b!25282 m!35841))

(declare-fun m!35843 () Bool)

(assert (=> b!25282 m!35843))

(declare-fun m!35845 () Bool)

(assert (=> b!25279 m!35845))

(assert (=> b!25279 m!35833))

(declare-fun m!35847 () Bool)

(assert (=> b!25280 m!35847))

(assert (=> b!25280 m!35837))

(declare-fun m!35849 () Bool)

(assert (=> b!25278 m!35849))

(assert (=> b!25278 m!35849))

(declare-fun m!35851 () Bool)

(assert (=> b!25278 m!35851))

(assert (=> b!25101 d!7548))

(declare-fun b!25295 () Bool)

(declare-fun e!17277 () Unit!2073)

(declare-fun Unit!2095 () Unit!2073)

(assert (=> b!25295 (= e!17277 Unit!2095)))

(declare-fun b!25296 () Bool)

(declare-fun res!21847 () Bool)

(declare-fun e!17276 () Bool)

(assert (=> b!25296 (=> (not res!21847) (not e!17276))))

(declare-fun lt!35929 () tuple2!2844)

(assert (=> b!25296 (= res!21847 (isPrefixOf!0 (_1!1509 lt!35929) thiss!1379))))

(declare-fun b!25297 () Bool)

(declare-fun lt!35924 () (_ BitVec 64))

(declare-fun lt!35914 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1262 (_ BitVec 64)) BitStream!1262)

(assert (=> b!25297 (= e!17276 (= (_1!1509 lt!35929) (withMovedBitIndex!0 (_2!1509 lt!35929) (bvsub lt!35914 lt!35924))))))

(assert (=> b!25297 (or (= (bvand lt!35914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!35924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!35914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!35914 lt!35924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25297 (= lt!35924 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(assert (=> b!25297 (= lt!35914 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(declare-fun d!7550 () Bool)

(assert (=> d!7550 e!17276))

(declare-fun res!21848 () Bool)

(assert (=> d!7550 (=> (not res!21848) (not e!17276))))

(assert (=> d!7550 (= res!21848 (isPrefixOf!0 (_1!1509 lt!35929) (_2!1509 lt!35929)))))

(declare-fun lt!35923 () BitStream!1262)

(assert (=> d!7550 (= lt!35929 (tuple2!2845 lt!35923 (_2!1508 lt!35573)))))

(declare-fun lt!35918 () Unit!2073)

(declare-fun lt!35917 () Unit!2073)

(assert (=> d!7550 (= lt!35918 lt!35917)))

(assert (=> d!7550 (isPrefixOf!0 lt!35923 (_2!1508 lt!35573))))

(assert (=> d!7550 (= lt!35917 (lemmaIsPrefixTransitive!0 lt!35923 (_2!1508 lt!35573) (_2!1508 lt!35573)))))

(declare-fun lt!35927 () Unit!2073)

(declare-fun lt!35926 () Unit!2073)

(assert (=> d!7550 (= lt!35927 lt!35926)))

(assert (=> d!7550 (isPrefixOf!0 lt!35923 (_2!1508 lt!35573))))

(assert (=> d!7550 (= lt!35926 (lemmaIsPrefixTransitive!0 lt!35923 thiss!1379 (_2!1508 lt!35573)))))

(declare-fun lt!35919 () Unit!2073)

(assert (=> d!7550 (= lt!35919 e!17277)))

(declare-fun c!1694 () Bool)

(assert (=> d!7550 (= c!1694 (not (= (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!35912 () Unit!2073)

(declare-fun lt!35913 () Unit!2073)

(assert (=> d!7550 (= lt!35912 lt!35913)))

(assert (=> d!7550 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35573))))

(assert (=> d!7550 (= lt!35913 (lemmaIsPrefixRefl!0 (_2!1508 lt!35573)))))

(declare-fun lt!35915 () Unit!2073)

(declare-fun lt!35922 () Unit!2073)

(assert (=> d!7550 (= lt!35915 lt!35922)))

(assert (=> d!7550 (= lt!35922 (lemmaIsPrefixRefl!0 (_2!1508 lt!35573)))))

(declare-fun lt!35928 () Unit!2073)

(declare-fun lt!35916 () Unit!2073)

(assert (=> d!7550 (= lt!35928 lt!35916)))

(assert (=> d!7550 (isPrefixOf!0 lt!35923 lt!35923)))

(assert (=> d!7550 (= lt!35916 (lemmaIsPrefixRefl!0 lt!35923))))

(declare-fun lt!35920 () Unit!2073)

(declare-fun lt!35925 () Unit!2073)

(assert (=> d!7550 (= lt!35920 lt!35925)))

(assert (=> d!7550 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7550 (= lt!35925 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7550 (= lt!35923 (BitStream!1263 (buf!1036 (_2!1508 lt!35573)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(assert (=> d!7550 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35573))))

(assert (=> d!7550 (= (reader!0 thiss!1379 (_2!1508 lt!35573)) lt!35929)))

(declare-fun b!25298 () Bool)

(declare-fun res!21846 () Bool)

(assert (=> b!25298 (=> (not res!21846) (not e!17276))))

(assert (=> b!25298 (= res!21846 (isPrefixOf!0 (_2!1509 lt!35929) (_2!1508 lt!35573)))))

(declare-fun b!25299 () Bool)

(declare-fun lt!35910 () Unit!2073)

(assert (=> b!25299 (= e!17277 lt!35910)))

(declare-fun lt!35921 () (_ BitVec 64))

(assert (=> b!25299 (= lt!35921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35911 () (_ BitVec 64))

(assert (=> b!25299 (= lt!35911 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1659 array!1659 (_ BitVec 64) (_ BitVec 64)) Unit!2073)

(assert (=> b!25299 (= lt!35910 (arrayBitRangesEqSymmetric!0 (buf!1036 thiss!1379) (buf!1036 (_2!1508 lt!35573)) lt!35921 lt!35911))))

(assert (=> b!25299 (arrayBitRangesEq!0 (buf!1036 (_2!1508 lt!35573)) (buf!1036 thiss!1379) lt!35921 lt!35911)))

(assert (= (and d!7550 c!1694) b!25299))

(assert (= (and d!7550 (not c!1694)) b!25295))

(assert (= (and d!7550 res!21848) b!25296))

(assert (= (and b!25296 res!21847) b!25298))

(assert (= (and b!25298 res!21846) b!25297))

(declare-fun m!35853 () Bool)

(assert (=> b!25297 m!35853))

(assert (=> b!25297 m!35637))

(assert (=> b!25297 m!35623))

(declare-fun m!35855 () Bool)

(assert (=> b!25296 m!35855))

(declare-fun m!35857 () Bool)

(assert (=> b!25298 m!35857))

(declare-fun m!35859 () Bool)

(assert (=> d!7550 m!35859))

(assert (=> d!7550 m!35619))

(assert (=> d!7550 m!35611))

(declare-fun m!35861 () Bool)

(assert (=> d!7550 m!35861))

(assert (=> d!7550 m!35621))

(declare-fun m!35863 () Bool)

(assert (=> d!7550 m!35863))

(declare-fun m!35865 () Bool)

(assert (=> d!7550 m!35865))

(declare-fun m!35867 () Bool)

(assert (=> d!7550 m!35867))

(declare-fun m!35869 () Bool)

(assert (=> d!7550 m!35869))

(declare-fun m!35871 () Bool)

(assert (=> d!7550 m!35871))

(declare-fun m!35873 () Bool)

(assert (=> d!7550 m!35873))

(assert (=> b!25299 m!35623))

(declare-fun m!35875 () Bool)

(assert (=> b!25299 m!35875))

(declare-fun m!35877 () Bool)

(assert (=> b!25299 m!35877))

(assert (=> b!25098 d!7550))

(declare-fun d!7552 () Bool)

(assert (=> d!7552 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!35932 () Unit!2073)

(declare-fun choose!9 (BitStream!1262 array!1659 (_ BitVec 64) BitStream!1262) Unit!2073)

(assert (=> d!7552 (= lt!35932 (choose!9 thiss!1379 (buf!1036 (_2!1508 lt!35573)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1263 (buf!1036 (_2!1508 lt!35573)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(assert (=> d!7552 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1036 (_2!1508 lt!35573)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!35932)))

(declare-fun bs!2183 () Bool)

(assert (= bs!2183 d!7552))

(assert (=> bs!2183 m!35593))

(declare-fun m!35879 () Bool)

(assert (=> bs!2183 m!35879))

(assert (=> b!25098 d!7552))

(declare-fun d!7554 () Bool)

(declare-fun res!21849 () Bool)

(declare-fun e!17278 () Bool)

(assert (=> d!7554 (=> (not res!21849) (not e!17278))))

(assert (=> d!7554 (= res!21849 (= (size!715 (buf!1036 thiss!1379)) (size!715 (buf!1036 (_2!1508 lt!35576)))))))

(assert (=> d!7554 (= (isPrefixOf!0 thiss!1379 (_2!1508 lt!35576)) e!17278)))

(declare-fun b!25300 () Bool)

(declare-fun res!21851 () Bool)

(assert (=> b!25300 (=> (not res!21851) (not e!17278))))

(assert (=> b!25300 (= res!21851 (bvsle (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)) (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576)))))))

(declare-fun b!25301 () Bool)

(declare-fun e!17279 () Bool)

(assert (=> b!25301 (= e!17278 e!17279)))

(declare-fun res!21850 () Bool)

(assert (=> b!25301 (=> res!21850 e!17279)))

(assert (=> b!25301 (= res!21850 (= (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25302 () Bool)

(assert (=> b!25302 (= e!17279 (arrayBitRangesEq!0 (buf!1036 thiss!1379) (buf!1036 (_2!1508 lt!35576)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(assert (= (and d!7554 res!21849) b!25300))

(assert (= (and b!25300 res!21851) b!25301))

(assert (= (and b!25301 (not res!21850)) b!25302))

(assert (=> b!25300 m!35623))

(assert (=> b!25300 m!35607))

(assert (=> b!25302 m!35623))

(assert (=> b!25302 m!35623))

(declare-fun m!35881 () Bool)

(assert (=> b!25302 m!35881))

(assert (=> b!25098 d!7554))

(declare-fun d!7556 () Bool)

(assert (=> d!7556 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35576))))

(declare-fun lt!35935 () Unit!2073)

(declare-fun choose!30 (BitStream!1262 BitStream!1262 BitStream!1262) Unit!2073)

(assert (=> d!7556 (= lt!35935 (choose!30 thiss!1379 (_2!1508 lt!35573) (_2!1508 lt!35576)))))

(assert (=> d!7556 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35573))))

(assert (=> d!7556 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1508 lt!35573) (_2!1508 lt!35576)) lt!35935)))

(declare-fun bs!2184 () Bool)

(assert (= bs!2184 d!7556))

(assert (=> bs!2184 m!35595))

(declare-fun m!35883 () Bool)

(assert (=> bs!2184 m!35883))

(assert (=> bs!2184 m!35611))

(assert (=> b!25098 d!7556))

(declare-fun d!7558 () Bool)

(assert (=> d!7558 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2185 () Bool)

(assert (= bs!2185 d!7558))

(declare-fun m!35885 () Bool)

(assert (=> bs!2185 m!35885))

(assert (=> b!25098 d!7558))

(declare-fun d!7560 () Bool)

(declare-fun res!21852 () Bool)

(declare-fun e!17280 () Bool)

(assert (=> d!7560 (=> (not res!21852) (not e!17280))))

(assert (=> d!7560 (= res!21852 (= (size!715 (buf!1036 (_2!1508 lt!35573))) (size!715 (buf!1036 (_2!1508 lt!35576)))))))

(assert (=> d!7560 (= (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35576)) e!17280)))

(declare-fun b!25303 () Bool)

(declare-fun res!21854 () Bool)

(assert (=> b!25303 (=> (not res!21854) (not e!17280))))

(assert (=> b!25303 (= res!21854 (bvsle (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))) (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576)))))))

(declare-fun b!25304 () Bool)

(declare-fun e!17281 () Bool)

(assert (=> b!25304 (= e!17280 e!17281)))

(declare-fun res!21853 () Bool)

(assert (=> b!25304 (=> res!21853 e!17281)))

(assert (=> b!25304 (= res!21853 (= (size!715 (buf!1036 (_2!1508 lt!35573))) #b00000000000000000000000000000000))))

(declare-fun b!25305 () Bool)

(assert (=> b!25305 (= e!17281 (arrayBitRangesEq!0 (buf!1036 (_2!1508 lt!35573)) (buf!1036 (_2!1508 lt!35576)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573)))))))

(assert (= (and d!7560 res!21852) b!25303))

(assert (= (and b!25303 res!21854) b!25304))

(assert (= (and b!25304 (not res!21853)) b!25305))

(assert (=> b!25303 m!35637))

(assert (=> b!25303 m!35607))

(assert (=> b!25305 m!35637))

(assert (=> b!25305 m!35637))

(declare-fun m!35887 () Bool)

(assert (=> b!25305 m!35887))

(assert (=> b!25098 d!7560))

(declare-fun b!25452 () Bool)

(declare-fun res!21961 () Bool)

(declare-fun e!17349 () Bool)

(assert (=> b!25452 (=> (not res!21961) (not e!17349))))

(declare-fun lt!36481 () tuple2!2842)

(assert (=> b!25452 (= res!21961 (= (size!715 (buf!1036 (_2!1508 lt!36481))) (size!715 (buf!1036 (_2!1508 lt!35573)))))))

(declare-fun b!25453 () Bool)

(declare-fun e!17348 () tuple2!2842)

(declare-fun Unit!2096 () Unit!2073)

(assert (=> b!25453 (= e!17348 (tuple2!2843 Unit!2096 (_2!1508 lt!35573)))))

(assert (=> b!25453 (= (size!715 (buf!1036 (_2!1508 lt!35573))) (size!715 (buf!1036 (_2!1508 lt!35573))))))

(declare-fun lt!36454 () Unit!2073)

(declare-fun Unit!2097 () Unit!2073)

(assert (=> b!25453 (= lt!36454 Unit!2097)))

(declare-fun call!346 () tuple2!2844)

(declare-fun checkByteArrayBitContent!0 (BitStream!1262 array!1659 array!1659 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25453 (checkByteArrayBitContent!0 (_2!1508 lt!35573) srcBuffer!2 (_1!1521 (readBits!0 (_1!1509 call!346) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!25454 () Bool)

(declare-fun lt!36450 () tuple2!2842)

(declare-fun Unit!2098 () Unit!2073)

(assert (=> b!25454 (= e!17348 (tuple2!2843 Unit!2098 (_2!1508 lt!36450)))))

(declare-fun lt!36456 () tuple2!2842)

(assert (=> b!25454 (= lt!36456 (appendBitFromByte!0 (_2!1508 lt!35573) (select (arr!1171 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!36473 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36473 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36483 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36483 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36458 () Unit!2073)

(assert (=> b!25454 (= lt!36458 (validateOffsetBitsIneqLemma!0 (_2!1508 lt!35573) (_2!1508 lt!36456) lt!36473 lt!36483))))

(assert (=> b!25454 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!36456)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!36456))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!36456))) (bvsub lt!36473 lt!36483))))

(declare-fun lt!36472 () Unit!2073)

(assert (=> b!25454 (= lt!36472 lt!36458)))

(declare-fun lt!36493 () tuple2!2844)

(assert (=> b!25454 (= lt!36493 (reader!0 (_2!1508 lt!35573) (_2!1508 lt!36456)))))

(declare-fun lt!36488 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36488 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!36470 () Unit!2073)

(assert (=> b!25454 (= lt!36470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!36456)) lt!36488))))

(assert (=> b!25454 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!36456)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!36488)))

(declare-fun lt!36480 () Unit!2073)

(assert (=> b!25454 (= lt!36480 lt!36470)))

(assert (=> b!25454 (= (head!169 (byteArrayBitContentToList!0 (_2!1508 lt!36456) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!169 (bitStreamReadBitsIntoList!0 (_2!1508 lt!36456) (_1!1509 lt!36493) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36461 () Unit!2073)

(declare-fun Unit!2099 () Unit!2073)

(assert (=> b!25454 (= lt!36461 Unit!2099)))

(assert (=> b!25454 (= lt!36450 (appendBitsMSBFirstLoop!0 (_2!1508 lt!36456) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!36452 () Unit!2073)

(assert (=> b!25454 (= lt!36452 (lemmaIsPrefixTransitive!0 (_2!1508 lt!35573) (_2!1508 lt!36456) (_2!1508 lt!36450)))))

(assert (=> b!25454 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!36450))))

(declare-fun lt!36466 () Unit!2073)

(assert (=> b!25454 (= lt!36466 lt!36452)))

(assert (=> b!25454 (= (size!715 (buf!1036 (_2!1508 lt!36450))) (size!715 (buf!1036 (_2!1508 lt!35573))))))

(declare-fun lt!36474 () Unit!2073)

(declare-fun Unit!2100 () Unit!2073)

(assert (=> b!25454 (= lt!36474 Unit!2100)))

(assert (=> b!25454 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!36450))) (currentByte!2349 (_2!1508 lt!36450)) (currentBit!2344 (_2!1508 lt!36450))) (bvsub (bvadd (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36453 () Unit!2073)

(declare-fun Unit!2101 () Unit!2073)

(assert (=> b!25454 (= lt!36453 Unit!2101)))

(assert (=> b!25454 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!36450))) (currentByte!2349 (_2!1508 lt!36450)) (currentBit!2344 (_2!1508 lt!36450))) (bvsub (bvsub (bvadd (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!36456))) (currentByte!2349 (_2!1508 lt!36456)) (currentBit!2344 (_2!1508 lt!36456))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36477 () Unit!2073)

(declare-fun Unit!2102 () Unit!2073)

(assert (=> b!25454 (= lt!36477 Unit!2102)))

(declare-fun lt!36468 () tuple2!2844)

(assert (=> b!25454 (= lt!36468 call!346)))

(declare-fun lt!36467 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36467 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36485 () Unit!2073)

(assert (=> b!25454 (= lt!36485 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!36450)) lt!36467))))

(assert (=> b!25454 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!36450)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!36467)))

(declare-fun lt!36484 () Unit!2073)

(assert (=> b!25454 (= lt!36484 lt!36485)))

(declare-fun lt!36487 () tuple2!2844)

(assert (=> b!25454 (= lt!36487 (reader!0 (_2!1508 lt!36456) (_2!1508 lt!36450)))))

(declare-fun lt!36460 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36460 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36476 () Unit!2073)

(assert (=> b!25454 (= lt!36476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!36456) (buf!1036 (_2!1508 lt!36450)) lt!36460))))

(assert (=> b!25454 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!36450)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!36456))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!36456))) lt!36460)))

(declare-fun lt!36491 () Unit!2073)

(assert (=> b!25454 (= lt!36491 lt!36476)))

(declare-fun lt!36463 () List!332)

(assert (=> b!25454 (= lt!36463 (byteArrayBitContentToList!0 (_2!1508 lt!36450) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36489 () List!332)

(assert (=> b!25454 (= lt!36489 (byteArrayBitContentToList!0 (_2!1508 lt!36450) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36469 () List!332)

(assert (=> b!25454 (= lt!36469 (bitStreamReadBitsIntoList!0 (_2!1508 lt!36450) (_1!1509 lt!36468) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!36479 () List!332)

(assert (=> b!25454 (= lt!36479 (bitStreamReadBitsIntoList!0 (_2!1508 lt!36450) (_1!1509 lt!36487) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!36462 () (_ BitVec 64))

(assert (=> b!25454 (= lt!36462 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!36475 () Unit!2073)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1262 BitStream!1262 BitStream!1262 BitStream!1262 (_ BitVec 64) List!332) Unit!2073)

(assert (=> b!25454 (= lt!36475 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1508 lt!36450) (_2!1508 lt!36450) (_1!1509 lt!36468) (_1!1509 lt!36487) lt!36462 lt!36469))))

(declare-fun tail!88 (List!332) List!332)

(assert (=> b!25454 (= (bitStreamReadBitsIntoList!0 (_2!1508 lt!36450) (_1!1509 lt!36487) (bvsub lt!36462 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!88 lt!36469))))

(declare-fun lt!36451 () Unit!2073)

(assert (=> b!25454 (= lt!36451 lt!36475)))

(declare-fun lt!36459 () Unit!2073)

(declare-fun lt!36455 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1659 array!1659 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2073)

(assert (=> b!25454 (= lt!36459 (arrayBitRangesEqImpliesEq!0 (buf!1036 (_2!1508 lt!36456)) (buf!1036 (_2!1508 lt!36450)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!36455 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!36456))) (currentByte!2349 (_2!1508 lt!36456)) (currentBit!2344 (_2!1508 lt!36456)))))))

(declare-fun bitAt!0 (array!1659 (_ BitVec 64)) Bool)

(assert (=> b!25454 (= (bitAt!0 (buf!1036 (_2!1508 lt!36456)) lt!36455) (bitAt!0 (buf!1036 (_2!1508 lt!36450)) lt!36455))))

(declare-fun lt!36464 () Unit!2073)

(assert (=> b!25454 (= lt!36464 lt!36459)))

(declare-fun b!25455 () Bool)

(declare-fun res!21960 () Bool)

(assert (=> b!25455 (=> (not res!21960) (not e!17349))))

(assert (=> b!25455 (= res!21960 (= (size!715 (buf!1036 (_2!1508 lt!35573))) (size!715 (buf!1036 (_2!1508 lt!36481)))))))

(declare-fun bm!343 () Bool)

(declare-fun c!1717 () Bool)

(assert (=> bm!343 (= call!346 (reader!0 (_2!1508 lt!35573) (ite c!1717 (_2!1508 lt!36450) (_2!1508 lt!35573))))))

(declare-fun b!25456 () Bool)

(declare-fun res!21959 () Bool)

(assert (=> b!25456 (=> (not res!21959) (not e!17349))))

(assert (=> b!25456 (= res!21959 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!36481)))))

(declare-fun b!25457 () Bool)

(declare-fun e!17347 () Bool)

(declare-fun lt!36457 () (_ BitVec 64))

(assert (=> b!25457 (= e!17347 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35573)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!36457))))

(declare-fun lt!36482 () tuple2!2844)

(declare-fun b!25459 () Bool)

(assert (=> b!25459 (= e!17349 (= (bitStreamReadBitsIntoList!0 (_2!1508 lt!36481) (_1!1509 lt!36482) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1508 lt!36481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!25459 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25459 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36465 () Unit!2073)

(declare-fun lt!36486 () Unit!2073)

(assert (=> b!25459 (= lt!36465 lt!36486)))

(assert (=> b!25459 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!36481)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!36457)))

(assert (=> b!25459 (= lt!36486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!36481)) lt!36457))))

(assert (=> b!25459 e!17347))

(declare-fun res!21957 () Bool)

(assert (=> b!25459 (=> (not res!21957) (not e!17347))))

(assert (=> b!25459 (= res!21957 (and (= (size!715 (buf!1036 (_2!1508 lt!35573))) (size!715 (buf!1036 (_2!1508 lt!36481)))) (bvsge lt!36457 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25459 (= lt!36457 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!25459 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25459 (= lt!36482 (reader!0 (_2!1508 lt!35573) (_2!1508 lt!36481)))))

(declare-fun b!25458 () Bool)

(declare-fun res!21958 () Bool)

(assert (=> b!25458 (=> (not res!21958) (not e!17349))))

(assert (=> b!25458 (= res!21958 (invariant!0 (currentBit!2344 (_2!1508 lt!36481)) (currentByte!2349 (_2!1508 lt!36481)) (size!715 (buf!1036 (_2!1508 lt!36481)))))))

(declare-fun d!7562 () Bool)

(assert (=> d!7562 e!17349))

(declare-fun res!21956 () Bool)

(assert (=> d!7562 (=> (not res!21956) (not e!17349))))

(declare-fun lt!36492 () (_ BitVec 64))

(assert (=> d!7562 (= res!21956 (= (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!36481))) (currentByte!2349 (_2!1508 lt!36481)) (currentBit!2344 (_2!1508 lt!36481))) (bvsub lt!36492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7562 (or (= (bvand lt!36492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!36478 () (_ BitVec 64))

(assert (=> d!7562 (= lt!36492 (bvadd lt!36478 to!314))))

(assert (=> d!7562 (or (not (= (bvand lt!36478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!36478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!36478 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7562 (= lt!36478 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(assert (=> d!7562 (= lt!36481 e!17348)))

(assert (=> d!7562 (= c!1717 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!36471 () Unit!2073)

(declare-fun lt!36490 () Unit!2073)

(assert (=> d!7562 (= lt!36471 lt!36490)))

(assert (=> d!7562 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35573))))

(assert (=> d!7562 (= lt!36490 (lemmaIsPrefixRefl!0 (_2!1508 lt!35573)))))

(assert (=> d!7562 (= lt!36455 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(assert (=> d!7562 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7562 (= (appendBitsMSBFirstLoop!0 (_2!1508 lt!35573) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!36481)))

(assert (= (and d!7562 c!1717) b!25454))

(assert (= (and d!7562 (not c!1717)) b!25453))

(assert (= (or b!25454 b!25453) bm!343))

(assert (= (and d!7562 res!21956) b!25458))

(assert (= (and b!25458 res!21958) b!25455))

(assert (= (and b!25455 res!21960) b!25456))

(assert (= (and b!25456 res!21959) b!25452))

(assert (= (and b!25452 res!21961) b!25459))

(assert (= (and b!25459 res!21957) b!25457))

(declare-fun m!36199 () Bool)

(assert (=> b!25454 m!36199))

(declare-fun m!36201 () Bool)

(assert (=> b!25454 m!36201))

(declare-fun m!36203 () Bool)

(assert (=> b!25454 m!36203))

(declare-fun m!36205 () Bool)

(assert (=> b!25454 m!36205))

(declare-fun m!36207 () Bool)

(assert (=> b!25454 m!36207))

(declare-fun m!36209 () Bool)

(assert (=> b!25454 m!36209))

(declare-fun m!36211 () Bool)

(assert (=> b!25454 m!36211))

(assert (=> b!25454 m!36211))

(declare-fun m!36213 () Bool)

(assert (=> b!25454 m!36213))

(declare-fun m!36215 () Bool)

(assert (=> b!25454 m!36215))

(declare-fun m!36217 () Bool)

(assert (=> b!25454 m!36217))

(declare-fun m!36219 () Bool)

(assert (=> b!25454 m!36219))

(declare-fun m!36221 () Bool)

(assert (=> b!25454 m!36221))

(declare-fun m!36223 () Bool)

(assert (=> b!25454 m!36223))

(declare-fun m!36225 () Bool)

(assert (=> b!25454 m!36225))

(declare-fun m!36227 () Bool)

(assert (=> b!25454 m!36227))

(declare-fun m!36229 () Bool)

(assert (=> b!25454 m!36229))

(declare-fun m!36231 () Bool)

(assert (=> b!25454 m!36231))

(declare-fun m!36233 () Bool)

(assert (=> b!25454 m!36233))

(declare-fun m!36235 () Bool)

(assert (=> b!25454 m!36235))

(declare-fun m!36237 () Bool)

(assert (=> b!25454 m!36237))

(declare-fun m!36239 () Bool)

(assert (=> b!25454 m!36239))

(assert (=> b!25454 m!35637))

(declare-fun m!36241 () Bool)

(assert (=> b!25454 m!36241))

(assert (=> b!25454 m!36203))

(declare-fun m!36243 () Bool)

(assert (=> b!25454 m!36243))

(declare-fun m!36245 () Bool)

(assert (=> b!25454 m!36245))

(declare-fun m!36247 () Bool)

(assert (=> b!25454 m!36247))

(declare-fun m!36249 () Bool)

(assert (=> b!25454 m!36249))

(declare-fun m!36251 () Bool)

(assert (=> b!25454 m!36251))

(declare-fun m!36253 () Bool)

(assert (=> b!25454 m!36253))

(assert (=> b!25454 m!36229))

(assert (=> b!25454 m!36235))

(declare-fun m!36255 () Bool)

(assert (=> b!25454 m!36255))

(declare-fun m!36257 () Bool)

(assert (=> b!25454 m!36257))

(declare-fun m!36259 () Bool)

(assert (=> b!25454 m!36259))

(declare-fun m!36261 () Bool)

(assert (=> b!25453 m!36261))

(declare-fun m!36263 () Bool)

(assert (=> b!25453 m!36263))

(declare-fun m!36265 () Bool)

(assert (=> b!25458 m!36265))

(declare-fun m!36267 () Bool)

(assert (=> d!7562 m!36267))

(assert (=> d!7562 m!35637))

(assert (=> d!7562 m!35869))

(assert (=> d!7562 m!35859))

(declare-fun m!36269 () Bool)

(assert (=> b!25456 m!36269))

(declare-fun m!36271 () Bool)

(assert (=> b!25459 m!36271))

(declare-fun m!36273 () Bool)

(assert (=> b!25459 m!36273))

(declare-fun m!36275 () Bool)

(assert (=> b!25459 m!36275))

(declare-fun m!36277 () Bool)

(assert (=> b!25459 m!36277))

(declare-fun m!36279 () Bool)

(assert (=> b!25459 m!36279))

(declare-fun m!36281 () Bool)

(assert (=> b!25457 m!36281))

(declare-fun m!36283 () Bool)

(assert (=> bm!343 m!36283))

(assert (=> b!25098 d!7562))

(declare-fun d!7614 () Bool)

(assert (=> d!7614 (= (array_inv!684 srcBuffer!2) (bvsge (size!715 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5736 d!7614))

(declare-fun d!7616 () Bool)

(assert (=> d!7616 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2344 thiss!1379) (currentByte!2349 thiss!1379) (size!715 (buf!1036 thiss!1379))))))

(declare-fun bs!2195 () Bool)

(assert (= bs!2195 d!7616))

(declare-fun m!36285 () Bool)

(assert (=> bs!2195 m!36285))

(assert (=> start!5736 d!7616))

(declare-fun d!7618 () Bool)

(assert (=> d!7618 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36494 () Unit!2073)

(assert (=> d!7618 (= lt!36494 (choose!9 thiss!1379 (buf!1036 (_2!1508 lt!35576)) (bvsub to!314 i!635) (BitStream!1263 (buf!1036 (_2!1508 lt!35576)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(assert (=> d!7618 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1036 (_2!1508 lt!35576)) (bvsub to!314 i!635)) lt!36494)))

(declare-fun bs!2196 () Bool)

(assert (= bs!2196 d!7618))

(assert (=> bs!2196 m!35581))

(declare-fun m!36287 () Bool)

(assert (=> bs!2196 m!36287))

(assert (=> b!25095 d!7618))

(declare-fun d!7620 () Bool)

(assert (=> d!7620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_1!1509 lt!35571)))) ((_ sign_extend 32) (currentByte!2349 (_1!1509 lt!35571))) ((_ sign_extend 32) (currentBit!2344 (_1!1509 lt!35571))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_1!1509 lt!35571)))) ((_ sign_extend 32) (currentByte!2349 (_1!1509 lt!35571))) ((_ sign_extend 32) (currentBit!2344 (_1!1509 lt!35571)))) (bvsub to!314 i!635)))))

(declare-fun bs!2197 () Bool)

(assert (= bs!2197 d!7620))

(declare-fun m!36289 () Bool)

(assert (=> bs!2197 m!36289))

(assert (=> b!25095 d!7620))

(declare-fun d!7622 () Bool)

(assert (=> d!7622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!35574) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573)))) lt!35574))))

(declare-fun bs!2198 () Bool)

(assert (= bs!2198 d!7622))

(declare-fun m!36291 () Bool)

(assert (=> bs!2198 m!36291))

(assert (=> b!25095 d!7622))

(declare-fun b!25460 () Bool)

(declare-fun e!17351 () Unit!2073)

(declare-fun Unit!2103 () Unit!2073)

(assert (=> b!25460 (= e!17351 Unit!2103)))

(declare-fun b!25461 () Bool)

(declare-fun res!21963 () Bool)

(declare-fun e!17350 () Bool)

(assert (=> b!25461 (=> (not res!21963) (not e!17350))))

(declare-fun lt!36514 () tuple2!2844)

(assert (=> b!25461 (= res!21963 (isPrefixOf!0 (_1!1509 lt!36514) (_2!1508 lt!35573)))))

(declare-fun lt!36509 () (_ BitVec 64))

(declare-fun lt!36499 () (_ BitVec 64))

(declare-fun b!25462 () Bool)

(assert (=> b!25462 (= e!17350 (= (_1!1509 lt!36514) (withMovedBitIndex!0 (_2!1509 lt!36514) (bvsub lt!36499 lt!36509))))))

(assert (=> b!25462 (or (= (bvand lt!36499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36499 lt!36509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25462 (= lt!36509 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576))))))

(assert (=> b!25462 (= lt!36499 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(declare-fun d!7624 () Bool)

(assert (=> d!7624 e!17350))

(declare-fun res!21964 () Bool)

(assert (=> d!7624 (=> (not res!21964) (not e!17350))))

(assert (=> d!7624 (= res!21964 (isPrefixOf!0 (_1!1509 lt!36514) (_2!1509 lt!36514)))))

(declare-fun lt!36508 () BitStream!1262)

(assert (=> d!7624 (= lt!36514 (tuple2!2845 lt!36508 (_2!1508 lt!35576)))))

(declare-fun lt!36503 () Unit!2073)

(declare-fun lt!36502 () Unit!2073)

(assert (=> d!7624 (= lt!36503 lt!36502)))

(assert (=> d!7624 (isPrefixOf!0 lt!36508 (_2!1508 lt!35576))))

(assert (=> d!7624 (= lt!36502 (lemmaIsPrefixTransitive!0 lt!36508 (_2!1508 lt!35576) (_2!1508 lt!35576)))))

(declare-fun lt!36512 () Unit!2073)

(declare-fun lt!36511 () Unit!2073)

(assert (=> d!7624 (= lt!36512 lt!36511)))

(assert (=> d!7624 (isPrefixOf!0 lt!36508 (_2!1508 lt!35576))))

(assert (=> d!7624 (= lt!36511 (lemmaIsPrefixTransitive!0 lt!36508 (_2!1508 lt!35573) (_2!1508 lt!35576)))))

(declare-fun lt!36504 () Unit!2073)

(assert (=> d!7624 (= lt!36504 e!17351)))

(declare-fun c!1718 () Bool)

(assert (=> d!7624 (= c!1718 (not (= (size!715 (buf!1036 (_2!1508 lt!35573))) #b00000000000000000000000000000000)))))

(declare-fun lt!36497 () Unit!2073)

(declare-fun lt!36498 () Unit!2073)

(assert (=> d!7624 (= lt!36497 lt!36498)))

(assert (=> d!7624 (isPrefixOf!0 (_2!1508 lt!35576) (_2!1508 lt!35576))))

(assert (=> d!7624 (= lt!36498 (lemmaIsPrefixRefl!0 (_2!1508 lt!35576)))))

(declare-fun lt!36500 () Unit!2073)

(declare-fun lt!36507 () Unit!2073)

(assert (=> d!7624 (= lt!36500 lt!36507)))

(assert (=> d!7624 (= lt!36507 (lemmaIsPrefixRefl!0 (_2!1508 lt!35576)))))

(declare-fun lt!36513 () Unit!2073)

(declare-fun lt!36501 () Unit!2073)

(assert (=> d!7624 (= lt!36513 lt!36501)))

(assert (=> d!7624 (isPrefixOf!0 lt!36508 lt!36508)))

(assert (=> d!7624 (= lt!36501 (lemmaIsPrefixRefl!0 lt!36508))))

(declare-fun lt!36505 () Unit!2073)

(declare-fun lt!36510 () Unit!2073)

(assert (=> d!7624 (= lt!36505 lt!36510)))

(assert (=> d!7624 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35573))))

(assert (=> d!7624 (= lt!36510 (lemmaIsPrefixRefl!0 (_2!1508 lt!35573)))))

(assert (=> d!7624 (= lt!36508 (BitStream!1263 (buf!1036 (_2!1508 lt!35576)) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(assert (=> d!7624 (isPrefixOf!0 (_2!1508 lt!35573) (_2!1508 lt!35576))))

(assert (=> d!7624 (= (reader!0 (_2!1508 lt!35573) (_2!1508 lt!35576)) lt!36514)))

(declare-fun b!25463 () Bool)

(declare-fun res!21962 () Bool)

(assert (=> b!25463 (=> (not res!21962) (not e!17350))))

(assert (=> b!25463 (= res!21962 (isPrefixOf!0 (_2!1509 lt!36514) (_2!1508 lt!35576)))))

(declare-fun b!25464 () Bool)

(declare-fun lt!36495 () Unit!2073)

(assert (=> b!25464 (= e!17351 lt!36495)))

(declare-fun lt!36506 () (_ BitVec 64))

(assert (=> b!25464 (= lt!36506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36496 () (_ BitVec 64))

(assert (=> b!25464 (= lt!36496 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35573))) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573))))))

(assert (=> b!25464 (= lt!36495 (arrayBitRangesEqSymmetric!0 (buf!1036 (_2!1508 lt!35573)) (buf!1036 (_2!1508 lt!35576)) lt!36506 lt!36496))))

(assert (=> b!25464 (arrayBitRangesEq!0 (buf!1036 (_2!1508 lt!35576)) (buf!1036 (_2!1508 lt!35573)) lt!36506 lt!36496)))

(assert (= (and d!7624 c!1718) b!25464))

(assert (= (and d!7624 (not c!1718)) b!25460))

(assert (= (and d!7624 res!21964) b!25461))

(assert (= (and b!25461 res!21963) b!25463))

(assert (= (and b!25463 res!21962) b!25462))

(declare-fun m!36293 () Bool)

(assert (=> b!25462 m!36293))

(assert (=> b!25462 m!35607))

(assert (=> b!25462 m!35637))

(declare-fun m!36295 () Bool)

(assert (=> b!25461 m!36295))

(declare-fun m!36297 () Bool)

(assert (=> b!25463 m!36297))

(declare-fun m!36299 () Bool)

(assert (=> d!7624 m!36299))

(assert (=> d!7624 m!35869))

(assert (=> d!7624 m!35601))

(declare-fun m!36301 () Bool)

(assert (=> d!7624 m!36301))

(assert (=> d!7624 m!35859))

(declare-fun m!36303 () Bool)

(assert (=> d!7624 m!36303))

(declare-fun m!36305 () Bool)

(assert (=> d!7624 m!36305))

(declare-fun m!36307 () Bool)

(assert (=> d!7624 m!36307))

(declare-fun m!36309 () Bool)

(assert (=> d!7624 m!36309))

(declare-fun m!36311 () Bool)

(assert (=> d!7624 m!36311))

(declare-fun m!36313 () Bool)

(assert (=> d!7624 m!36313))

(assert (=> b!25464 m!35637))

(declare-fun m!36315 () Bool)

(assert (=> b!25464 m!36315))

(declare-fun m!36317 () Bool)

(assert (=> b!25464 m!36317))

(assert (=> b!25095 d!7624))

(declare-fun b!25465 () Bool)

(declare-fun e!17353 () Unit!2073)

(declare-fun Unit!2104 () Unit!2073)

(assert (=> b!25465 (= e!17353 Unit!2104)))

(declare-fun b!25466 () Bool)

(declare-fun res!21966 () Bool)

(declare-fun e!17352 () Bool)

(assert (=> b!25466 (=> (not res!21966) (not e!17352))))

(declare-fun lt!36534 () tuple2!2844)

(assert (=> b!25466 (= res!21966 (isPrefixOf!0 (_1!1509 lt!36534) thiss!1379))))

(declare-fun lt!36529 () (_ BitVec 64))

(declare-fun b!25467 () Bool)

(declare-fun lt!36519 () (_ BitVec 64))

(assert (=> b!25467 (= e!17352 (= (_1!1509 lt!36534) (withMovedBitIndex!0 (_2!1509 lt!36534) (bvsub lt!36519 lt!36529))))))

(assert (=> b!25467 (or (= (bvand lt!36519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36519 lt!36529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!25467 (= lt!36529 (bitIndex!0 (size!715 (buf!1036 (_2!1508 lt!35576))) (currentByte!2349 (_2!1508 lt!35576)) (currentBit!2344 (_2!1508 lt!35576))))))

(assert (=> b!25467 (= lt!36519 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(declare-fun d!7626 () Bool)

(assert (=> d!7626 e!17352))

(declare-fun res!21967 () Bool)

(assert (=> d!7626 (=> (not res!21967) (not e!17352))))

(assert (=> d!7626 (= res!21967 (isPrefixOf!0 (_1!1509 lt!36534) (_2!1509 lt!36534)))))

(declare-fun lt!36528 () BitStream!1262)

(assert (=> d!7626 (= lt!36534 (tuple2!2845 lt!36528 (_2!1508 lt!35576)))))

(declare-fun lt!36523 () Unit!2073)

(declare-fun lt!36522 () Unit!2073)

(assert (=> d!7626 (= lt!36523 lt!36522)))

(assert (=> d!7626 (isPrefixOf!0 lt!36528 (_2!1508 lt!35576))))

(assert (=> d!7626 (= lt!36522 (lemmaIsPrefixTransitive!0 lt!36528 (_2!1508 lt!35576) (_2!1508 lt!35576)))))

(declare-fun lt!36532 () Unit!2073)

(declare-fun lt!36531 () Unit!2073)

(assert (=> d!7626 (= lt!36532 lt!36531)))

(assert (=> d!7626 (isPrefixOf!0 lt!36528 (_2!1508 lt!35576))))

(assert (=> d!7626 (= lt!36531 (lemmaIsPrefixTransitive!0 lt!36528 thiss!1379 (_2!1508 lt!35576)))))

(declare-fun lt!36524 () Unit!2073)

(assert (=> d!7626 (= lt!36524 e!17353)))

(declare-fun c!1719 () Bool)

(assert (=> d!7626 (= c!1719 (not (= (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!36517 () Unit!2073)

(declare-fun lt!36518 () Unit!2073)

(assert (=> d!7626 (= lt!36517 lt!36518)))

(assert (=> d!7626 (isPrefixOf!0 (_2!1508 lt!35576) (_2!1508 lt!35576))))

(assert (=> d!7626 (= lt!36518 (lemmaIsPrefixRefl!0 (_2!1508 lt!35576)))))

(declare-fun lt!36520 () Unit!2073)

(declare-fun lt!36527 () Unit!2073)

(assert (=> d!7626 (= lt!36520 lt!36527)))

(assert (=> d!7626 (= lt!36527 (lemmaIsPrefixRefl!0 (_2!1508 lt!35576)))))

(declare-fun lt!36533 () Unit!2073)

(declare-fun lt!36521 () Unit!2073)

(assert (=> d!7626 (= lt!36533 lt!36521)))

(assert (=> d!7626 (isPrefixOf!0 lt!36528 lt!36528)))

(assert (=> d!7626 (= lt!36521 (lemmaIsPrefixRefl!0 lt!36528))))

(declare-fun lt!36525 () Unit!2073)

(declare-fun lt!36530 () Unit!2073)

(assert (=> d!7626 (= lt!36525 lt!36530)))

(assert (=> d!7626 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7626 (= lt!36530 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7626 (= lt!36528 (BitStream!1263 (buf!1036 (_2!1508 lt!35576)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(assert (=> d!7626 (isPrefixOf!0 thiss!1379 (_2!1508 lt!35576))))

(assert (=> d!7626 (= (reader!0 thiss!1379 (_2!1508 lt!35576)) lt!36534)))

(declare-fun b!25468 () Bool)

(declare-fun res!21965 () Bool)

(assert (=> b!25468 (=> (not res!21965) (not e!17352))))

(assert (=> b!25468 (= res!21965 (isPrefixOf!0 (_2!1509 lt!36534) (_2!1508 lt!35576)))))

(declare-fun b!25469 () Bool)

(declare-fun lt!36515 () Unit!2073)

(assert (=> b!25469 (= e!17353 lt!36515)))

(declare-fun lt!36526 () (_ BitVec 64))

(assert (=> b!25469 (= lt!36526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!36516 () (_ BitVec 64))

(assert (=> b!25469 (= lt!36516 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)))))

(assert (=> b!25469 (= lt!36515 (arrayBitRangesEqSymmetric!0 (buf!1036 thiss!1379) (buf!1036 (_2!1508 lt!35576)) lt!36526 lt!36516))))

(assert (=> b!25469 (arrayBitRangesEq!0 (buf!1036 (_2!1508 lt!35576)) (buf!1036 thiss!1379) lt!36526 lt!36516)))

(assert (= (and d!7626 c!1719) b!25469))

(assert (= (and d!7626 (not c!1719)) b!25465))

(assert (= (and d!7626 res!21967) b!25466))

(assert (= (and b!25466 res!21966) b!25468))

(assert (= (and b!25468 res!21965) b!25467))

(declare-fun m!36319 () Bool)

(assert (=> b!25467 m!36319))

(assert (=> b!25467 m!35607))

(assert (=> b!25467 m!35623))

(declare-fun m!36321 () Bool)

(assert (=> b!25466 m!36321))

(declare-fun m!36323 () Bool)

(assert (=> b!25468 m!36323))

(assert (=> d!7626 m!36299))

(assert (=> d!7626 m!35619))

(assert (=> d!7626 m!35595))

(declare-fun m!36325 () Bool)

(assert (=> d!7626 m!36325))

(assert (=> d!7626 m!35621))

(declare-fun m!36327 () Bool)

(assert (=> d!7626 m!36327))

(declare-fun m!36329 () Bool)

(assert (=> d!7626 m!36329))

(declare-fun m!36331 () Bool)

(assert (=> d!7626 m!36331))

(assert (=> d!7626 m!36309))

(declare-fun m!36333 () Bool)

(assert (=> d!7626 m!36333))

(declare-fun m!36335 () Bool)

(assert (=> d!7626 m!36335))

(assert (=> b!25469 m!35623))

(declare-fun m!36337 () Bool)

(assert (=> b!25469 m!36337))

(declare-fun m!36339 () Bool)

(assert (=> b!25469 m!36339))

(assert (=> b!25095 d!7626))

(declare-fun d!7628 () Bool)

(assert (=> d!7628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2199 () Bool)

(assert (= bs!2199 d!7628))

(declare-fun m!36341 () Bool)

(assert (=> bs!2199 m!36341))

(assert (=> b!25095 d!7628))

(declare-fun d!7630 () Bool)

(assert (=> d!7630 (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 (_2!1508 lt!35576)))) ((_ sign_extend 32) (currentByte!2349 (_2!1508 lt!35573))) ((_ sign_extend 32) (currentBit!2344 (_2!1508 lt!35573))) lt!35574)))

(declare-fun lt!36535 () Unit!2073)

(assert (=> d!7630 (= lt!36535 (choose!9 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!35576)) lt!35574 (BitStream!1263 (buf!1036 (_2!1508 lt!35576)) (currentByte!2349 (_2!1508 lt!35573)) (currentBit!2344 (_2!1508 lt!35573)))))))

(assert (=> d!7630 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1508 lt!35573) (buf!1036 (_2!1508 lt!35576)) lt!35574) lt!36535)))

(declare-fun bs!2200 () Bool)

(assert (= bs!2200 d!7630))

(assert (=> bs!2200 m!35579))

(declare-fun m!36343 () Bool)

(assert (=> bs!2200 m!36343))

(assert (=> b!25095 d!7630))

(declare-fun d!7632 () Bool)

(assert (=> d!7632 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2201 () Bool)

(assert (= bs!2201 d!7632))

(declare-fun m!36345 () Bool)

(assert (=> bs!2201 m!36345))

(assert (=> b!25096 d!7632))

(declare-fun d!7634 () Bool)

(declare-fun res!21968 () Bool)

(declare-fun e!17354 () Bool)

(assert (=> d!7634 (=> (not res!21968) (not e!17354))))

(assert (=> d!7634 (= res!21968 (= (size!715 (buf!1036 thiss!1379)) (size!715 (buf!1036 thiss!1379))))))

(assert (=> d!7634 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!17354)))

(declare-fun b!25470 () Bool)

(declare-fun res!21970 () Bool)

(assert (=> b!25470 (=> (not res!21970) (not e!17354))))

(assert (=> b!25470 (= res!21970 (bvsle (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)) (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(declare-fun b!25471 () Bool)

(declare-fun e!17355 () Bool)

(assert (=> b!25471 (= e!17354 e!17355)))

(declare-fun res!21969 () Bool)

(assert (=> b!25471 (=> res!21969 e!17355)))

(assert (=> b!25471 (= res!21969 (= (size!715 (buf!1036 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!25472 () Bool)

(assert (=> b!25472 (= e!17355 (arrayBitRangesEq!0 (buf!1036 thiss!1379) (buf!1036 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379))))))

(assert (= (and d!7634 res!21968) b!25470))

(assert (= (and b!25470 res!21970) b!25471))

(assert (= (and b!25471 (not res!21969)) b!25472))

(assert (=> b!25470 m!35623))

(assert (=> b!25470 m!35623))

(assert (=> b!25472 m!35623))

(assert (=> b!25472 m!35623))

(declare-fun m!36347 () Bool)

(assert (=> b!25472 m!36347))

(assert (=> b!25097 d!7634))

(declare-fun d!7636 () Bool)

(assert (=> d!7636 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36538 () Unit!2073)

(declare-fun choose!11 (BitStream!1262) Unit!2073)

(assert (=> d!7636 (= lt!36538 (choose!11 thiss!1379))))

(assert (=> d!7636 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!36538)))

(declare-fun bs!2203 () Bool)

(assert (= bs!2203 d!7636))

(assert (=> bs!2203 m!35619))

(declare-fun m!36349 () Bool)

(assert (=> bs!2203 m!36349))

(assert (=> b!25097 d!7636))

(declare-fun d!7638 () Bool)

(declare-fun e!17356 () Bool)

(assert (=> d!7638 e!17356))

(declare-fun res!21971 () Bool)

(assert (=> d!7638 (=> (not res!21971) (not e!17356))))

(declare-fun lt!36544 () (_ BitVec 64))

(declare-fun lt!36541 () (_ BitVec 64))

(declare-fun lt!36542 () (_ BitVec 64))

(assert (=> d!7638 (= res!21971 (= lt!36541 (bvsub lt!36542 lt!36544)))))

(assert (=> d!7638 (or (= (bvand lt!36542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!36544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!36542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!36542 lt!36544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7638 (= lt!36544 (remainingBits!0 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))) ((_ sign_extend 32) (currentByte!2349 thiss!1379)) ((_ sign_extend 32) (currentBit!2344 thiss!1379))))))

(declare-fun lt!36539 () (_ BitVec 64))

(declare-fun lt!36543 () (_ BitVec 64))

(assert (=> d!7638 (= lt!36542 (bvmul lt!36539 lt!36543))))

(assert (=> d!7638 (or (= lt!36539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!36543 (bvsdiv (bvmul lt!36539 lt!36543) lt!36539)))))

(assert (=> d!7638 (= lt!36543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7638 (= lt!36539 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))))))

(assert (=> d!7638 (= lt!36541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2349 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2344 thiss!1379))))))

(assert (=> d!7638 (invariant!0 (currentBit!2344 thiss!1379) (currentByte!2349 thiss!1379) (size!715 (buf!1036 thiss!1379)))))

(assert (=> d!7638 (= (bitIndex!0 (size!715 (buf!1036 thiss!1379)) (currentByte!2349 thiss!1379) (currentBit!2344 thiss!1379)) lt!36541)))

(declare-fun b!25473 () Bool)

(declare-fun res!21972 () Bool)

(assert (=> b!25473 (=> (not res!21972) (not e!17356))))

(assert (=> b!25473 (= res!21972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!36541))))

(declare-fun b!25474 () Bool)

(declare-fun lt!36540 () (_ BitVec 64))

(assert (=> b!25474 (= e!17356 (bvsle lt!36541 (bvmul lt!36540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!25474 (or (= lt!36540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!36540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!36540)))))

(assert (=> b!25474 (= lt!36540 ((_ sign_extend 32) (size!715 (buf!1036 thiss!1379))))))

(assert (= (and d!7638 res!21971) b!25473))

(assert (= (and b!25473 res!21972) b!25474))

(assert (=> d!7638 m!36345))

(assert (=> d!7638 m!36285))

(assert (=> b!25097 d!7638))

(push 1)

(assert (not b!25459))

(assert (not b!25466))

(assert (not b!25467))

(assert (not b!25256))

(assert (not b!25461))

(assert (not bm!343))

(assert (not b!25227))

(assert (not b!25280))

(assert (not d!7620))

(assert (not b!25298))

(assert (not d!7636))

(assert (not b!25468))

(assert (not b!25305))

(assert (not b!25457))

(assert (not b!25456))

(assert (not d!7626))

(assert (not d!7622))

(assert (not b!25472))

(assert (not b!25470))

(assert (not b!25303))

(assert (not b!25238))

(assert (not d!7616))

(assert (not b!25462))

(assert (not b!25454))

(assert (not b!25300))

(assert (not d!7550))

(assert (not b!25299))

(assert (not d!7544))

(assert (not d!7556))

(assert (not d!7618))

(assert (not d!7552))

(assert (not b!25453))

(assert (not d!7558))

(assert (not b!25254))

(assert (not d!7638))

(assert (not b!25458))

(assert (not d!7546))

(assert (not d!7562))

(assert (not d!7624))

(assert (not b!25302))

(assert (not d!7538))

(assert (not d!7630))

(assert (not b!25464))

(assert (not b!25297))

(assert (not b!25463))

(assert (not b!25284))

(assert (not b!25296))

(assert (not b!25239))

(assert (not d!7548))

(assert (not b!25259))

(assert (not b!25283))

(assert (not d!7628))

(assert (not b!25469))

(assert (not b!25277))

(assert (not b!25281))

(assert (not b!25282))

(assert (not d!7540))

(assert (not b!25279))

(assert (not b!25278))

(assert (not d!7632))

(assert (not b!25237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

