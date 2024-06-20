; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12552 () Bool)

(assert start!12552)

(declare-fun b!64101 () Bool)

(declare-fun res!53235 () Bool)

(declare-fun e!42377 () Bool)

(assert (=> b!64101 (=> (not res!53235) (not e!42377))))

(declare-datatypes ((array!2815 0))(
  ( (array!2816 (arr!1856 (Array (_ BitVec 32) (_ BitVec 8))) (size!1292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2236 0))(
  ( (BitStream!2237 (buf!1673 array!2815) (currentByte!3327 (_ BitVec 32)) (currentBit!3322 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2236)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64101 (= res!53235 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!64102 () Bool)

(declare-fun res!53219 () Bool)

(declare-fun e!42374 () Bool)

(assert (=> b!64102 (=> res!53219 e!42374)))

(declare-datatypes ((Unit!4349 0))(
  ( (Unit!4350) )
))
(declare-datatypes ((tuple2!5736 0))(
  ( (tuple2!5737 (_1!2979 Unit!4349) (_2!2979 BitStream!2236)) )
))
(declare-fun lt!101277 () tuple2!5736)

(assert (=> b!64102 (= res!53219 (not (= (size!1292 (buf!1673 thiss!1379)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))

(declare-fun b!64103 () Bool)

(declare-fun e!42366 () Bool)

(declare-fun e!42370 () Bool)

(assert (=> b!64103 (= e!42366 e!42370)))

(declare-fun res!53231 () Bool)

(assert (=> b!64103 (=> res!53231 e!42370)))

(declare-fun lt!101271 () tuple2!5736)

(declare-fun isPrefixOf!0 (BitStream!2236 BitStream!2236) Bool)

(assert (=> b!64103 (= res!53231 (not (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101277))))))

(assert (=> b!64103 (isPrefixOf!0 thiss!1379 (_2!2979 lt!101277))))

(declare-fun lt!101276 () Unit!4349)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2236 BitStream!2236 BitStream!2236) Unit!4349)

(assert (=> b!64103 (= lt!101276 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2979 lt!101271) (_2!2979 lt!101277)))))

(declare-fun srcBuffer!2 () array!2815)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2236 array!2815 (_ BitVec 64) (_ BitVec 64)) tuple2!5736)

(assert (=> b!64103 (= lt!101277 (appendBitsMSBFirstLoop!0 (_2!2979 lt!101271) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42376 () Bool)

(assert (=> b!64103 e!42376))

(declare-fun res!53224 () Bool)

(assert (=> b!64103 (=> (not res!53224) (not e!42376))))

(assert (=> b!64103 (= res!53224 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101267 () Unit!4349)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2236 array!2815 (_ BitVec 64)) Unit!4349)

(assert (=> b!64103 (= lt!101267 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1673 (_2!2979 lt!101271)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5738 0))(
  ( (tuple2!5739 (_1!2980 BitStream!2236) (_2!2980 BitStream!2236)) )
))
(declare-fun lt!101268 () tuple2!5738)

(declare-fun reader!0 (BitStream!2236 BitStream!2236) tuple2!5738)

(assert (=> b!64103 (= lt!101268 (reader!0 thiss!1379 (_2!2979 lt!101271)))))

(declare-fun b!64104 () Bool)

(assert (=> b!64104 (= e!42370 e!42374)))

(declare-fun res!53229 () Bool)

(assert (=> b!64104 (=> res!53229 e!42374)))

(declare-fun lt!101269 () (_ BitVec 64))

(declare-fun lt!101278 () (_ BitVec 64))

(assert (=> b!64104 (= res!53229 (not (= lt!101278 (bvsub (bvadd lt!101269 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64104 (= lt!101278 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277))))))

(declare-fun b!64105 () Bool)

(declare-fun res!53218 () Bool)

(assert (=> b!64105 (=> res!53218 e!42374)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64105 (= res!53218 (not (invariant!0 (currentBit!3322 (_2!2979 lt!101277)) (currentByte!3327 (_2!2979 lt!101277)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))

(declare-fun b!64107 () Bool)

(declare-fun e!42368 () Bool)

(assert (=> b!64107 (= e!42377 (not e!42368))))

(declare-fun res!53217 () Bool)

(assert (=> b!64107 (=> res!53217 e!42368)))

(assert (=> b!64107 (= res!53217 (bvsge i!635 to!314))))

(assert (=> b!64107 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101265 () Unit!4349)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2236) Unit!4349)

(assert (=> b!64107 (= lt!101265 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!64107 (= lt!101269 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(declare-fun b!64108 () Bool)

(declare-fun e!42371 () Bool)

(assert (=> b!64108 (= e!42371 (= lt!101278 (bvsub (bvsub (bvadd (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64109 () Bool)

(declare-fun e!42367 () Bool)

(declare-fun lt!101270 () tuple2!5738)

(declare-fun lt!101272 () tuple2!5738)

(assert (=> b!64109 (= e!42367 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270)))) (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101272))) (currentByte!3327 (_1!2980 lt!101272)) (currentBit!3322 (_1!2980 lt!101272)))))))

(declare-fun b!64110 () Bool)

(assert (=> b!64110 (= e!42368 e!42366)))

(declare-fun res!53234 () Bool)

(assert (=> b!64110 (=> res!53234 e!42366)))

(assert (=> b!64110 (= res!53234 (not (isPrefixOf!0 thiss!1379 (_2!2979 lt!101271))))))

(declare-fun lt!101263 () (_ BitVec 64))

(assert (=> b!64110 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!101263)))

(assert (=> b!64110 (= lt!101263 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101274 () Unit!4349)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2236 BitStream!2236 (_ BitVec 64) (_ BitVec 64)) Unit!4349)

(assert (=> b!64110 (= lt!101274 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2979 lt!101271) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2236 (_ BitVec 8) (_ BitVec 32)) tuple2!5736)

(assert (=> b!64110 (= lt!101271 (appendBitFromByte!0 thiss!1379 (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64111 () Bool)

(declare-fun e!42372 () Bool)

(declare-fun array_inv!1177 (array!2815) Bool)

(assert (=> b!64111 (= e!42372 (array_inv!1177 (buf!1673 thiss!1379)))))

(declare-fun b!64112 () Bool)

(declare-fun res!53222 () Bool)

(assert (=> b!64112 (=> res!53222 e!42367)))

(declare-datatypes ((List!693 0))(
  ( (Nil!690) (Cons!689 (h!808 Bool) (t!1443 List!693)) )
))
(declare-fun lt!101264 () List!693)

(declare-fun length!321 (List!693) Int)

(assert (=> b!64112 (= res!53222 (<= (length!321 lt!101264) 0))))

(declare-fun b!64113 () Bool)

(declare-fun e!42369 () Bool)

(assert (=> b!64113 (= e!42374 e!42369)))

(declare-fun res!53220 () Bool)

(assert (=> b!64113 (=> res!53220 e!42369)))

(assert (=> b!64113 (= res!53220 (not (= (size!1292 (buf!1673 (_2!2979 lt!101271))) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))

(assert (=> b!64113 e!42371))

(declare-fun res!53233 () Bool)

(assert (=> b!64113 (=> (not res!53233) (not e!42371))))

(assert (=> b!64113 (= res!53233 (= (size!1292 (buf!1673 (_2!2979 lt!101277))) (size!1292 (buf!1673 thiss!1379))))))

(declare-fun b!64114 () Bool)

(declare-fun res!53228 () Bool)

(assert (=> b!64114 (=> res!53228 e!42369)))

(assert (=> b!64114 (= res!53228 (not (invariant!0 (currentBit!3322 (_2!2979 lt!101271)) (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))

(declare-fun b!64115 () Bool)

(declare-fun res!53225 () Bool)

(assert (=> b!64115 (=> res!53225 e!42367)))

(assert (=> b!64115 (= res!53225 (or (not (= (buf!1673 (_1!2980 lt!101270)) (buf!1673 (_1!2980 lt!101272)))) (not (= (buf!1673 (_1!2980 lt!101270)) (buf!1673 (_2!2979 lt!101277)))) (bvsge lt!101278 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun res!53227 () Bool)

(assert (=> start!12552 (=> (not res!53227) (not e!42377))))

(assert (=> start!12552 (= res!53227 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1292 srcBuffer!2))))))))

(assert (=> start!12552 e!42377))

(assert (=> start!12552 true))

(assert (=> start!12552 (array_inv!1177 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2236) Bool)

(assert (=> start!12552 (and (inv!12 thiss!1379) e!42372)))

(declare-fun b!64106 () Bool)

(declare-fun res!53226 () Bool)

(assert (=> b!64106 (=> res!53226 e!42367)))

(assert (=> b!64106 (= res!53226 (not (isPrefixOf!0 (_1!2980 lt!101270) (_1!2980 lt!101272))))))

(declare-fun b!64116 () Bool)

(assert (=> b!64116 (= e!42369 e!42367)))

(declare-fun res!53232 () Bool)

(assert (=> b!64116 (=> res!53232 e!42367)))

(assert (=> b!64116 (= res!53232 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101266 () List!693)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2236 BitStream!2236 (_ BitVec 64)) List!693)

(assert (=> b!64116 (= lt!101266 (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_1!2980 lt!101272) lt!101263))))

(assert (=> b!64116 (= lt!101264 (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_1!2980 lt!101270) (bvsub to!314 i!635)))))

(assert (=> b!64116 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!101263)))

(declare-fun lt!101275 () Unit!4349)

(assert (=> b!64116 (= lt!101275 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!101277)) lt!101263))))

(assert (=> b!64116 (= lt!101272 (reader!0 (_2!2979 lt!101271) (_2!2979 lt!101277)))))

(assert (=> b!64116 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101273 () Unit!4349)

(assert (=> b!64116 (= lt!101273 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1673 (_2!2979 lt!101277)) (bvsub to!314 i!635)))))

(assert (=> b!64116 (= lt!101270 (reader!0 thiss!1379 (_2!2979 lt!101277)))))

(declare-fun b!64117 () Bool)

(declare-fun res!53221 () Bool)

(assert (=> b!64117 (=> res!53221 e!42369)))

(assert (=> b!64117 (= res!53221 (not (invariant!0 (currentBit!3322 (_2!2979 lt!101271)) (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101271))))))))

(declare-fun b!64118 () Bool)

(declare-fun res!53223 () Bool)

(assert (=> b!64118 (=> res!53223 e!42367)))

(assert (=> b!64118 (= res!53223 (not (isPrefixOf!0 (_1!2980 lt!101272) (_2!2979 lt!101277))))))

(declare-fun b!64119 () Bool)

(declare-fun res!53230 () Bool)

(assert (=> b!64119 (=> res!53230 e!42367)))

(assert (=> b!64119 (= res!53230 (not (isPrefixOf!0 (_1!2980 lt!101270) (_2!2979 lt!101277))))))

(declare-fun b!64120 () Bool)

(declare-fun head!512 (List!693) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2236 array!2815 (_ BitVec 64) (_ BitVec 64)) List!693)

(assert (=> b!64120 (= e!42376 (= (head!512 (byteArrayBitContentToList!0 (_2!2979 lt!101271) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!512 (bitStreamReadBitsIntoList!0 (_2!2979 lt!101271) (_1!2980 lt!101268) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!12552 res!53227) b!64101))

(assert (= (and b!64101 res!53235) b!64107))

(assert (= (and b!64107 (not res!53217)) b!64110))

(assert (= (and b!64110 (not res!53234)) b!64103))

(assert (= (and b!64103 res!53224) b!64120))

(assert (= (and b!64103 (not res!53231)) b!64104))

(assert (= (and b!64104 (not res!53229)) b!64105))

(assert (= (and b!64105 (not res!53218)) b!64102))

(assert (= (and b!64102 (not res!53219)) b!64113))

(assert (= (and b!64113 res!53233) b!64108))

(assert (= (and b!64113 (not res!53220)) b!64117))

(assert (= (and b!64117 (not res!53221)) b!64114))

(assert (= (and b!64114 (not res!53228)) b!64116))

(assert (= (and b!64116 (not res!53232)) b!64112))

(assert (= (and b!64112 (not res!53222)) b!64119))

(assert (= (and b!64119 (not res!53230)) b!64118))

(assert (= (and b!64118 (not res!53223)) b!64106))

(assert (= (and b!64106 (not res!53226)) b!64115))

(assert (= (and b!64115 (not res!53225)) b!64109))

(assert (= start!12552 b!64111))

(declare-fun m!101653 () Bool)

(assert (=> b!64103 m!101653))

(declare-fun m!101655 () Bool)

(assert (=> b!64103 m!101655))

(declare-fun m!101657 () Bool)

(assert (=> b!64103 m!101657))

(declare-fun m!101659 () Bool)

(assert (=> b!64103 m!101659))

(declare-fun m!101661 () Bool)

(assert (=> b!64103 m!101661))

(declare-fun m!101663 () Bool)

(assert (=> b!64103 m!101663))

(declare-fun m!101665 () Bool)

(assert (=> b!64103 m!101665))

(declare-fun m!101667 () Bool)

(assert (=> b!64118 m!101667))

(declare-fun m!101669 () Bool)

(assert (=> b!64109 m!101669))

(declare-fun m!101671 () Bool)

(assert (=> b!64109 m!101671))

(declare-fun m!101673 () Bool)

(assert (=> b!64106 m!101673))

(declare-fun m!101675 () Bool)

(assert (=> b!64119 m!101675))

(declare-fun m!101677 () Bool)

(assert (=> b!64110 m!101677))

(declare-fun m!101679 () Bool)

(assert (=> b!64110 m!101679))

(declare-fun m!101681 () Bool)

(assert (=> b!64110 m!101681))

(declare-fun m!101683 () Bool)

(assert (=> b!64110 m!101683))

(declare-fun m!101685 () Bool)

(assert (=> b!64110 m!101685))

(assert (=> b!64110 m!101681))

(declare-fun m!101687 () Bool)

(assert (=> b!64112 m!101687))

(declare-fun m!101689 () Bool)

(assert (=> b!64117 m!101689))

(declare-fun m!101691 () Bool)

(assert (=> b!64114 m!101691))

(declare-fun m!101693 () Bool)

(assert (=> b!64108 m!101693))

(declare-fun m!101695 () Bool)

(assert (=> b!64101 m!101695))

(declare-fun m!101697 () Bool)

(assert (=> b!64111 m!101697))

(declare-fun m!101699 () Bool)

(assert (=> b!64107 m!101699))

(declare-fun m!101701 () Bool)

(assert (=> b!64107 m!101701))

(declare-fun m!101703 () Bool)

(assert (=> b!64107 m!101703))

(declare-fun m!101705 () Bool)

(assert (=> b!64116 m!101705))

(declare-fun m!101707 () Bool)

(assert (=> b!64116 m!101707))

(declare-fun m!101709 () Bool)

(assert (=> b!64116 m!101709))

(declare-fun m!101711 () Bool)

(assert (=> b!64116 m!101711))

(declare-fun m!101713 () Bool)

(assert (=> b!64116 m!101713))

(declare-fun m!101715 () Bool)

(assert (=> b!64116 m!101715))

(declare-fun m!101717 () Bool)

(assert (=> b!64116 m!101717))

(declare-fun m!101719 () Bool)

(assert (=> b!64116 m!101719))

(declare-fun m!101721 () Bool)

(assert (=> b!64104 m!101721))

(declare-fun m!101723 () Bool)

(assert (=> b!64120 m!101723))

(assert (=> b!64120 m!101723))

(declare-fun m!101725 () Bool)

(assert (=> b!64120 m!101725))

(declare-fun m!101727 () Bool)

(assert (=> b!64120 m!101727))

(assert (=> b!64120 m!101727))

(declare-fun m!101729 () Bool)

(assert (=> b!64120 m!101729))

(declare-fun m!101731 () Bool)

(assert (=> b!64105 m!101731))

(declare-fun m!101733 () Bool)

(assert (=> start!12552 m!101733))

(declare-fun m!101735 () Bool)

(assert (=> start!12552 m!101735))

(push 1)

(assert (not b!64101))

(assert (not b!64112))

(assert (not b!64103))

(assert (not b!64109))

(assert (not b!64118))

(assert (not b!64111))

(assert (not b!64110))

(assert (not b!64119))

(assert (not b!64107))

(assert (not b!64116))

(assert (not b!64108))

(assert (not start!12552))

(assert (not b!64104))

(assert (not b!64120))

(assert (not b!64106))

(assert (not b!64117))

(assert (not b!64105))

(assert (not b!64114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20008 () Bool)

(declare-fun res!53405 () Bool)

(declare-fun e!42483 () Bool)

(assert (=> d!20008 (=> (not res!53405) (not e!42483))))

(assert (=> d!20008 (= res!53405 (= (size!1292 (buf!1673 (_1!2980 lt!101270))) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (=> d!20008 (= (isPrefixOf!0 (_1!2980 lt!101270) (_2!2979 lt!101277)) e!42483)))

(declare-fun b!64296 () Bool)

(declare-fun res!53404 () Bool)

(assert (=> b!64296 (=> (not res!53404) (not e!42483))))

(assert (=> b!64296 (= res!53404 (bvsle (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270))) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277)))))))

(declare-fun b!64297 () Bool)

(declare-fun e!42482 () Bool)

(assert (=> b!64297 (= e!42483 e!42482)))

(declare-fun res!53406 () Bool)

(assert (=> b!64297 (=> res!53406 e!42482)))

(assert (=> b!64297 (= res!53406 (= (size!1292 (buf!1673 (_1!2980 lt!101270))) #b00000000000000000000000000000000))))

(declare-fun b!64298 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2815 array!2815 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64298 (= e!42482 (arrayBitRangesEq!0 (buf!1673 (_1!2980 lt!101270)) (buf!1673 (_2!2979 lt!101277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270)))))))

(assert (= (and d!20008 res!53405) b!64296))

(assert (= (and b!64296 res!53404) b!64297))

(assert (= (and b!64297 (not res!53406)) b!64298))

(assert (=> b!64296 m!101669))

(assert (=> b!64296 m!101721))

(assert (=> b!64298 m!101669))

(assert (=> b!64298 m!101669))

(declare-fun m!101947 () Bool)

(assert (=> b!64298 m!101947))

(assert (=> b!64119 d!20008))

(declare-fun d!20010 () Bool)

(declare-fun e!42486 () Bool)

(assert (=> d!20010 e!42486))

(declare-fun res!53412 () Bool)

(assert (=> d!20010 (=> (not res!53412) (not e!42486))))

(declare-fun lt!101444 () (_ BitVec 64))

(declare-fun lt!101447 () (_ BitVec 64))

(declare-fun lt!101446 () (_ BitVec 64))

(assert (=> d!20010 (= res!53412 (= lt!101446 (bvsub lt!101444 lt!101447)))))

(assert (=> d!20010 (or (= (bvand lt!101444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101444 lt!101447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20010 (= lt!101447 (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271)))))))

(declare-fun lt!101448 () (_ BitVec 64))

(declare-fun lt!101445 () (_ BitVec 64))

(assert (=> d!20010 (= lt!101444 (bvmul lt!101448 lt!101445))))

(assert (=> d!20010 (or (= lt!101448 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101445 (bvsdiv (bvmul lt!101448 lt!101445) lt!101448)))))

(assert (=> d!20010 (= lt!101445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20010 (= lt!101448 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))))))

(assert (=> d!20010 (= lt!101446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271)))))))

(assert (=> d!20010 (invariant!0 (currentBit!3322 (_2!2979 lt!101271)) (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101271))))))

(assert (=> d!20010 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))) lt!101446)))

(declare-fun b!64303 () Bool)

(declare-fun res!53411 () Bool)

(assert (=> b!64303 (=> (not res!53411) (not e!42486))))

(assert (=> b!64303 (= res!53411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101446))))

(declare-fun b!64304 () Bool)

(declare-fun lt!101449 () (_ BitVec 64))

(assert (=> b!64304 (= e!42486 (bvsle lt!101446 (bvmul lt!101449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64304 (or (= lt!101449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101449)))))

(assert (=> b!64304 (= lt!101449 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))))))

(assert (= (and d!20010 res!53412) b!64303))

(assert (= (and b!64303 res!53411) b!64304))

(declare-fun m!101949 () Bool)

(assert (=> d!20010 m!101949))

(assert (=> d!20010 m!101689))

(assert (=> b!64108 d!20010))

(declare-fun d!20012 () Bool)

(declare-fun res!53414 () Bool)

(declare-fun e!42488 () Bool)

(assert (=> d!20012 (=> (not res!53414) (not e!42488))))

(assert (=> d!20012 (= res!53414 (= (size!1292 (buf!1673 (_1!2980 lt!101272))) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (=> d!20012 (= (isPrefixOf!0 (_1!2980 lt!101272) (_2!2979 lt!101277)) e!42488)))

(declare-fun b!64305 () Bool)

(declare-fun res!53413 () Bool)

(assert (=> b!64305 (=> (not res!53413) (not e!42488))))

(assert (=> b!64305 (= res!53413 (bvsle (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101272))) (currentByte!3327 (_1!2980 lt!101272)) (currentBit!3322 (_1!2980 lt!101272))) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277)))))))

(declare-fun b!64306 () Bool)

(declare-fun e!42487 () Bool)

(assert (=> b!64306 (= e!42488 e!42487)))

(declare-fun res!53415 () Bool)

(assert (=> b!64306 (=> res!53415 e!42487)))

(assert (=> b!64306 (= res!53415 (= (size!1292 (buf!1673 (_1!2980 lt!101272))) #b00000000000000000000000000000000))))

(declare-fun b!64307 () Bool)

(assert (=> b!64307 (= e!42487 (arrayBitRangesEq!0 (buf!1673 (_1!2980 lt!101272)) (buf!1673 (_2!2979 lt!101277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101272))) (currentByte!3327 (_1!2980 lt!101272)) (currentBit!3322 (_1!2980 lt!101272)))))))

(assert (= (and d!20012 res!53414) b!64305))

(assert (= (and b!64305 res!53413) b!64306))

(assert (= (and b!64306 (not res!53415)) b!64307))

(assert (=> b!64305 m!101671))

(assert (=> b!64305 m!101721))

(assert (=> b!64307 m!101671))

(assert (=> b!64307 m!101671))

(declare-fun m!101951 () Bool)

(assert (=> b!64307 m!101951))

(assert (=> b!64118 d!20012))

(declare-fun d!20014 () Bool)

(declare-fun res!53417 () Bool)

(declare-fun e!42490 () Bool)

(assert (=> d!20014 (=> (not res!53417) (not e!42490))))

(assert (=> d!20014 (= res!53417 (= (size!1292 (buf!1673 thiss!1379)) (size!1292 (buf!1673 thiss!1379))))))

(assert (=> d!20014 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42490)))

(declare-fun b!64308 () Bool)

(declare-fun res!53416 () Bool)

(assert (=> b!64308 (=> (not res!53416) (not e!42490))))

(assert (=> b!64308 (= res!53416 (bvsle (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)) (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(declare-fun b!64309 () Bool)

(declare-fun e!42489 () Bool)

(assert (=> b!64309 (= e!42490 e!42489)))

(declare-fun res!53418 () Bool)

(assert (=> b!64309 (=> res!53418 e!42489)))

(assert (=> b!64309 (= res!53418 (= (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64310 () Bool)

(assert (=> b!64310 (= e!42489 (arrayBitRangesEq!0 (buf!1673 thiss!1379) (buf!1673 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(assert (= (and d!20014 res!53417) b!64308))

(assert (= (and b!64308 res!53416) b!64309))

(assert (= (and b!64309 (not res!53418)) b!64310))

(assert (=> b!64308 m!101703))

(assert (=> b!64308 m!101703))

(assert (=> b!64310 m!101703))

(assert (=> b!64310 m!101703))

(declare-fun m!101953 () Bool)

(assert (=> b!64310 m!101953))

(assert (=> b!64107 d!20014))

(declare-fun d!20016 () Bool)

(assert (=> d!20016 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!101452 () Unit!4349)

(declare-fun choose!11 (BitStream!2236) Unit!4349)

(assert (=> d!20016 (= lt!101452 (choose!11 thiss!1379))))

(assert (=> d!20016 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!101452)))

(declare-fun bs!4919 () Bool)

(assert (= bs!4919 d!20016))

(assert (=> bs!4919 m!101699))

(declare-fun m!101955 () Bool)

(assert (=> bs!4919 m!101955))

(assert (=> b!64107 d!20016))

(declare-fun d!20018 () Bool)

(declare-fun e!42491 () Bool)

(assert (=> d!20018 e!42491))

(declare-fun res!53420 () Bool)

(assert (=> d!20018 (=> (not res!53420) (not e!42491))))

(declare-fun lt!101455 () (_ BitVec 64))

(declare-fun lt!101453 () (_ BitVec 64))

(declare-fun lt!101456 () (_ BitVec 64))

(assert (=> d!20018 (= res!53420 (= lt!101455 (bvsub lt!101453 lt!101456)))))

(assert (=> d!20018 (or (= (bvand lt!101453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101456 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101453 lt!101456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20018 (= lt!101456 (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379))))))

(declare-fun lt!101457 () (_ BitVec 64))

(declare-fun lt!101454 () (_ BitVec 64))

(assert (=> d!20018 (= lt!101453 (bvmul lt!101457 lt!101454))))

(assert (=> d!20018 (or (= lt!101457 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101454 (bvsdiv (bvmul lt!101457 lt!101454) lt!101457)))))

(assert (=> d!20018 (= lt!101454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20018 (= lt!101457 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))))))

(assert (=> d!20018 (= lt!101455 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3327 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3322 thiss!1379))))))

(assert (=> d!20018 (invariant!0 (currentBit!3322 thiss!1379) (currentByte!3327 thiss!1379) (size!1292 (buf!1673 thiss!1379)))))

(assert (=> d!20018 (= (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)) lt!101455)))

(declare-fun b!64311 () Bool)

(declare-fun res!53419 () Bool)

(assert (=> b!64311 (=> (not res!53419) (not e!42491))))

(assert (=> b!64311 (= res!53419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101455))))

(declare-fun b!64312 () Bool)

(declare-fun lt!101458 () (_ BitVec 64))

(assert (=> b!64312 (= e!42491 (bvsle lt!101455 (bvmul lt!101458 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64312 (or (= lt!101458 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101458 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101458)))))

(assert (=> b!64312 (= lt!101458 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))))))

(assert (= (and d!20018 res!53420) b!64311))

(assert (= (and b!64311 res!53419) b!64312))

(declare-fun m!101957 () Bool)

(assert (=> d!20018 m!101957))

(declare-fun m!101959 () Bool)

(assert (=> d!20018 m!101959))

(assert (=> b!64107 d!20018))

(declare-fun d!20020 () Bool)

(assert (=> d!20020 (= (invariant!0 (currentBit!3322 (_2!2979 lt!101271)) (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101271)))) (and (bvsge (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (bvslt (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000001000) (bvsge (currentByte!3327 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101271)))) (and (= (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (= (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101271))))))))))

(assert (=> b!64117 d!20020))

(declare-fun d!20022 () Bool)

(declare-fun res!53422 () Bool)

(declare-fun e!42493 () Bool)

(assert (=> d!20022 (=> (not res!53422) (not e!42493))))

(assert (=> d!20022 (= res!53422 (= (size!1292 (buf!1673 (_1!2980 lt!101270))) (size!1292 (buf!1673 (_1!2980 lt!101272)))))))

(assert (=> d!20022 (= (isPrefixOf!0 (_1!2980 lt!101270) (_1!2980 lt!101272)) e!42493)))

(declare-fun b!64313 () Bool)

(declare-fun res!53421 () Bool)

(assert (=> b!64313 (=> (not res!53421) (not e!42493))))

(assert (=> b!64313 (= res!53421 (bvsle (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270))) (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101272))) (currentByte!3327 (_1!2980 lt!101272)) (currentBit!3322 (_1!2980 lt!101272)))))))

(declare-fun b!64314 () Bool)

(declare-fun e!42492 () Bool)

(assert (=> b!64314 (= e!42493 e!42492)))

(declare-fun res!53423 () Bool)

(assert (=> b!64314 (=> res!53423 e!42492)))

(assert (=> b!64314 (= res!53423 (= (size!1292 (buf!1673 (_1!2980 lt!101270))) #b00000000000000000000000000000000))))

(declare-fun b!64315 () Bool)

(assert (=> b!64315 (= e!42492 (arrayBitRangesEq!0 (buf!1673 (_1!2980 lt!101270)) (buf!1673 (_1!2980 lt!101272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270)))))))

(assert (= (and d!20022 res!53422) b!64313))

(assert (= (and b!64313 res!53421) b!64314))

(assert (= (and b!64314 (not res!53423)) b!64315))

(assert (=> b!64313 m!101669))

(assert (=> b!64313 m!101671))

(assert (=> b!64315 m!101669))

(assert (=> b!64315 m!101669))

(declare-fun m!101961 () Bool)

(assert (=> b!64315 m!101961))

(assert (=> b!64106 d!20022))

(declare-fun d!20024 () Bool)

(assert (=> d!20024 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101461 () Unit!4349)

(declare-fun choose!9 (BitStream!2236 array!2815 (_ BitVec 64) BitStream!2236) Unit!4349)

(assert (=> d!20024 (= lt!101461 (choose!9 thiss!1379 (buf!1673 (_2!2979 lt!101277)) (bvsub to!314 i!635) (BitStream!2237 (buf!1673 (_2!2979 lt!101277)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(assert (=> d!20024 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1673 (_2!2979 lt!101277)) (bvsub to!314 i!635)) lt!101461)))

(declare-fun bs!4920 () Bool)

(assert (= bs!4920 d!20024))

(assert (=> bs!4920 m!101719))

(declare-fun m!101963 () Bool)

(assert (=> bs!4920 m!101963))

(assert (=> b!64116 d!20024))

(declare-fun b!64326 () Bool)

(declare-fun e!42499 () Unit!4349)

(declare-fun lt!101515 () Unit!4349)

(assert (=> b!64326 (= e!42499 lt!101515)))

(declare-fun lt!101505 () (_ BitVec 64))

(assert (=> b!64326 (= lt!101505 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101502 () (_ BitVec 64))

(assert (=> b!64326 (= lt!101502 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2815 array!2815 (_ BitVec 64) (_ BitVec 64)) Unit!4349)

(assert (=> b!64326 (= lt!101515 (arrayBitRangesEqSymmetric!0 (buf!1673 thiss!1379) (buf!1673 (_2!2979 lt!101277)) lt!101505 lt!101502))))

(assert (=> b!64326 (arrayBitRangesEq!0 (buf!1673 (_2!2979 lt!101277)) (buf!1673 thiss!1379) lt!101505 lt!101502)))

(declare-fun lt!101519 () (_ BitVec 64))

(declare-fun lt!101520 () (_ BitVec 64))

(declare-fun lt!101517 () tuple2!5738)

(declare-fun b!64327 () Bool)

(declare-fun e!42498 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2236 (_ BitVec 64)) BitStream!2236)

(assert (=> b!64327 (= e!42498 (= (_1!2980 lt!101517) (withMovedBitIndex!0 (_2!2980 lt!101517) (bvsub lt!101520 lt!101519))))))

(assert (=> b!64327 (or (= (bvand lt!101520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101520 lt!101519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64327 (= lt!101519 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277))))))

(assert (=> b!64327 (= lt!101520 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(declare-fun d!20026 () Bool)

(assert (=> d!20026 e!42498))

(declare-fun res!53431 () Bool)

(assert (=> d!20026 (=> (not res!53431) (not e!42498))))

(assert (=> d!20026 (= res!53431 (isPrefixOf!0 (_1!2980 lt!101517) (_2!2980 lt!101517)))))

(declare-fun lt!101510 () BitStream!2236)

(assert (=> d!20026 (= lt!101517 (tuple2!5739 lt!101510 (_2!2979 lt!101277)))))

(declare-fun lt!101514 () Unit!4349)

(declare-fun lt!101516 () Unit!4349)

(assert (=> d!20026 (= lt!101514 lt!101516)))

(assert (=> d!20026 (isPrefixOf!0 lt!101510 (_2!2979 lt!101277))))

(assert (=> d!20026 (= lt!101516 (lemmaIsPrefixTransitive!0 lt!101510 (_2!2979 lt!101277) (_2!2979 lt!101277)))))

(declare-fun lt!101508 () Unit!4349)

(declare-fun lt!101506 () Unit!4349)

(assert (=> d!20026 (= lt!101508 lt!101506)))

(assert (=> d!20026 (isPrefixOf!0 lt!101510 (_2!2979 lt!101277))))

(assert (=> d!20026 (= lt!101506 (lemmaIsPrefixTransitive!0 lt!101510 thiss!1379 (_2!2979 lt!101277)))))

(declare-fun lt!101511 () Unit!4349)

(assert (=> d!20026 (= lt!101511 e!42499)))

(declare-fun c!4608 () Bool)

(assert (=> d!20026 (= c!4608 (not (= (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101507 () Unit!4349)

(declare-fun lt!101513 () Unit!4349)

(assert (=> d!20026 (= lt!101507 lt!101513)))

(assert (=> d!20026 (isPrefixOf!0 (_2!2979 lt!101277) (_2!2979 lt!101277))))

(assert (=> d!20026 (= lt!101513 (lemmaIsPrefixRefl!0 (_2!2979 lt!101277)))))

(declare-fun lt!101521 () Unit!4349)

(declare-fun lt!101512 () Unit!4349)

(assert (=> d!20026 (= lt!101521 lt!101512)))

(assert (=> d!20026 (= lt!101512 (lemmaIsPrefixRefl!0 (_2!2979 lt!101277)))))

(declare-fun lt!101504 () Unit!4349)

(declare-fun lt!101518 () Unit!4349)

(assert (=> d!20026 (= lt!101504 lt!101518)))

(assert (=> d!20026 (isPrefixOf!0 lt!101510 lt!101510)))

(assert (=> d!20026 (= lt!101518 (lemmaIsPrefixRefl!0 lt!101510))))

(declare-fun lt!101509 () Unit!4349)

(declare-fun lt!101503 () Unit!4349)

(assert (=> d!20026 (= lt!101509 lt!101503)))

(assert (=> d!20026 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20026 (= lt!101503 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20026 (= lt!101510 (BitStream!2237 (buf!1673 (_2!2979 lt!101277)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(assert (=> d!20026 (isPrefixOf!0 thiss!1379 (_2!2979 lt!101277))))

(assert (=> d!20026 (= (reader!0 thiss!1379 (_2!2979 lt!101277)) lt!101517)))

(declare-fun b!64328 () Bool)

(declare-fun Unit!4366 () Unit!4349)

(assert (=> b!64328 (= e!42499 Unit!4366)))

(declare-fun b!64329 () Bool)

(declare-fun res!53430 () Bool)

(assert (=> b!64329 (=> (not res!53430) (not e!42498))))

(assert (=> b!64329 (= res!53430 (isPrefixOf!0 (_1!2980 lt!101517) thiss!1379))))

(declare-fun b!64330 () Bool)

(declare-fun res!53432 () Bool)

(assert (=> b!64330 (=> (not res!53432) (not e!42498))))

(assert (=> b!64330 (= res!53432 (isPrefixOf!0 (_2!2980 lt!101517) (_2!2979 lt!101277)))))

(assert (= (and d!20026 c!4608) b!64326))

(assert (= (and d!20026 (not c!4608)) b!64328))

(assert (= (and d!20026 res!53431) b!64329))

(assert (= (and b!64329 res!53430) b!64330))

(assert (= (and b!64330 res!53432) b!64327))

(declare-fun m!101965 () Bool)

(assert (=> b!64329 m!101965))

(assert (=> d!20026 m!101701))

(declare-fun m!101967 () Bool)

(assert (=> d!20026 m!101967))

(assert (=> d!20026 m!101653))

(declare-fun m!101969 () Bool)

(assert (=> d!20026 m!101969))

(declare-fun m!101971 () Bool)

(assert (=> d!20026 m!101971))

(declare-fun m!101973 () Bool)

(assert (=> d!20026 m!101973))

(assert (=> d!20026 m!101699))

(declare-fun m!101975 () Bool)

(assert (=> d!20026 m!101975))

(declare-fun m!101977 () Bool)

(assert (=> d!20026 m!101977))

(declare-fun m!101979 () Bool)

(assert (=> d!20026 m!101979))

(declare-fun m!101981 () Bool)

(assert (=> d!20026 m!101981))

(assert (=> b!64326 m!101703))

(declare-fun m!101983 () Bool)

(assert (=> b!64326 m!101983))

(declare-fun m!101985 () Bool)

(assert (=> b!64326 m!101985))

(declare-fun m!101987 () Bool)

(assert (=> b!64330 m!101987))

(declare-fun m!101989 () Bool)

(assert (=> b!64327 m!101989))

(assert (=> b!64327 m!101721))

(assert (=> b!64327 m!101703))

(assert (=> b!64116 d!20026))

(declare-fun d!20030 () Bool)

(assert (=> d!20030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!101263) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271)))) lt!101263))))

(declare-fun bs!4921 () Bool)

(assert (= bs!4921 d!20030))

(declare-fun m!101991 () Bool)

(assert (=> bs!4921 m!101991))

(assert (=> b!64116 d!20030))

(declare-fun b!64331 () Bool)

(declare-fun e!42501 () Unit!4349)

(declare-fun lt!101535 () Unit!4349)

(assert (=> b!64331 (= e!42501 lt!101535)))

(declare-fun lt!101525 () (_ BitVec 64))

(assert (=> b!64331 (= lt!101525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101522 () (_ BitVec 64))

(assert (=> b!64331 (= lt!101522 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(assert (=> b!64331 (= lt!101535 (arrayBitRangesEqSymmetric!0 (buf!1673 (_2!2979 lt!101271)) (buf!1673 (_2!2979 lt!101277)) lt!101525 lt!101522))))

(assert (=> b!64331 (arrayBitRangesEq!0 (buf!1673 (_2!2979 lt!101277)) (buf!1673 (_2!2979 lt!101271)) lt!101525 lt!101522)))

(declare-fun lt!101537 () tuple2!5738)

(declare-fun lt!101540 () (_ BitVec 64))

(declare-fun e!42500 () Bool)

(declare-fun b!64332 () Bool)

(declare-fun lt!101539 () (_ BitVec 64))

(assert (=> b!64332 (= e!42500 (= (_1!2980 lt!101537) (withMovedBitIndex!0 (_2!2980 lt!101537) (bvsub lt!101540 lt!101539))))))

(assert (=> b!64332 (or (= (bvand lt!101540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101540 lt!101539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64332 (= lt!101539 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277))))))

(assert (=> b!64332 (= lt!101540 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(declare-fun d!20032 () Bool)

(assert (=> d!20032 e!42500))

(declare-fun res!53434 () Bool)

(assert (=> d!20032 (=> (not res!53434) (not e!42500))))

(assert (=> d!20032 (= res!53434 (isPrefixOf!0 (_1!2980 lt!101537) (_2!2980 lt!101537)))))

(declare-fun lt!101530 () BitStream!2236)

(assert (=> d!20032 (= lt!101537 (tuple2!5739 lt!101530 (_2!2979 lt!101277)))))

(declare-fun lt!101534 () Unit!4349)

(declare-fun lt!101536 () Unit!4349)

(assert (=> d!20032 (= lt!101534 lt!101536)))

(assert (=> d!20032 (isPrefixOf!0 lt!101530 (_2!2979 lt!101277))))

(assert (=> d!20032 (= lt!101536 (lemmaIsPrefixTransitive!0 lt!101530 (_2!2979 lt!101277) (_2!2979 lt!101277)))))

(declare-fun lt!101528 () Unit!4349)

(declare-fun lt!101526 () Unit!4349)

(assert (=> d!20032 (= lt!101528 lt!101526)))

(assert (=> d!20032 (isPrefixOf!0 lt!101530 (_2!2979 lt!101277))))

(assert (=> d!20032 (= lt!101526 (lemmaIsPrefixTransitive!0 lt!101530 (_2!2979 lt!101271) (_2!2979 lt!101277)))))

(declare-fun lt!101531 () Unit!4349)

(assert (=> d!20032 (= lt!101531 e!42501)))

(declare-fun c!4609 () Bool)

(assert (=> d!20032 (= c!4609 (not (= (size!1292 (buf!1673 (_2!2979 lt!101271))) #b00000000000000000000000000000000)))))

(declare-fun lt!101527 () Unit!4349)

(declare-fun lt!101533 () Unit!4349)

(assert (=> d!20032 (= lt!101527 lt!101533)))

(assert (=> d!20032 (isPrefixOf!0 (_2!2979 lt!101277) (_2!2979 lt!101277))))

(assert (=> d!20032 (= lt!101533 (lemmaIsPrefixRefl!0 (_2!2979 lt!101277)))))

(declare-fun lt!101541 () Unit!4349)

(declare-fun lt!101532 () Unit!4349)

(assert (=> d!20032 (= lt!101541 lt!101532)))

(assert (=> d!20032 (= lt!101532 (lemmaIsPrefixRefl!0 (_2!2979 lt!101277)))))

(declare-fun lt!101524 () Unit!4349)

(declare-fun lt!101538 () Unit!4349)

(assert (=> d!20032 (= lt!101524 lt!101538)))

(assert (=> d!20032 (isPrefixOf!0 lt!101530 lt!101530)))

(assert (=> d!20032 (= lt!101538 (lemmaIsPrefixRefl!0 lt!101530))))

(declare-fun lt!101529 () Unit!4349)

(declare-fun lt!101523 () Unit!4349)

(assert (=> d!20032 (= lt!101529 lt!101523)))

(assert (=> d!20032 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101271))))

(assert (=> d!20032 (= lt!101523 (lemmaIsPrefixRefl!0 (_2!2979 lt!101271)))))

(assert (=> d!20032 (= lt!101530 (BitStream!2237 (buf!1673 (_2!2979 lt!101277)) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(assert (=> d!20032 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101277))))

(assert (=> d!20032 (= (reader!0 (_2!2979 lt!101271) (_2!2979 lt!101277)) lt!101537)))

(declare-fun b!64333 () Bool)

(declare-fun Unit!4372 () Unit!4349)

(assert (=> b!64333 (= e!42501 Unit!4372)))

(declare-fun b!64334 () Bool)

(declare-fun res!53433 () Bool)

(assert (=> b!64334 (=> (not res!53433) (not e!42500))))

(assert (=> b!64334 (= res!53433 (isPrefixOf!0 (_1!2980 lt!101537) (_2!2979 lt!101271)))))

(declare-fun b!64335 () Bool)

(declare-fun res!53435 () Bool)

(assert (=> b!64335 (=> (not res!53435) (not e!42500))))

(assert (=> b!64335 (= res!53435 (isPrefixOf!0 (_2!2980 lt!101537) (_2!2979 lt!101277)))))

(assert (= (and d!20032 c!4609) b!64331))

(assert (= (and d!20032 (not c!4609)) b!64333))

(assert (= (and d!20032 res!53434) b!64334))

(assert (= (and b!64334 res!53433) b!64335))

(assert (= (and b!64335 res!53435) b!64332))

(declare-fun m!101993 () Bool)

(assert (=> b!64334 m!101993))

(declare-fun m!101995 () Bool)

(assert (=> d!20032 m!101995))

(assert (=> d!20032 m!101967))

(assert (=> d!20032 m!101665))

(declare-fun m!101997 () Bool)

(assert (=> d!20032 m!101997))

(declare-fun m!101999 () Bool)

(assert (=> d!20032 m!101999))

(declare-fun m!102001 () Bool)

(assert (=> d!20032 m!102001))

(declare-fun m!102003 () Bool)

(assert (=> d!20032 m!102003))

(declare-fun m!102005 () Bool)

(assert (=> d!20032 m!102005))

(declare-fun m!102007 () Bool)

(assert (=> d!20032 m!102007))

(declare-fun m!102009 () Bool)

(assert (=> d!20032 m!102009))

(assert (=> d!20032 m!101981))

(assert (=> b!64331 m!101693))

(declare-fun m!102011 () Bool)

(assert (=> b!64331 m!102011))

(declare-fun m!102013 () Bool)

(assert (=> b!64331 m!102013))

(declare-fun m!102015 () Bool)

(assert (=> b!64335 m!102015))

(declare-fun m!102017 () Bool)

(assert (=> b!64332 m!102017))

(assert (=> b!64332 m!101721))

(assert (=> b!64332 m!101693))

(assert (=> b!64116 d!20032))

(declare-fun d!20036 () Bool)

(assert (=> d!20036 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!101263)))

(declare-fun lt!101542 () Unit!4349)

(assert (=> d!20036 (= lt!101542 (choose!9 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!101277)) lt!101263 (BitStream!2237 (buf!1673 (_2!2979 lt!101277)) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271)))))))

(assert (=> d!20036 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!101277)) lt!101263) lt!101542)))

(declare-fun bs!4922 () Bool)

(assert (= bs!4922 d!20036))

(assert (=> bs!4922 m!101717))

(declare-fun m!102019 () Bool)

(assert (=> bs!4922 m!102019))

(assert (=> b!64116 d!20036))

(declare-fun d!20038 () Bool)

(assert (=> d!20038 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4923 () Bool)

(assert (= bs!4923 d!20038))

(declare-fun m!102021 () Bool)

(assert (=> bs!4923 m!102021))

(assert (=> b!64116 d!20038))

(declare-fun b!64358 () Bool)

(declare-fun e!42515 () Bool)

(declare-fun lt!101552 () List!693)

(declare-fun isEmpty!199 (List!693) Bool)

(assert (=> b!64358 (= e!42515 (isEmpty!199 lt!101552))))

(declare-fun d!20040 () Bool)

(assert (=> d!20040 e!42515))

(declare-fun c!4615 () Bool)

(assert (=> d!20040 (= c!4615 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5758 0))(
  ( (tuple2!5759 (_1!2990 List!693) (_2!2990 BitStream!2236)) )
))
(declare-fun e!42514 () tuple2!5758)

(assert (=> d!20040 (= lt!101552 (_1!2990 e!42514))))

(declare-fun c!4614 () Bool)

(assert (=> d!20040 (= c!4614 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20040 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20040 (= (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_1!2980 lt!101270) (bvsub to!314 i!635)) lt!101552)))

(declare-datatypes ((tuple2!5760 0))(
  ( (tuple2!5761 (_1!2991 Bool) (_2!2991 BitStream!2236)) )
))
(declare-fun lt!101553 () tuple2!5760)

(declare-fun lt!101554 () (_ BitVec 64))

(declare-fun b!64357 () Bool)

(assert (=> b!64357 (= e!42514 (tuple2!5759 (Cons!689 (_1!2991 lt!101553) (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_2!2991 lt!101553) (bvsub (bvsub to!314 i!635) lt!101554))) (_2!2991 lt!101553)))))

(declare-fun readBit!0 (BitStream!2236) tuple2!5760)

(assert (=> b!64357 (= lt!101553 (readBit!0 (_1!2980 lt!101270)))))

(assert (=> b!64357 (= lt!101554 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64359 () Bool)

(assert (=> b!64359 (= e!42515 (> (length!321 lt!101552) 0))))

(declare-fun b!64356 () Bool)

(assert (=> b!64356 (= e!42514 (tuple2!5759 Nil!690 (_1!2980 lt!101270)))))

(assert (= (and d!20040 c!4614) b!64356))

(assert (= (and d!20040 (not c!4614)) b!64357))

(assert (= (and d!20040 c!4615) b!64358))

(assert (= (and d!20040 (not c!4615)) b!64359))

(declare-fun m!102029 () Bool)

(assert (=> b!64358 m!102029))

(declare-fun m!102031 () Bool)

(assert (=> b!64357 m!102031))

(declare-fun m!102033 () Bool)

(assert (=> b!64357 m!102033))

(declare-fun m!102035 () Bool)

(assert (=> b!64359 m!102035))

(assert (=> b!64116 d!20040))

(declare-fun b!64362 () Bool)

(declare-fun e!42517 () Bool)

(declare-fun lt!101555 () List!693)

(assert (=> b!64362 (= e!42517 (isEmpty!199 lt!101555))))

(declare-fun d!20048 () Bool)

(assert (=> d!20048 e!42517))

(declare-fun c!4617 () Bool)

(assert (=> d!20048 (= c!4617 (= lt!101263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42516 () tuple2!5758)

(assert (=> d!20048 (= lt!101555 (_1!2990 e!42516))))

(declare-fun c!4616 () Bool)

(assert (=> d!20048 (= c!4616 (= lt!101263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20048 (bvsge lt!101263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20048 (= (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_1!2980 lt!101272) lt!101263) lt!101555)))

(declare-fun lt!101556 () tuple2!5760)

(declare-fun lt!101557 () (_ BitVec 64))

(declare-fun b!64361 () Bool)

(assert (=> b!64361 (= e!42516 (tuple2!5759 (Cons!689 (_1!2991 lt!101556) (bitStreamReadBitsIntoList!0 (_2!2979 lt!101277) (_2!2991 lt!101556) (bvsub lt!101263 lt!101557))) (_2!2991 lt!101556)))))

(assert (=> b!64361 (= lt!101556 (readBit!0 (_1!2980 lt!101272)))))

(assert (=> b!64361 (= lt!101557 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64363 () Bool)

(assert (=> b!64363 (= e!42517 (> (length!321 lt!101555) 0))))

(declare-fun b!64360 () Bool)

(assert (=> b!64360 (= e!42516 (tuple2!5759 Nil!690 (_1!2980 lt!101272)))))

(assert (= (and d!20048 c!4616) b!64360))

(assert (= (and d!20048 (not c!4616)) b!64361))

(assert (= (and d!20048 c!4617) b!64362))

(assert (= (and d!20048 (not c!4617)) b!64363))

(declare-fun m!102037 () Bool)

(assert (=> b!64362 m!102037))

(declare-fun m!102039 () Bool)

(assert (=> b!64361 m!102039))

(declare-fun m!102041 () Bool)

(assert (=> b!64361 m!102041))

(declare-fun m!102043 () Bool)

(assert (=> b!64363 m!102043))

(assert (=> b!64116 d!20048))

(declare-fun d!20050 () Bool)

(assert (=> d!20050 (= (invariant!0 (currentBit!3322 (_2!2979 lt!101277)) (currentByte!3327 (_2!2979 lt!101277)) (size!1292 (buf!1673 (_2!2979 lt!101277)))) (and (bvsge (currentBit!3322 (_2!2979 lt!101277)) #b00000000000000000000000000000000) (bvslt (currentBit!3322 (_2!2979 lt!101277)) #b00000000000000000000000000001000) (bvsge (currentByte!3327 (_2!2979 lt!101277)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3327 (_2!2979 lt!101277)) (size!1292 (buf!1673 (_2!2979 lt!101277)))) (and (= (currentBit!3322 (_2!2979 lt!101277)) #b00000000000000000000000000000000) (= (currentByte!3327 (_2!2979 lt!101277)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))))

(assert (=> b!64105 d!20050))

(declare-fun d!20052 () Bool)

(declare-fun e!42518 () Bool)

(assert (=> d!20052 e!42518))

(declare-fun res!53449 () Bool)

(assert (=> d!20052 (=> (not res!53449) (not e!42518))))

(declare-fun lt!101558 () (_ BitVec 64))

(declare-fun lt!101560 () (_ BitVec 64))

(declare-fun lt!101561 () (_ BitVec 64))

(assert (=> d!20052 (= res!53449 (= lt!101560 (bvsub lt!101558 lt!101561)))))

(assert (=> d!20052 (or (= (bvand lt!101558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101558 lt!101561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20052 (= lt!101561 (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101277))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101277)))))))

(declare-fun lt!101562 () (_ BitVec 64))

(declare-fun lt!101559 () (_ BitVec 64))

(assert (=> d!20052 (= lt!101558 (bvmul lt!101562 lt!101559))))

(assert (=> d!20052 (or (= lt!101562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101559 (bvsdiv (bvmul lt!101562 lt!101559) lt!101562)))))

(assert (=> d!20052 (= lt!101559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20052 (= lt!101562 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (=> d!20052 (= lt!101560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101277))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101277)))))))

(assert (=> d!20052 (invariant!0 (currentBit!3322 (_2!2979 lt!101277)) (currentByte!3327 (_2!2979 lt!101277)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))

(assert (=> d!20052 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277))) lt!101560)))

(declare-fun b!64364 () Bool)

(declare-fun res!53448 () Bool)

(assert (=> b!64364 (=> (not res!53448) (not e!42518))))

(assert (=> b!64364 (= res!53448 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101560))))

(declare-fun b!64365 () Bool)

(declare-fun lt!101563 () (_ BitVec 64))

(assert (=> b!64365 (= e!42518 (bvsle lt!101560 (bvmul lt!101563 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64365 (or (= lt!101563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101563)))))

(assert (=> b!64365 (= lt!101563 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (= (and d!20052 res!53449) b!64364))

(assert (= (and b!64364 res!53448) b!64365))

(declare-fun m!102045 () Bool)

(assert (=> d!20052 m!102045))

(assert (=> d!20052 m!101731))

(assert (=> b!64104 d!20052))

(declare-fun d!20054 () Bool)

(assert (=> d!20054 (= (invariant!0 (currentBit!3322 (_2!2979 lt!101271)) (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101277)))) (and (bvsge (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (bvslt (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000001000) (bvsge (currentByte!3327 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101277)))) (and (= (currentBit!3322 (_2!2979 lt!101271)) #b00000000000000000000000000000000) (= (currentByte!3327 (_2!2979 lt!101271)) (size!1292 (buf!1673 (_2!2979 lt!101277))))))))))

(assert (=> b!64114 d!20054))

(declare-fun d!20056 () Bool)

(declare-fun res!53451 () Bool)

(declare-fun e!42520 () Bool)

(assert (=> d!20056 (=> (not res!53451) (not e!42520))))

(assert (=> d!20056 (= res!53451 (= (size!1292 (buf!1673 thiss!1379)) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (=> d!20056 (= (isPrefixOf!0 thiss!1379 (_2!2979 lt!101277)) e!42520)))

(declare-fun b!64366 () Bool)

(declare-fun res!53450 () Bool)

(assert (=> b!64366 (=> (not res!53450) (not e!42520))))

(assert (=> b!64366 (= res!53450 (bvsle (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277)))))))

(declare-fun b!64367 () Bool)

(declare-fun e!42519 () Bool)

(assert (=> b!64367 (= e!42520 e!42519)))

(declare-fun res!53452 () Bool)

(assert (=> b!64367 (=> res!53452 e!42519)))

(assert (=> b!64367 (= res!53452 (= (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64368 () Bool)

(assert (=> b!64368 (= e!42519 (arrayBitRangesEq!0 (buf!1673 thiss!1379) (buf!1673 (_2!2979 lt!101277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(assert (= (and d!20056 res!53451) b!64366))

(assert (= (and b!64366 res!53450) b!64367))

(assert (= (and b!64367 (not res!53452)) b!64368))

(assert (=> b!64366 m!101703))

(assert (=> b!64366 m!101721))

(assert (=> b!64368 m!101703))

(assert (=> b!64368 m!101703))

(declare-fun m!102047 () Bool)

(assert (=> b!64368 m!102047))

(assert (=> b!64103 d!20056))

(declare-fun b!64369 () Bool)

(declare-fun e!42522 () Unit!4349)

(declare-fun lt!101577 () Unit!4349)

(assert (=> b!64369 (= e!42522 lt!101577)))

(declare-fun lt!101567 () (_ BitVec 64))

(assert (=> b!64369 (= lt!101567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101564 () (_ BitVec 64))

(assert (=> b!64369 (= lt!101564 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(assert (=> b!64369 (= lt!101577 (arrayBitRangesEqSymmetric!0 (buf!1673 thiss!1379) (buf!1673 (_2!2979 lt!101271)) lt!101567 lt!101564))))

(assert (=> b!64369 (arrayBitRangesEq!0 (buf!1673 (_2!2979 lt!101271)) (buf!1673 thiss!1379) lt!101567 lt!101564)))

(declare-fun lt!101579 () tuple2!5738)

(declare-fun e!42521 () Bool)

(declare-fun lt!101582 () (_ BitVec 64))

(declare-fun lt!101581 () (_ BitVec 64))

(declare-fun b!64370 () Bool)

(assert (=> b!64370 (= e!42521 (= (_1!2980 lt!101579) (withMovedBitIndex!0 (_2!2980 lt!101579) (bvsub lt!101582 lt!101581))))))

(assert (=> b!64370 (or (= (bvand lt!101582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101582 lt!101581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64370 (= lt!101581 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(assert (=> b!64370 (= lt!101582 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(declare-fun d!20058 () Bool)

(assert (=> d!20058 e!42521))

(declare-fun res!53454 () Bool)

(assert (=> d!20058 (=> (not res!53454) (not e!42521))))

(assert (=> d!20058 (= res!53454 (isPrefixOf!0 (_1!2980 lt!101579) (_2!2980 lt!101579)))))

(declare-fun lt!101572 () BitStream!2236)

(assert (=> d!20058 (= lt!101579 (tuple2!5739 lt!101572 (_2!2979 lt!101271)))))

(declare-fun lt!101576 () Unit!4349)

(declare-fun lt!101578 () Unit!4349)

(assert (=> d!20058 (= lt!101576 lt!101578)))

(assert (=> d!20058 (isPrefixOf!0 lt!101572 (_2!2979 lt!101271))))

(assert (=> d!20058 (= lt!101578 (lemmaIsPrefixTransitive!0 lt!101572 (_2!2979 lt!101271) (_2!2979 lt!101271)))))

(declare-fun lt!101570 () Unit!4349)

(declare-fun lt!101568 () Unit!4349)

(assert (=> d!20058 (= lt!101570 lt!101568)))

(assert (=> d!20058 (isPrefixOf!0 lt!101572 (_2!2979 lt!101271))))

(assert (=> d!20058 (= lt!101568 (lemmaIsPrefixTransitive!0 lt!101572 thiss!1379 (_2!2979 lt!101271)))))

(declare-fun lt!101573 () Unit!4349)

(assert (=> d!20058 (= lt!101573 e!42522)))

(declare-fun c!4618 () Bool)

(assert (=> d!20058 (= c!4618 (not (= (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101569 () Unit!4349)

(declare-fun lt!101575 () Unit!4349)

(assert (=> d!20058 (= lt!101569 lt!101575)))

(assert (=> d!20058 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101271))))

(assert (=> d!20058 (= lt!101575 (lemmaIsPrefixRefl!0 (_2!2979 lt!101271)))))

(declare-fun lt!101583 () Unit!4349)

(declare-fun lt!101574 () Unit!4349)

(assert (=> d!20058 (= lt!101583 lt!101574)))

(assert (=> d!20058 (= lt!101574 (lemmaIsPrefixRefl!0 (_2!2979 lt!101271)))))

(declare-fun lt!101566 () Unit!4349)

(declare-fun lt!101580 () Unit!4349)

(assert (=> d!20058 (= lt!101566 lt!101580)))

(assert (=> d!20058 (isPrefixOf!0 lt!101572 lt!101572)))

(assert (=> d!20058 (= lt!101580 (lemmaIsPrefixRefl!0 lt!101572))))

(declare-fun lt!101571 () Unit!4349)

(declare-fun lt!101565 () Unit!4349)

(assert (=> d!20058 (= lt!101571 lt!101565)))

(assert (=> d!20058 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20058 (= lt!101565 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20058 (= lt!101572 (BitStream!2237 (buf!1673 (_2!2979 lt!101271)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(assert (=> d!20058 (isPrefixOf!0 thiss!1379 (_2!2979 lt!101271))))

(assert (=> d!20058 (= (reader!0 thiss!1379 (_2!2979 lt!101271)) lt!101579)))

(declare-fun b!64371 () Bool)

(declare-fun Unit!4375 () Unit!4349)

(assert (=> b!64371 (= e!42522 Unit!4375)))

(declare-fun b!64372 () Bool)

(declare-fun res!53453 () Bool)

(assert (=> b!64372 (=> (not res!53453) (not e!42521))))

(assert (=> b!64372 (= res!53453 (isPrefixOf!0 (_1!2980 lt!101579) thiss!1379))))

(declare-fun b!64373 () Bool)

(declare-fun res!53455 () Bool)

(assert (=> b!64373 (=> (not res!53455) (not e!42521))))

(assert (=> b!64373 (= res!53455 (isPrefixOf!0 (_2!2980 lt!101579) (_2!2979 lt!101271)))))

(assert (= (and d!20058 c!4618) b!64369))

(assert (= (and d!20058 (not c!4618)) b!64371))

(assert (= (and d!20058 res!53454) b!64372))

(assert (= (and b!64372 res!53453) b!64373))

(assert (= (and b!64373 res!53455) b!64370))

(declare-fun m!102049 () Bool)

(assert (=> b!64372 m!102049))

(assert (=> d!20058 m!101701))

(assert (=> d!20058 m!102003))

(assert (=> d!20058 m!101679))

(declare-fun m!102051 () Bool)

(assert (=> d!20058 m!102051))

(declare-fun m!102053 () Bool)

(assert (=> d!20058 m!102053))

(declare-fun m!102055 () Bool)

(assert (=> d!20058 m!102055))

(assert (=> d!20058 m!101699))

(declare-fun m!102057 () Bool)

(assert (=> d!20058 m!102057))

(declare-fun m!102059 () Bool)

(assert (=> d!20058 m!102059))

(declare-fun m!102061 () Bool)

(assert (=> d!20058 m!102061))

(assert (=> d!20058 m!101995))

(assert (=> b!64369 m!101703))

(declare-fun m!102063 () Bool)

(assert (=> b!64369 m!102063))

(declare-fun m!102065 () Bool)

(assert (=> b!64369 m!102065))

(declare-fun m!102067 () Bool)

(assert (=> b!64373 m!102067))

(declare-fun m!102069 () Bool)

(assert (=> b!64370 m!102069))

(assert (=> b!64370 m!101693))

(assert (=> b!64370 m!101703))

(assert (=> b!64103 d!20058))

(declare-fun d!20060 () Bool)

(declare-fun res!53457 () Bool)

(declare-fun e!42524 () Bool)

(assert (=> d!20060 (=> (not res!53457) (not e!42524))))

(assert (=> d!20060 (= res!53457 (= (size!1292 (buf!1673 (_2!2979 lt!101271))) (size!1292 (buf!1673 (_2!2979 lt!101277)))))))

(assert (=> d!20060 (= (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101277)) e!42524)))

(declare-fun b!64374 () Bool)

(declare-fun res!53456 () Bool)

(assert (=> b!64374 (=> (not res!53456) (not e!42524))))

(assert (=> b!64374 (= res!53456 (bvsle (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101277))) (currentByte!3327 (_2!2979 lt!101277)) (currentBit!3322 (_2!2979 lt!101277)))))))

(declare-fun b!64375 () Bool)

(declare-fun e!42523 () Bool)

(assert (=> b!64375 (= e!42524 e!42523)))

(declare-fun res!53458 () Bool)

(assert (=> b!64375 (=> res!53458 e!42523)))

(assert (=> b!64375 (= res!53458 (= (size!1292 (buf!1673 (_2!2979 lt!101271))) #b00000000000000000000000000000000))))

(declare-fun b!64376 () Bool)

(assert (=> b!64376 (= e!42523 (arrayBitRangesEq!0 (buf!1673 (_2!2979 lt!101271)) (buf!1673 (_2!2979 lt!101277)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271)))))))

(assert (= (and d!20060 res!53457) b!64374))

(assert (= (and b!64374 res!53456) b!64375))

(assert (= (and b!64375 (not res!53458)) b!64376))

(assert (=> b!64374 m!101693))

(assert (=> b!64374 m!101721))

(assert (=> b!64376 m!101693))

(assert (=> b!64376 m!101693))

(declare-fun m!102071 () Bool)

(assert (=> b!64376 m!102071))

(assert (=> b!64103 d!20060))

(declare-fun d!20062 () Bool)

(assert (=> d!20062 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101584 () Unit!4349)

(assert (=> d!20062 (= lt!101584 (choose!9 thiss!1379 (buf!1673 (_2!2979 lt!101271)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2237 (buf!1673 (_2!2979 lt!101271)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(assert (=> d!20062 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1673 (_2!2979 lt!101271)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101584)))

(declare-fun bs!4925 () Bool)

(assert (= bs!4925 d!20062))

(assert (=> bs!4925 m!101659))

(declare-fun m!102073 () Bool)

(assert (=> bs!4925 m!102073))

(assert (=> b!64103 d!20062))

(declare-fun b!64577 () Bool)

(declare-fun res!53586 () Bool)

(declare-fun e!42617 () Bool)

(assert (=> b!64577 (=> (not res!53586) (not e!42617))))

(declare-fun lt!102257 () tuple2!5736)

(assert (=> b!64577 (= res!53586 (= (size!1292 (buf!1673 (_2!2979 lt!101271))) (size!1292 (buf!1673 (_2!2979 lt!102257)))))))

(declare-fun b!64578 () Bool)

(declare-fun e!42618 () tuple2!5736)

(declare-fun Unit!4377 () Unit!4349)

(assert (=> b!64578 (= e!42618 (tuple2!5737 Unit!4377 (_2!2979 lt!101271)))))

(assert (=> b!64578 (= (size!1292 (buf!1673 (_2!2979 lt!101271))) (size!1292 (buf!1673 (_2!2979 lt!101271))))))

(declare-fun lt!102266 () Unit!4349)

(declare-fun Unit!4378 () Unit!4349)

(assert (=> b!64578 (= lt!102266 Unit!4378)))

(declare-fun call!826 () tuple2!5738)

(declare-fun checkByteArrayBitContent!0 (BitStream!2236 array!2815 array!2815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5762 0))(
  ( (tuple2!5763 (_1!2992 array!2815) (_2!2992 BitStream!2236)) )
))
(declare-fun readBits!0 (BitStream!2236 (_ BitVec 64)) tuple2!5762)

(assert (=> b!64578 (checkByteArrayBitContent!0 (_2!2979 lt!101271) srcBuffer!2 (_1!2992 (readBits!0 (_1!2980 call!826) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!64580 () Bool)

(declare-fun e!42619 () Bool)

(declare-fun lt!102265 () (_ BitVec 64))

(assert (=> b!64580 (= e!42619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!102265))))

(declare-fun b!64581 () Bool)

(declare-fun lt!102275 () tuple2!5736)

(declare-fun Unit!4379 () Unit!4349)

(assert (=> b!64581 (= e!42618 (tuple2!5737 Unit!4379 (_2!2979 lt!102275)))))

(declare-fun lt!102249 () tuple2!5736)

(assert (=> b!64581 (= lt!102249 (appendBitFromByte!0 (_2!2979 lt!101271) (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!102274 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102274 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102261 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102261 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102246 () Unit!4349)

(assert (=> b!64581 (= lt!102246 (validateOffsetBitsIneqLemma!0 (_2!2979 lt!101271) (_2!2979 lt!102249) lt!102274 lt!102261))))

(assert (=> b!64581 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!102249)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!102249))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!102249))) (bvsub lt!102274 lt!102261))))

(declare-fun lt!102285 () Unit!4349)

(assert (=> b!64581 (= lt!102285 lt!102246)))

(declare-fun lt!102247 () tuple2!5738)

(assert (=> b!64581 (= lt!102247 (reader!0 (_2!2979 lt!101271) (_2!2979 lt!102249)))))

(declare-fun lt!102286 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102286 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102243 () Unit!4349)

(assert (=> b!64581 (= lt!102243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!102249)) lt!102286))))

(assert (=> b!64581 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!102249)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!102286)))

(declare-fun lt!102256 () Unit!4349)

(assert (=> b!64581 (= lt!102256 lt!102243)))

(assert (=> b!64581 (= (head!512 (byteArrayBitContentToList!0 (_2!2979 lt!102249) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!512 (bitStreamReadBitsIntoList!0 (_2!2979 lt!102249) (_1!2980 lt!102247) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102253 () Unit!4349)

(declare-fun Unit!4380 () Unit!4349)

(assert (=> b!64581 (= lt!102253 Unit!4380)))

(assert (=> b!64581 (= lt!102275 (appendBitsMSBFirstLoop!0 (_2!2979 lt!102249) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!102245 () Unit!4349)

(assert (=> b!64581 (= lt!102245 (lemmaIsPrefixTransitive!0 (_2!2979 lt!101271) (_2!2979 lt!102249) (_2!2979 lt!102275)))))

(assert (=> b!64581 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!102275))))

(declare-fun lt!102272 () Unit!4349)

(assert (=> b!64581 (= lt!102272 lt!102245)))

(assert (=> b!64581 (= (size!1292 (buf!1673 (_2!2979 lt!102275))) (size!1292 (buf!1673 (_2!2979 lt!101271))))))

(declare-fun lt!102278 () Unit!4349)

(declare-fun Unit!4381 () Unit!4349)

(assert (=> b!64581 (= lt!102278 Unit!4381)))

(assert (=> b!64581 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102275))) (currentByte!3327 (_2!2979 lt!102275)) (currentBit!3322 (_2!2979 lt!102275))) (bvsub (bvadd (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102259 () Unit!4349)

(declare-fun Unit!4382 () Unit!4349)

(assert (=> b!64581 (= lt!102259 Unit!4382)))

(assert (=> b!64581 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102275))) (currentByte!3327 (_2!2979 lt!102275)) (currentBit!3322 (_2!2979 lt!102275))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102249))) (currentByte!3327 (_2!2979 lt!102249)) (currentBit!3322 (_2!2979 lt!102249))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102263 () Unit!4349)

(declare-fun Unit!4383 () Unit!4349)

(assert (=> b!64581 (= lt!102263 Unit!4383)))

(declare-fun lt!102262 () tuple2!5738)

(assert (=> b!64581 (= lt!102262 call!826)))

(declare-fun lt!102248 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102248 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102281 () Unit!4349)

(assert (=> b!64581 (= lt!102281 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!102275)) lt!102248))))

(assert (=> b!64581 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!102275)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!102248)))

(declare-fun lt!102270 () Unit!4349)

(assert (=> b!64581 (= lt!102270 lt!102281)))

(declare-fun lt!102269 () tuple2!5738)

(assert (=> b!64581 (= lt!102269 (reader!0 (_2!2979 lt!102249) (_2!2979 lt!102275)))))

(declare-fun lt!102250 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102250 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102251 () Unit!4349)

(assert (=> b!64581 (= lt!102251 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!102249) (buf!1673 (_2!2979 lt!102275)) lt!102250))))

(assert (=> b!64581 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!102275)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!102249))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!102249))) lt!102250)))

(declare-fun lt!102277 () Unit!4349)

(assert (=> b!64581 (= lt!102277 lt!102251)))

(declare-fun lt!102273 () List!693)

(assert (=> b!64581 (= lt!102273 (byteArrayBitContentToList!0 (_2!2979 lt!102275) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!102254 () List!693)

(assert (=> b!64581 (= lt!102254 (byteArrayBitContentToList!0 (_2!2979 lt!102275) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102267 () List!693)

(assert (=> b!64581 (= lt!102267 (bitStreamReadBitsIntoList!0 (_2!2979 lt!102275) (_1!2980 lt!102262) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!102279 () List!693)

(assert (=> b!64581 (= lt!102279 (bitStreamReadBitsIntoList!0 (_2!2979 lt!102275) (_1!2980 lt!102269) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!102252 () (_ BitVec 64))

(assert (=> b!64581 (= lt!102252 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!102276 () Unit!4349)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2236 BitStream!2236 BitStream!2236 BitStream!2236 (_ BitVec 64) List!693) Unit!4349)

(assert (=> b!64581 (= lt!102276 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2979 lt!102275) (_2!2979 lt!102275) (_1!2980 lt!102262) (_1!2980 lt!102269) lt!102252 lt!102267))))

(declare-fun tail!302 (List!693) List!693)

(assert (=> b!64581 (= (bitStreamReadBitsIntoList!0 (_2!2979 lt!102275) (_1!2980 lt!102269) (bvsub lt!102252 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!302 lt!102267))))

(declare-fun lt!102282 () Unit!4349)

(assert (=> b!64581 (= lt!102282 lt!102276)))

(declare-fun lt!102280 () Unit!4349)

(declare-fun lt!102268 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2815 array!2815 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4349)

(assert (=> b!64581 (= lt!102280 (arrayBitRangesEqImpliesEq!0 (buf!1673 (_2!2979 lt!102249)) (buf!1673 (_2!2979 lt!102275)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!102268 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102249))) (currentByte!3327 (_2!2979 lt!102249)) (currentBit!3322 (_2!2979 lt!102249)))))))

(declare-fun bitAt!0 (array!2815 (_ BitVec 64)) Bool)

(assert (=> b!64581 (= (bitAt!0 (buf!1673 (_2!2979 lt!102249)) lt!102268) (bitAt!0 (buf!1673 (_2!2979 lt!102275)) lt!102268))))

(declare-fun lt!102271 () Unit!4349)

(assert (=> b!64581 (= lt!102271 lt!102280)))

(declare-fun c!4658 () Bool)

(declare-fun bm!823 () Bool)

(assert (=> bm!823 (= call!826 (reader!0 (_2!2979 lt!101271) (ite c!4658 (_2!2979 lt!102275) (_2!2979 lt!101271))))))

(declare-fun b!64582 () Bool)

(declare-fun res!53581 () Bool)

(assert (=> b!64582 (=> (not res!53581) (not e!42617))))

(assert (=> b!64582 (= res!53581 (invariant!0 (currentBit!3322 (_2!2979 lt!102257)) (currentByte!3327 (_2!2979 lt!102257)) (size!1292 (buf!1673 (_2!2979 lt!102257)))))))

(declare-fun d!20064 () Bool)

(assert (=> d!20064 e!42617))

(declare-fun res!53583 () Bool)

(assert (=> d!20064 (=> (not res!53583) (not e!42617))))

(declare-fun lt!102255 () (_ BitVec 64))

(assert (=> d!20064 (= res!53583 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102257))) (currentByte!3327 (_2!2979 lt!102257)) (currentBit!3322 (_2!2979 lt!102257))) (bvsub lt!102255 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20064 (or (= (bvand lt!102255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102255 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!102284 () (_ BitVec 64))

(assert (=> d!20064 (= lt!102255 (bvadd lt!102284 to!314))))

(assert (=> d!20064 (or (not (= (bvand lt!102284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!102284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!102284 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20064 (= lt!102284 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(assert (=> d!20064 (= lt!102257 e!42618)))

(assert (=> d!20064 (= c!4658 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!102244 () Unit!4349)

(declare-fun lt!102260 () Unit!4349)

(assert (=> d!20064 (= lt!102244 lt!102260)))

(assert (=> d!20064 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!101271))))

(assert (=> d!20064 (= lt!102260 (lemmaIsPrefixRefl!0 (_2!2979 lt!101271)))))

(assert (=> d!20064 (= lt!102268 (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271))))))

(assert (=> d!20064 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20064 (= (appendBitsMSBFirstLoop!0 (_2!2979 lt!101271) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!102257)))

(declare-fun b!64579 () Bool)

(declare-fun res!53584 () Bool)

(assert (=> b!64579 (=> (not res!53584) (not e!42617))))

(assert (=> b!64579 (= res!53584 (isPrefixOf!0 (_2!2979 lt!101271) (_2!2979 lt!102257)))))

(declare-fun b!64583 () Bool)

(declare-fun lt!102264 () tuple2!5738)

(assert (=> b!64583 (= e!42617 (= (bitStreamReadBitsIntoList!0 (_2!2979 lt!102257) (_1!2980 lt!102264) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2979 lt!102257) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!64583 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64583 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!102283 () Unit!4349)

(declare-fun lt!102258 () Unit!4349)

(assert (=> b!64583 (= lt!102283 lt!102258)))

(assert (=> b!64583 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!102257)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!102265)))

(assert (=> b!64583 (= lt!102258 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2979 lt!101271) (buf!1673 (_2!2979 lt!102257)) lt!102265))))

(assert (=> b!64583 e!42619))

(declare-fun res!53582 () Bool)

(assert (=> b!64583 (=> (not res!53582) (not e!42619))))

(assert (=> b!64583 (= res!53582 (and (= (size!1292 (buf!1673 (_2!2979 lt!101271))) (size!1292 (buf!1673 (_2!2979 lt!102257)))) (bvsge lt!102265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64583 (= lt!102265 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!64583 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64583 (= lt!102264 (reader!0 (_2!2979 lt!101271) (_2!2979 lt!102257)))))

(declare-fun b!64584 () Bool)

(declare-fun res!53585 () Bool)

(assert (=> b!64584 (=> (not res!53585) (not e!42617))))

(assert (=> b!64584 (= res!53585 (= (size!1292 (buf!1673 (_2!2979 lt!102257))) (size!1292 (buf!1673 (_2!2979 lt!101271)))))))

(assert (= (and d!20064 c!4658) b!64581))

(assert (= (and d!20064 (not c!4658)) b!64578))

(assert (= (or b!64581 b!64578) bm!823))

(assert (= (and d!20064 res!53583) b!64582))

(assert (= (and b!64582 res!53581) b!64577))

(assert (= (and b!64577 res!53586) b!64579))

(assert (= (and b!64579 res!53584) b!64584))

(assert (= (and b!64584 res!53585) b!64583))

(assert (= (and b!64583 res!53582) b!64580))

(declare-fun m!102511 () Bool)

(assert (=> d!20064 m!102511))

(assert (=> d!20064 m!101693))

(assert (=> d!20064 m!102003))

(assert (=> d!20064 m!101995))

(declare-fun m!102513 () Bool)

(assert (=> b!64580 m!102513))

(declare-fun m!102515 () Bool)

(assert (=> b!64582 m!102515))

(declare-fun m!102517 () Bool)

(assert (=> b!64578 m!102517))

(declare-fun m!102519 () Bool)

(assert (=> b!64578 m!102519))

(declare-fun m!102521 () Bool)

(assert (=> bm!823 m!102521))

(declare-fun m!102523 () Bool)

(assert (=> b!64579 m!102523))

(declare-fun m!102525 () Bool)

(assert (=> b!64581 m!102525))

(declare-fun m!102527 () Bool)

(assert (=> b!64581 m!102527))

(declare-fun m!102529 () Bool)

(assert (=> b!64581 m!102529))

(declare-fun m!102531 () Bool)

(assert (=> b!64581 m!102531))

(declare-fun m!102533 () Bool)

(assert (=> b!64581 m!102533))

(declare-fun m!102535 () Bool)

(assert (=> b!64581 m!102535))

(assert (=> b!64581 m!102527))

(declare-fun m!102537 () Bool)

(assert (=> b!64581 m!102537))

(declare-fun m!102539 () Bool)

(assert (=> b!64581 m!102539))

(declare-fun m!102541 () Bool)

(assert (=> b!64581 m!102541))

(declare-fun m!102543 () Bool)

(assert (=> b!64581 m!102543))

(declare-fun m!102545 () Bool)

(assert (=> b!64581 m!102545))

(declare-fun m!102547 () Bool)

(assert (=> b!64581 m!102547))

(declare-fun m!102549 () Bool)

(assert (=> b!64581 m!102549))

(declare-fun m!102551 () Bool)

(assert (=> b!64581 m!102551))

(declare-fun m!102553 () Bool)

(assert (=> b!64581 m!102553))

(declare-fun m!102555 () Bool)

(assert (=> b!64581 m!102555))

(declare-fun m!102557 () Bool)

(assert (=> b!64581 m!102557))

(declare-fun m!102559 () Bool)

(assert (=> b!64581 m!102559))

(assert (=> b!64581 m!101693))

(declare-fun m!102561 () Bool)

(assert (=> b!64581 m!102561))

(declare-fun m!102563 () Bool)

(assert (=> b!64581 m!102563))

(declare-fun m!102565 () Bool)

(assert (=> b!64581 m!102565))

(declare-fun m!102567 () Bool)

(assert (=> b!64581 m!102567))

(declare-fun m!102569 () Bool)

(assert (=> b!64581 m!102569))

(assert (=> b!64581 m!102547))

(declare-fun m!102571 () Bool)

(assert (=> b!64581 m!102571))

(declare-fun m!102573 () Bool)

(assert (=> b!64581 m!102573))

(declare-fun m!102575 () Bool)

(assert (=> b!64581 m!102575))

(assert (=> b!64581 m!102535))

(declare-fun m!102577 () Bool)

(assert (=> b!64581 m!102577))

(declare-fun m!102579 () Bool)

(assert (=> b!64581 m!102579))

(declare-fun m!102581 () Bool)

(assert (=> b!64581 m!102581))

(declare-fun m!102583 () Bool)

(assert (=> b!64581 m!102583))

(assert (=> b!64581 m!102531))

(declare-fun m!102585 () Bool)

(assert (=> b!64581 m!102585))

(declare-fun m!102587 () Bool)

(assert (=> b!64583 m!102587))

(declare-fun m!102589 () Bool)

(assert (=> b!64583 m!102589))

(declare-fun m!102591 () Bool)

(assert (=> b!64583 m!102591))

(declare-fun m!102593 () Bool)

(assert (=> b!64583 m!102593))

(declare-fun m!102595 () Bool)

(assert (=> b!64583 m!102595))

(assert (=> b!64103 d!20064))

(declare-fun d!20176 () Bool)

(assert (=> d!20176 (isPrefixOf!0 thiss!1379 (_2!2979 lt!101277))))

(declare-fun lt!102289 () Unit!4349)

(declare-fun choose!30 (BitStream!2236 BitStream!2236 BitStream!2236) Unit!4349)

(assert (=> d!20176 (= lt!102289 (choose!30 thiss!1379 (_2!2979 lt!101271) (_2!2979 lt!101277)))))

(assert (=> d!20176 (isPrefixOf!0 thiss!1379 (_2!2979 lt!101271))))

(assert (=> d!20176 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2979 lt!101271) (_2!2979 lt!101277)) lt!102289)))

(declare-fun bs!4946 () Bool)

(assert (= bs!4946 d!20176))

(assert (=> bs!4946 m!101653))

(declare-fun m!102597 () Bool)

(assert (=> bs!4946 m!102597))

(assert (=> bs!4946 m!101679))

(assert (=> b!64103 d!20176))

(declare-fun d!20178 () Bool)

(assert (=> d!20178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4947 () Bool)

(assert (= bs!4947 d!20178))

(declare-fun m!102599 () Bool)

(assert (=> bs!4947 m!102599))

(assert (=> b!64103 d!20178))

(declare-fun d!20180 () Bool)

(declare-fun size!1296 (List!693) Int)

(assert (=> d!20180 (= (length!321 lt!101264) (size!1296 lt!101264))))

(declare-fun bs!4948 () Bool)

(assert (= bs!4948 d!20180))

(declare-fun m!102601 () Bool)

(assert (=> bs!4948 m!102601))

(assert (=> b!64112 d!20180))

(declare-fun d!20182 () Bool)

(assert (=> d!20182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 thiss!1379))) ((_ sign_extend 32) (currentByte!3327 thiss!1379)) ((_ sign_extend 32) (currentBit!3322 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4949 () Bool)

(assert (= bs!4949 d!20182))

(assert (=> bs!4949 m!101957))

(assert (=> b!64101 d!20182))

(declare-fun d!20184 () Bool)

(assert (=> d!20184 (= (array_inv!1177 (buf!1673 thiss!1379)) (bvsge (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64111 d!20184))

(declare-fun d!20186 () Bool)

(assert (=> d!20186 (= (array_inv!1177 srcBuffer!2) (bvsge (size!1292 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12552 d!20186))

(declare-fun d!20188 () Bool)

(assert (=> d!20188 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3322 thiss!1379) (currentByte!3327 thiss!1379) (size!1292 (buf!1673 thiss!1379))))))

(declare-fun bs!4950 () Bool)

(assert (= bs!4950 d!20188))

(assert (=> bs!4950 m!101959))

(assert (=> start!12552 d!20188))

(declare-fun d!20190 () Bool)

(declare-fun res!53588 () Bool)

(declare-fun e!42621 () Bool)

(assert (=> d!20190 (=> (not res!53588) (not e!42621))))

(assert (=> d!20190 (= res!53588 (= (size!1292 (buf!1673 thiss!1379)) (size!1292 (buf!1673 (_2!2979 lt!101271)))))))

(assert (=> d!20190 (= (isPrefixOf!0 thiss!1379 (_2!2979 lt!101271)) e!42621)))

(declare-fun b!64585 () Bool)

(declare-fun res!53587 () Bool)

(assert (=> b!64585 (=> (not res!53587) (not e!42621))))

(assert (=> b!64585 (= res!53587 (bvsle (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!101271))) (currentByte!3327 (_2!2979 lt!101271)) (currentBit!3322 (_2!2979 lt!101271)))))))

(declare-fun b!64586 () Bool)

(declare-fun e!42620 () Bool)

(assert (=> b!64586 (= e!42621 e!42620)))

(declare-fun res!53589 () Bool)

(assert (=> b!64586 (=> res!53589 e!42620)))

(assert (=> b!64586 (= res!53589 (= (size!1292 (buf!1673 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64587 () Bool)

(assert (=> b!64587 (= e!42620 (arrayBitRangesEq!0 (buf!1673 thiss!1379) (buf!1673 (_2!2979 lt!101271)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379))))))

(assert (= (and d!20190 res!53588) b!64585))

(assert (= (and b!64585 res!53587) b!64586))

(assert (= (and b!64586 (not res!53589)) b!64587))

(assert (=> b!64585 m!101703))

(assert (=> b!64585 m!101693))

(assert (=> b!64587 m!101703))

(assert (=> b!64587 m!101703))

(declare-fun m!102603 () Bool)

(assert (=> b!64587 m!102603))

(assert (=> b!64110 d!20190))

(declare-fun d!20192 () Bool)

(assert (=> d!20192 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) lt!101263) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271)))) lt!101263))))

(declare-fun bs!4951 () Bool)

(assert (= bs!4951 d!20192))

(assert (=> bs!4951 m!101949))

(assert (=> b!64110 d!20192))

(declare-fun d!20194 () Bool)

(declare-fun e!42624 () Bool)

(assert (=> d!20194 e!42624))

(declare-fun res!53592 () Bool)

(assert (=> d!20194 (=> (not res!53592) (not e!42624))))

(assert (=> d!20194 (= res!53592 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!102292 () Unit!4349)

(declare-fun choose!27 (BitStream!2236 BitStream!2236 (_ BitVec 64) (_ BitVec 64)) Unit!4349)

(assert (=> d!20194 (= lt!102292 (choose!27 thiss!1379 (_2!2979 lt!101271) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20194 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2979 lt!101271) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102292)))

(declare-fun b!64590 () Bool)

(assert (=> b!64590 (= e!42624 (validate_offset_bits!1 ((_ sign_extend 32) (size!1292 (buf!1673 (_2!2979 lt!101271)))) ((_ sign_extend 32) (currentByte!3327 (_2!2979 lt!101271))) ((_ sign_extend 32) (currentBit!3322 (_2!2979 lt!101271))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20194 res!53592) b!64590))

(declare-fun m!102605 () Bool)

(assert (=> d!20194 m!102605))

(declare-fun m!102607 () Bool)

(assert (=> b!64590 m!102607))

(assert (=> b!64110 d!20194))

(declare-fun d!20196 () Bool)

(declare-fun e!42656 () Bool)

(assert (=> d!20196 e!42656))

(declare-fun res!53644 () Bool)

(assert (=> d!20196 (=> (not res!53644) (not e!42656))))

(declare-fun lt!102367 () tuple2!5736)

(assert (=> d!20196 (= res!53644 (= (size!1292 (buf!1673 (_2!2979 lt!102367))) (size!1292 (buf!1673 thiss!1379))))))

(declare-fun lt!102373 () (_ BitVec 8))

(declare-fun lt!102370 () array!2815)

(assert (=> d!20196 (= lt!102373 (select (arr!1856 lt!102370) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20196 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1292 lt!102370)))))

(assert (=> d!20196 (= lt!102370 (array!2816 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!102376 () tuple2!5736)

(assert (=> d!20196 (= lt!102367 (tuple2!5737 (_1!2979 lt!102376) (_2!2979 lt!102376)))))

(declare-fun lt!102372 () tuple2!5736)

(assert (=> d!20196 (= lt!102376 lt!102372)))

(declare-fun e!42657 () Bool)

(assert (=> d!20196 e!42657))

(declare-fun res!53641 () Bool)

(assert (=> d!20196 (=> (not res!53641) (not e!42657))))

(assert (=> d!20196 (= res!53641 (= (size!1292 (buf!1673 thiss!1379)) (size!1292 (buf!1673 (_2!2979 lt!102372)))))))

(declare-fun lt!102369 () Bool)

(declare-fun appendBit!0 (BitStream!2236 Bool) tuple2!5736)

(assert (=> d!20196 (= lt!102372 (appendBit!0 thiss!1379 lt!102369))))

(assert (=> d!20196 (= lt!102369 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20196 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20196 (= (appendBitFromByte!0 thiss!1379 (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!102367)))

(declare-fun b!64651 () Bool)

(declare-fun e!42658 () Bool)

(declare-datatypes ((tuple2!5768 0))(
  ( (tuple2!5769 (_1!2995 BitStream!2236) (_2!2995 Bool)) )
))
(declare-fun lt!102374 () tuple2!5768)

(assert (=> b!64651 (= e!42658 (= (bitIndex!0 (size!1292 (buf!1673 (_1!2995 lt!102374))) (currentByte!3327 (_1!2995 lt!102374)) (currentBit!3322 (_1!2995 lt!102374))) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102367))) (currentByte!3327 (_2!2979 lt!102367)) (currentBit!3322 (_2!2979 lt!102367)))))))

(declare-fun b!64652 () Bool)

(declare-fun res!53643 () Bool)

(assert (=> b!64652 (=> (not res!53643) (not e!42656))))

(declare-fun lt!102368 () (_ BitVec 64))

(declare-fun lt!102371 () (_ BitVec 64))

(assert (=> b!64652 (= res!53643 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102367))) (currentByte!3327 (_2!2979 lt!102367)) (currentBit!3322 (_2!2979 lt!102367))) (bvadd lt!102371 lt!102368)))))

(assert (=> b!64652 (or (not (= (bvand lt!102371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102368 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!102371 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!102371 lt!102368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64652 (= lt!102368 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!64652 (= lt!102371 (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)))))

(declare-fun b!64653 () Bool)

(declare-fun res!53645 () Bool)

(assert (=> b!64653 (=> (not res!53645) (not e!42657))))

(assert (=> b!64653 (= res!53645 (isPrefixOf!0 thiss!1379 (_2!2979 lt!102372)))))

(declare-fun b!64654 () Bool)

(declare-fun e!42655 () Bool)

(assert (=> b!64654 (= e!42657 e!42655)))

(declare-fun res!53646 () Bool)

(assert (=> b!64654 (=> (not res!53646) (not e!42655))))

(declare-fun lt!102366 () tuple2!5768)

(assert (=> b!64654 (= res!53646 (and (= (_2!2995 lt!102366) lt!102369) (= (_1!2995 lt!102366) (_2!2979 lt!102372))))))

(declare-fun readBitPure!0 (BitStream!2236) tuple2!5768)

(declare-fun readerFrom!0 (BitStream!2236 (_ BitVec 32) (_ BitVec 32)) BitStream!2236)

(assert (=> b!64654 (= lt!102366 (readBitPure!0 (readerFrom!0 (_2!2979 lt!102372) (currentBit!3322 thiss!1379) (currentByte!3327 thiss!1379))))))

(declare-fun b!64655 () Bool)

(declare-fun res!53642 () Bool)

(assert (=> b!64655 (=> (not res!53642) (not e!42656))))

(assert (=> b!64655 (= res!53642 (isPrefixOf!0 thiss!1379 (_2!2979 lt!102367)))))

(declare-fun b!64656 () Bool)

(declare-fun res!53648 () Bool)

(assert (=> b!64656 (=> (not res!53648) (not e!42657))))

(assert (=> b!64656 (= res!53648 (= (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102372))) (currentByte!3327 (_2!2979 lt!102372)) (currentBit!3322 (_2!2979 lt!102372))) (bvadd (bitIndex!0 (size!1292 (buf!1673 thiss!1379)) (currentByte!3327 thiss!1379) (currentBit!3322 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64657 () Bool)

(assert (=> b!64657 (= e!42655 (= (bitIndex!0 (size!1292 (buf!1673 (_1!2995 lt!102366))) (currentByte!3327 (_1!2995 lt!102366)) (currentBit!3322 (_1!2995 lt!102366))) (bitIndex!0 (size!1292 (buf!1673 (_2!2979 lt!102372))) (currentByte!3327 (_2!2979 lt!102372)) (currentBit!3322 (_2!2979 lt!102372)))))))

(declare-fun b!64658 () Bool)

(assert (=> b!64658 (= e!42656 e!42658)))

(declare-fun res!53647 () Bool)

(assert (=> b!64658 (=> (not res!53647) (not e!42658))))

(assert (=> b!64658 (= res!53647 (and (= (_2!2995 lt!102374) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!102373)) #b00000000000000000000000000000000))) (= (_1!2995 lt!102374) (_2!2979 lt!102367))))))

(declare-fun lt!102365 () tuple2!5762)

(declare-fun lt!102375 () BitStream!2236)

(assert (=> b!64658 (= lt!102365 (readBits!0 lt!102375 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!64658 (= lt!102374 (readBitPure!0 lt!102375))))

(assert (=> b!64658 (= lt!102375 (readerFrom!0 (_2!2979 lt!102367) (currentBit!3322 thiss!1379) (currentByte!3327 thiss!1379)))))

(assert (= (and d!20196 res!53641) b!64656))

(assert (= (and b!64656 res!53648) b!64653))

(assert (= (and b!64653 res!53645) b!64654))

(assert (= (and b!64654 res!53646) b!64657))

(assert (= (and d!20196 res!53644) b!64652))

(assert (= (and b!64652 res!53643) b!64655))

(assert (= (and b!64655 res!53642) b!64658))

(assert (= (and b!64658 res!53647) b!64651))

(declare-fun m!102657 () Bool)

(assert (=> b!64657 m!102657))

(declare-fun m!102659 () Bool)

(assert (=> b!64657 m!102659))

(declare-fun m!102661 () Bool)

(assert (=> b!64653 m!102661))

(declare-fun m!102663 () Bool)

(assert (=> b!64658 m!102663))

(declare-fun m!102665 () Bool)

(assert (=> b!64658 m!102665))

(declare-fun m!102667 () Bool)

(assert (=> b!64658 m!102667))

(declare-fun m!102669 () Bool)

(assert (=> b!64651 m!102669))

(declare-fun m!102671 () Bool)

(assert (=> b!64651 m!102671))

(assert (=> b!64656 m!102659))

(assert (=> b!64656 m!101703))

(declare-fun m!102673 () Bool)

(assert (=> b!64654 m!102673))

(assert (=> b!64654 m!102673))

(declare-fun m!102675 () Bool)

(assert (=> b!64654 m!102675))

(assert (=> b!64652 m!102671))

(assert (=> b!64652 m!101703))

(declare-fun m!102677 () Bool)

(assert (=> d!20196 m!102677))

(declare-fun m!102679 () Bool)

(assert (=> d!20196 m!102679))

(declare-fun m!102681 () Bool)

(assert (=> d!20196 m!102681))

(declare-fun m!102683 () Bool)

(assert (=> b!64655 m!102683))

(assert (=> b!64110 d!20196))

(declare-fun d!20224 () Bool)

(assert (=> d!20224 (= (head!512 (byteArrayBitContentToList!0 (_2!2979 lt!101271) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!808 (byteArrayBitContentToList!0 (_2!2979 lt!101271) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64120 d!20224))

(declare-fun d!20226 () Bool)

(declare-fun c!4666 () Bool)

(assert (=> d!20226 (= c!4666 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42661 () List!693)

(assert (=> d!20226 (= (byteArrayBitContentToList!0 (_2!2979 lt!101271) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42661)))

(declare-fun b!64663 () Bool)

(assert (=> b!64663 (= e!42661 Nil!690)))

(declare-fun b!64664 () Bool)

(assert (=> b!64664 (= e!42661 (Cons!689 (not (= (bvand ((_ sign_extend 24) (select (arr!1856 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2979 lt!101271) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20226 c!4666) b!64663))

(assert (= (and d!20226 (not c!4666)) b!64664))

(assert (=> b!64664 m!101681))

(assert (=> b!64664 m!102681))

(declare-fun m!102685 () Bool)

(assert (=> b!64664 m!102685))

(assert (=> b!64120 d!20226))

(declare-fun d!20228 () Bool)

(assert (=> d!20228 (= (head!512 (bitStreamReadBitsIntoList!0 (_2!2979 lt!101271) (_1!2980 lt!101268) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!808 (bitStreamReadBitsIntoList!0 (_2!2979 lt!101271) (_1!2980 lt!101268) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64120 d!20228))

(declare-fun b!64667 () Bool)

(declare-fun e!42663 () Bool)

(declare-fun lt!102377 () List!693)

(assert (=> b!64667 (= e!42663 (isEmpty!199 lt!102377))))

(declare-fun d!20230 () Bool)

(assert (=> d!20230 e!42663))

(declare-fun c!4668 () Bool)

(assert (=> d!20230 (= c!4668 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42662 () tuple2!5758)

(assert (=> d!20230 (= lt!102377 (_1!2990 e!42662))))

(declare-fun c!4667 () Bool)

(assert (=> d!20230 (= c!4667 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20230 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20230 (= (bitStreamReadBitsIntoList!0 (_2!2979 lt!101271) (_1!2980 lt!101268) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102377)))

(declare-fun lt!102378 () tuple2!5760)

(declare-fun b!64666 () Bool)

(declare-fun lt!102379 () (_ BitVec 64))

(assert (=> b!64666 (= e!42662 (tuple2!5759 (Cons!689 (_1!2991 lt!102378) (bitStreamReadBitsIntoList!0 (_2!2979 lt!101271) (_2!2991 lt!102378) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!102379))) (_2!2991 lt!102378)))))

(assert (=> b!64666 (= lt!102378 (readBit!0 (_1!2980 lt!101268)))))

(assert (=> b!64666 (= lt!102379 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64668 () Bool)

(assert (=> b!64668 (= e!42663 (> (length!321 lt!102377) 0))))

(declare-fun b!64665 () Bool)

(assert (=> b!64665 (= e!42662 (tuple2!5759 Nil!690 (_1!2980 lt!101268)))))

(assert (= (and d!20230 c!4667) b!64665))

(assert (= (and d!20230 (not c!4667)) b!64666))

(assert (= (and d!20230 c!4668) b!64667))

(assert (= (and d!20230 (not c!4668)) b!64668))

(declare-fun m!102687 () Bool)

(assert (=> b!64667 m!102687))

(declare-fun m!102689 () Bool)

(assert (=> b!64666 m!102689))

(declare-fun m!102691 () Bool)

(assert (=> b!64666 m!102691))

(declare-fun m!102693 () Bool)

(assert (=> b!64668 m!102693))

(assert (=> b!64120 d!20230))

(declare-fun d!20232 () Bool)

(declare-fun e!42664 () Bool)

(assert (=> d!20232 e!42664))

(declare-fun res!53650 () Bool)

(assert (=> d!20232 (=> (not res!53650) (not e!42664))))

(declare-fun lt!102380 () (_ BitVec 64))

(declare-fun lt!102382 () (_ BitVec 64))

(declare-fun lt!102383 () (_ BitVec 64))

(assert (=> d!20232 (= res!53650 (= lt!102382 (bvsub lt!102380 lt!102383)))))

(assert (=> d!20232 (or (= (bvand lt!102380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102380 lt!102383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20232 (= lt!102383 (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101270)))) ((_ sign_extend 32) (currentByte!3327 (_1!2980 lt!101270))) ((_ sign_extend 32) (currentBit!3322 (_1!2980 lt!101270)))))))

(declare-fun lt!102384 () (_ BitVec 64))

(declare-fun lt!102381 () (_ BitVec 64))

(assert (=> d!20232 (= lt!102380 (bvmul lt!102384 lt!102381))))

(assert (=> d!20232 (or (= lt!102384 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102381 (bvsdiv (bvmul lt!102384 lt!102381) lt!102384)))))

(assert (=> d!20232 (= lt!102381 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20232 (= lt!102384 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101270)))))))

(assert (=> d!20232 (= lt!102382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3327 (_1!2980 lt!101270))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3322 (_1!2980 lt!101270)))))))

(assert (=> d!20232 (invariant!0 (currentBit!3322 (_1!2980 lt!101270)) (currentByte!3327 (_1!2980 lt!101270)) (size!1292 (buf!1673 (_1!2980 lt!101270))))))

(assert (=> d!20232 (= (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101270))) (currentByte!3327 (_1!2980 lt!101270)) (currentBit!3322 (_1!2980 lt!101270))) lt!102382)))

(declare-fun b!64669 () Bool)

(declare-fun res!53649 () Bool)

(assert (=> b!64669 (=> (not res!53649) (not e!42664))))

(assert (=> b!64669 (= res!53649 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102382))))

(declare-fun b!64670 () Bool)

(declare-fun lt!102385 () (_ BitVec 64))

(assert (=> b!64670 (= e!42664 (bvsle lt!102382 (bvmul lt!102385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64670 (or (= lt!102385 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102385 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102385)))))

(assert (=> b!64670 (= lt!102385 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101270)))))))

(assert (= (and d!20232 res!53650) b!64669))

(assert (= (and b!64669 res!53649) b!64670))

(declare-fun m!102695 () Bool)

(assert (=> d!20232 m!102695))

(declare-fun m!102697 () Bool)

(assert (=> d!20232 m!102697))

(assert (=> b!64109 d!20232))

(declare-fun d!20234 () Bool)

(declare-fun e!42665 () Bool)

(assert (=> d!20234 e!42665))

(declare-fun res!53652 () Bool)

(assert (=> d!20234 (=> (not res!53652) (not e!42665))))

(declare-fun lt!102386 () (_ BitVec 64))

(declare-fun lt!102389 () (_ BitVec 64))

(declare-fun lt!102388 () (_ BitVec 64))

(assert (=> d!20234 (= res!53652 (= lt!102388 (bvsub lt!102386 lt!102389)))))

(assert (=> d!20234 (or (= (bvand lt!102386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102386 lt!102389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20234 (= lt!102389 (remainingBits!0 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101272)))) ((_ sign_extend 32) (currentByte!3327 (_1!2980 lt!101272))) ((_ sign_extend 32) (currentBit!3322 (_1!2980 lt!101272)))))))

(declare-fun lt!102390 () (_ BitVec 64))

(declare-fun lt!102387 () (_ BitVec 64))

(assert (=> d!20234 (= lt!102386 (bvmul lt!102390 lt!102387))))

(assert (=> d!20234 (or (= lt!102390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102387 (bvsdiv (bvmul lt!102390 lt!102387) lt!102390)))))

(assert (=> d!20234 (= lt!102387 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20234 (= lt!102390 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101272)))))))

(assert (=> d!20234 (= lt!102388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3327 (_1!2980 lt!101272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3322 (_1!2980 lt!101272)))))))

(assert (=> d!20234 (invariant!0 (currentBit!3322 (_1!2980 lt!101272)) (currentByte!3327 (_1!2980 lt!101272)) (size!1292 (buf!1673 (_1!2980 lt!101272))))))

(assert (=> d!20234 (= (bitIndex!0 (size!1292 (buf!1673 (_1!2980 lt!101272))) (currentByte!3327 (_1!2980 lt!101272)) (currentBit!3322 (_1!2980 lt!101272))) lt!102388)))

(declare-fun b!64671 () Bool)

(declare-fun res!53651 () Bool)

(assert (=> b!64671 (=> (not res!53651) (not e!42665))))

(assert (=> b!64671 (= res!53651 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102388))))

(declare-fun b!64672 () Bool)

(declare-fun lt!102391 () (_ BitVec 64))

(assert (=> b!64672 (= e!42665 (bvsle lt!102388 (bvmul lt!102391 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64672 (or (= lt!102391 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102391 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102391)))))

(assert (=> b!64672 (= lt!102391 ((_ sign_extend 32) (size!1292 (buf!1673 (_1!2980 lt!101272)))))))

(assert (= (and d!20234 res!53652) b!64671))

(assert (= (and b!64671 res!53651) b!64672))

(declare-fun m!102699 () Bool)

(assert (=> d!20234 m!102699))

(declare-fun m!102701 () Bool)

(assert (=> d!20234 m!102701))

(assert (=> b!64109 d!20234))

(push 1)

(assert (not d!20182))

(assert (not d!20196))

(assert (not b!64326))

(assert (not b!64331))

(assert (not b!64313))

(assert (not b!64664))

(assert (not bm!823))

(assert (not b!64583))

(assert (not d!20052))

(assert (not b!64327))

(assert (not b!64361))

(assert (not d!20018))

(assert (not b!64582))

(assert (not b!64329))

(assert (not d!20024))

(assert (not b!64587))

(assert (not b!64359))

(assert (not d!20180))

(assert (not b!64666))

(assert (not b!64652))

(assert (not b!64298))

(assert (not b!64668))

(assert (not b!64585))

(assert (not d!20026))

(assert (not b!64655))

(assert (not b!64578))

(assert (not d!20030))

(assert (not d!20058))

(assert (not d!20038))

(assert (not b!64330))

(assert (not b!64579))

(assert (not d!20010))

(assert (not b!64310))

(assert (not b!64308))

(assert (not b!64366))

(assert (not b!64370))

(assert (not b!64372))

(assert (not b!64653))

(assert (not b!64658))

(assert (not b!64362))

(assert (not b!64335))

(assert (not b!64654))

(assert (not d!20192))

(assert (not b!64373))

(assert (not b!64368))

(assert (not d!20178))

(assert (not b!64651))

(assert (not b!64374))

(assert (not b!64358))

(assert (not b!64590))

(assert (not b!64334))

(assert (not b!64369))

(assert (not b!64363))

(assert (not b!64307))

(assert (not b!64315))

(assert (not d!20016))

(assert (not d!20176))

(assert (not b!64357))

(assert (not b!64305))

(assert (not b!64332))

(assert (not b!64581))

(assert (not d!20032))

(assert (not b!64296))

(assert (not b!64376))

(assert (not d!20188))

(assert (not b!64667))

(assert (not b!64656))

(assert (not d!20234))

(assert (not d!20194))

(assert (not b!64580))

(assert (not d!20064))

(assert (not d!20232))

(assert (not d!20036))

(assert (not b!64657))

(assert (not d!20062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

