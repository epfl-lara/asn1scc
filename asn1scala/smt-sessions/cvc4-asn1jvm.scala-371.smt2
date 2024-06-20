; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8640 () Bool)

(assert start!8640)

(declare-fun b!43052 () Bool)

(declare-fun e!28758 () Bool)

(declare-fun e!28756 () Bool)

(assert (=> b!43052 (= e!28758 e!28756)))

(declare-fun res!36582 () Bool)

(assert (=> b!43052 (=> res!36582 e!28756)))

(declare-datatypes ((array!2204 0))(
  ( (array!2205 (arr!1498 (Array (_ BitVec 32) (_ BitVec 8))) (size!996 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1736 0))(
  ( (BitStream!1737 (buf!1330 array!2204) (currentByte!2796 (_ BitVec 32)) (currentBit!2791 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1736)

(declare-datatypes ((Unit!3062 0))(
  ( (Unit!3063) )
))
(declare-datatypes ((tuple2!4222 0))(
  ( (tuple2!4223 (_1!2204 Unit!3062) (_2!2204 BitStream!1736)) )
))
(declare-fun lt!64957 () tuple2!4222)

(declare-fun isPrefixOf!0 (BitStream!1736 BitStream!1736) Bool)

(assert (=> b!43052 (= res!36582 (not (isPrefixOf!0 thiss!1379 (_2!2204 lt!64957))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43052 (validate_offset_bits!1 ((_ sign_extend 32) (size!996 (buf!1330 (_2!2204 lt!64957)))) ((_ sign_extend 32) (currentByte!2796 (_2!2204 lt!64957))) ((_ sign_extend 32) (currentBit!2791 (_2!2204 lt!64957))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64960 () Unit!3062)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1736 BitStream!1736 (_ BitVec 64) (_ BitVec 64)) Unit!3062)

(assert (=> b!43052 (= lt!64960 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2204 lt!64957) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2204)

(declare-fun appendBitFromByte!0 (BitStream!1736 (_ BitVec 8) (_ BitVec 32)) tuple2!4222)

(assert (=> b!43052 (= lt!64957 (appendBitFromByte!0 thiss!1379 (select (arr!1498 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43053 () Bool)

(declare-fun res!36580 () Bool)

(declare-fun e!28754 () Bool)

(assert (=> b!43053 (=> (not res!36580) (not e!28754))))

(assert (=> b!43053 (= res!36580 (validate_offset_bits!1 ((_ sign_extend 32) (size!996 (buf!1330 thiss!1379))) ((_ sign_extend 32) (currentByte!2796 thiss!1379)) ((_ sign_extend 32) (currentBit!2791 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!36581 () Bool)

(assert (=> start!8640 (=> (not res!36581) (not e!28754))))

(assert (=> start!8640 (= res!36581 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!996 srcBuffer!2))))))))

(assert (=> start!8640 e!28754))

(assert (=> start!8640 true))

(declare-fun array_inv!921 (array!2204) Bool)

(assert (=> start!8640 (array_inv!921 srcBuffer!2)))

(declare-fun e!28755 () Bool)

(declare-fun inv!12 (BitStream!1736) Bool)

(assert (=> start!8640 (and (inv!12 thiss!1379) e!28755)))

(declare-fun b!43054 () Bool)

(assert (=> b!43054 (= e!28756 true)))

(declare-fun lt!64963 () Bool)

(declare-fun lt!64958 () tuple2!4222)

(assert (=> b!43054 (= lt!64963 (isPrefixOf!0 (_2!2204 lt!64957) (_2!2204 lt!64958)))))

(assert (=> b!43054 (isPrefixOf!0 thiss!1379 (_2!2204 lt!64958))))

(declare-fun lt!64959 () Unit!3062)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1736 BitStream!1736 BitStream!1736) Unit!3062)

(assert (=> b!43054 (= lt!64959 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2204 lt!64957) (_2!2204 lt!64958)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1736 array!2204 (_ BitVec 64) (_ BitVec 64)) tuple2!4222)

(assert (=> b!43054 (= lt!64958 (appendBitsMSBFirstLoop!0 (_2!2204 lt!64957) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!28760 () Bool)

(assert (=> b!43054 e!28760))

(declare-fun res!36579 () Bool)

(assert (=> b!43054 (=> (not res!36579) (not e!28760))))

(assert (=> b!43054 (= res!36579 (validate_offset_bits!1 ((_ sign_extend 32) (size!996 (buf!1330 (_2!2204 lt!64957)))) ((_ sign_extend 32) (currentByte!2796 thiss!1379)) ((_ sign_extend 32) (currentBit!2791 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64962 () Unit!3062)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1736 array!2204 (_ BitVec 64)) Unit!3062)

(assert (=> b!43054 (= lt!64962 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1330 (_2!2204 lt!64957)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4224 0))(
  ( (tuple2!4225 (_1!2205 BitStream!1736) (_2!2205 BitStream!1736)) )
))
(declare-fun lt!64955 () tuple2!4224)

(declare-fun reader!0 (BitStream!1736 BitStream!1736) tuple2!4224)

(assert (=> b!43054 (= lt!64955 (reader!0 thiss!1379 (_2!2204 lt!64957)))))

(declare-fun b!43055 () Bool)

(assert (=> b!43055 (= e!28754 (not e!28758))))

(declare-fun res!36578 () Bool)

(assert (=> b!43055 (=> res!36578 e!28758)))

(assert (=> b!43055 (= res!36578 (bvsge i!635 to!314))))

(assert (=> b!43055 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64961 () Unit!3062)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1736) Unit!3062)

(assert (=> b!43055 (= lt!64961 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64956 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43055 (= lt!64956 (bitIndex!0 (size!996 (buf!1330 thiss!1379)) (currentByte!2796 thiss!1379) (currentBit!2791 thiss!1379)))))

(declare-fun b!43056 () Bool)

(declare-datatypes ((List!509 0))(
  ( (Nil!506) (Cons!505 (h!624 Bool) (t!1259 List!509)) )
))
(declare-fun head!328 (List!509) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1736 array!2204 (_ BitVec 64) (_ BitVec 64)) List!509)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1736 BitStream!1736 (_ BitVec 64)) List!509)

(assert (=> b!43056 (= e!28760 (= (head!328 (byteArrayBitContentToList!0 (_2!2204 lt!64957) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!328 (bitStreamReadBitsIntoList!0 (_2!2204 lt!64957) (_1!2205 lt!64955) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43057 () Bool)

(assert (=> b!43057 (= e!28755 (array_inv!921 (buf!1330 thiss!1379)))))

(assert (= (and start!8640 res!36581) b!43053))

(assert (= (and b!43053 res!36580) b!43055))

(assert (= (and b!43055 (not res!36578)) b!43052))

(assert (= (and b!43052 (not res!36582)) b!43054))

(assert (= (and b!43054 res!36579) b!43056))

(assert (= start!8640 b!43057))

(declare-fun m!65409 () Bool)

(assert (=> start!8640 m!65409))

(declare-fun m!65411 () Bool)

(assert (=> start!8640 m!65411))

(declare-fun m!65413 () Bool)

(assert (=> b!43055 m!65413))

(declare-fun m!65415 () Bool)

(assert (=> b!43055 m!65415))

(declare-fun m!65417 () Bool)

(assert (=> b!43055 m!65417))

(declare-fun m!65419 () Bool)

(assert (=> b!43053 m!65419))

(declare-fun m!65421 () Bool)

(assert (=> b!43056 m!65421))

(assert (=> b!43056 m!65421))

(declare-fun m!65423 () Bool)

(assert (=> b!43056 m!65423))

(declare-fun m!65425 () Bool)

(assert (=> b!43056 m!65425))

(assert (=> b!43056 m!65425))

(declare-fun m!65427 () Bool)

(assert (=> b!43056 m!65427))

(declare-fun m!65429 () Bool)

(assert (=> b!43054 m!65429))

(declare-fun m!65431 () Bool)

(assert (=> b!43054 m!65431))

(declare-fun m!65433 () Bool)

(assert (=> b!43054 m!65433))

(declare-fun m!65435 () Bool)

(assert (=> b!43054 m!65435))

(declare-fun m!65437 () Bool)

(assert (=> b!43054 m!65437))

(declare-fun m!65439 () Bool)

(assert (=> b!43054 m!65439))

(declare-fun m!65441 () Bool)

(assert (=> b!43054 m!65441))

(declare-fun m!65443 () Bool)

(assert (=> b!43052 m!65443))

(declare-fun m!65445 () Bool)

(assert (=> b!43052 m!65445))

(declare-fun m!65447 () Bool)

(assert (=> b!43052 m!65447))

(declare-fun m!65449 () Bool)

(assert (=> b!43052 m!65449))

(assert (=> b!43052 m!65443))

(declare-fun m!65451 () Bool)

(assert (=> b!43052 m!65451))

(declare-fun m!65453 () Bool)

(assert (=> b!43057 m!65453))

(push 1)

(assert (not b!43055))

(assert (not b!43057))

(assert (not b!43054))

(assert (not start!8640))

(assert (not b!43053))

(assert (not b!43056))

(assert (not b!43052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

