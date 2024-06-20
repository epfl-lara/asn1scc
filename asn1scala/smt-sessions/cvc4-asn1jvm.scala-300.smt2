; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5976 () Bool)

(assert start!5976)

(declare-fun b!27168 () Bool)

(declare-fun res!23480 () Bool)

(declare-fun e!18387 () Bool)

(assert (=> b!27168 (=> res!23480 e!18387)))

(declare-datatypes ((array!1713 0))(
  ( (array!1714 (arr!1201 (Array (_ BitVec 32) (_ BitVec 8))) (size!739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1310 0))(
  ( (BitStream!1311 (buf!1066 array!1713) (currentByte!2391 (_ BitVec 32)) (currentBit!2386 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2986 0))(
  ( (tuple2!2987 (_1!1580 BitStream!1310) (_2!1580 BitStream!1310)) )
))
(declare-fun lt!38742 () tuple2!2986)

(declare-fun lt!38745 () tuple2!2986)

(declare-fun isPrefixOf!0 (BitStream!1310 BitStream!1310) Bool)

(assert (=> b!27168 (= res!23480 (not (isPrefixOf!0 (_1!1580 lt!38742) (_1!1580 lt!38745))))))

(declare-fun e!18379 () Bool)

(declare-fun lt!38750 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!27169 () Bool)

(declare-datatypes ((Unit!2181 0))(
  ( (Unit!2182) )
))
(declare-datatypes ((tuple2!2988 0))(
  ( (tuple2!2989 (_1!1581 Unit!2181) (_2!1581 BitStream!1310)) )
))
(declare-fun lt!38744 () tuple2!2988)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27169 (= e!18379 (= lt!38750 (bvsub (bvsub (bvadd (bitIndex!0 (size!739 (buf!1066 (_2!1581 lt!38744))) (currentByte!2391 (_2!1581 lt!38744)) (currentBit!2386 (_2!1581 lt!38744))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27171 () Bool)

(declare-fun res!23478 () Bool)

(assert (=> b!27171 (=> res!23478 e!18387)))

(declare-fun lt!38752 () tuple2!2988)

(assert (=> b!27171 (= res!23478 (or (not (= (buf!1066 (_1!1580 lt!38742)) (buf!1066 (_1!1580 lt!38745)))) (not (= (buf!1066 (_1!1580 lt!38742)) (buf!1066 (_2!1581 lt!38752)))) (bvsge lt!38750 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27172 () Bool)

(declare-fun res!23486 () Bool)

(assert (=> b!27172 (=> res!23486 e!18387)))

(assert (=> b!27172 (= res!23486 (not (isPrefixOf!0 (_1!1580 lt!38742) (_2!1581 lt!38752))))))

(declare-fun b!27173 () Bool)

(declare-fun e!18377 () Bool)

(declare-fun e!18384 () Bool)

(assert (=> b!27173 (= e!18377 e!18384)))

(declare-fun res!23482 () Bool)

(assert (=> b!27173 (=> res!23482 e!18384)))

(assert (=> b!27173 (= res!23482 (not (= (size!739 (buf!1066 (_2!1581 lt!38744))) (size!739 (buf!1066 (_2!1581 lt!38752))))))))

(assert (=> b!27173 e!18379))

(declare-fun res!23481 () Bool)

(assert (=> b!27173 (=> (not res!23481) (not e!18379))))

(declare-fun thiss!1379 () BitStream!1310)

(assert (=> b!27173 (= res!23481 (= (size!739 (buf!1066 (_2!1581 lt!38752))) (size!739 (buf!1066 thiss!1379))))))

(declare-fun b!27174 () Bool)

(assert (=> b!27174 (= e!18384 e!18387)))

(declare-fun res!23493 () Bool)

(assert (=> b!27174 (=> res!23493 e!18387)))

(assert (=> b!27174 (= res!23493 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!356 0))(
  ( (Nil!353) (Cons!352 (h!471 Bool) (t!1106 List!356)) )
))
(declare-fun lt!38746 () List!356)

(declare-fun lt!38758 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1310 BitStream!1310 (_ BitVec 64)) List!356)

(assert (=> b!27174 (= lt!38746 (bitStreamReadBitsIntoList!0 (_2!1581 lt!38752) (_1!1580 lt!38745) lt!38758))))

(declare-fun lt!38756 () List!356)

(assert (=> b!27174 (= lt!38756 (bitStreamReadBitsIntoList!0 (_2!1581 lt!38752) (_1!1580 lt!38742) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27174 (validate_offset_bits!1 ((_ sign_extend 32) (size!739 (buf!1066 (_2!1581 lt!38752)))) ((_ sign_extend 32) (currentByte!2391 (_2!1581 lt!38744))) ((_ sign_extend 32) (currentBit!2386 (_2!1581 lt!38744))) lt!38758)))

(declare-fun lt!38753 () Unit!2181)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1310 array!1713 (_ BitVec 64)) Unit!2181)

(assert (=> b!27174 (= lt!38753 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1581 lt!38744) (buf!1066 (_2!1581 lt!38752)) lt!38758))))

(declare-fun reader!0 (BitStream!1310 BitStream!1310) tuple2!2986)

(assert (=> b!27174 (= lt!38745 (reader!0 (_2!1581 lt!38744) (_2!1581 lt!38752)))))

(assert (=> b!27174 (validate_offset_bits!1 ((_ sign_extend 32) (size!739 (buf!1066 (_2!1581 lt!38752)))) ((_ sign_extend 32) (currentByte!2391 thiss!1379)) ((_ sign_extend 32) (currentBit!2386 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38743 () Unit!2181)

(assert (=> b!27174 (= lt!38743 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1066 (_2!1581 lt!38752)) (bvsub to!314 i!635)))))

(assert (=> b!27174 (= lt!38742 (reader!0 thiss!1379 (_2!1581 lt!38752)))))

(declare-fun b!27175 () Bool)

(declare-fun res!23483 () Bool)

(assert (=> b!27175 (=> res!23483 e!18387)))

(assert (=> b!27175 (= res!23483 (not (isPrefixOf!0 (_1!1580 lt!38745) (_2!1581 lt!38752))))))

(declare-fun b!27176 () Bool)

(declare-fun e!18380 () Bool)

(declare-fun e!18385 () Bool)

(assert (=> b!27176 (= e!18380 e!18385)))

(declare-fun res!23490 () Bool)

(assert (=> b!27176 (=> res!23490 e!18385)))

(assert (=> b!27176 (= res!23490 (not (isPrefixOf!0 thiss!1379 (_2!1581 lt!38744))))))

(assert (=> b!27176 (validate_offset_bits!1 ((_ sign_extend 32) (size!739 (buf!1066 (_2!1581 lt!38744)))) ((_ sign_extend 32) (currentByte!2391 (_2!1581 lt!38744))) ((_ sign_extend 32) (currentBit!2386 (_2!1581 lt!38744))) lt!38758)))

(assert (=> b!27176 (= lt!38758 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38748 () Unit!2181)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1310 BitStream!1310 (_ BitVec 64) (_ BitVec 64)) Unit!2181)

(assert (=> b!27176 (= lt!38748 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1581 lt!38744) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1713)

(declare-fun appendBitFromByte!0 (BitStream!1310 (_ BitVec 8) (_ BitVec 32)) tuple2!2988)

(assert (=> b!27176 (= lt!38744 (appendBitFromByte!0 thiss!1379 (select (arr!1201 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27177 () Bool)

(assert (=> b!27177 (= e!18387 true)))

(declare-fun lt!38754 () (_ BitVec 64))

(assert (=> b!27177 (= lt!38754 (bitIndex!0 (size!739 (buf!1066 (_1!1580 lt!38745))) (currentByte!2391 (_1!1580 lt!38745)) (currentBit!2386 (_1!1580 lt!38745))))))

(declare-fun lt!38757 () (_ BitVec 64))

(assert (=> b!27177 (= lt!38757 (bitIndex!0 (size!739 (buf!1066 (_1!1580 lt!38742))) (currentByte!2391 (_1!1580 lt!38742)) (currentBit!2386 (_1!1580 lt!38742))))))

(declare-fun e!18381 () Bool)

(declare-fun lt!38747 () tuple2!2986)

(declare-fun b!27178 () Bool)

(declare-fun head!193 (List!356) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1310 array!1713 (_ BitVec 64) (_ BitVec 64)) List!356)

(assert (=> b!27178 (= e!18381 (= (head!193 (byteArrayBitContentToList!0 (_2!1581 lt!38744) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!193 (bitStreamReadBitsIntoList!0 (_2!1581 lt!38744) (_1!1580 lt!38747) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27179 () Bool)

(declare-fun e!18382 () Bool)

(assert (=> b!27179 (= e!18385 e!18382)))

(declare-fun res!23488 () Bool)

(assert (=> b!27179 (=> res!23488 e!18382)))

(assert (=> b!27179 (= res!23488 (not (isPrefixOf!0 (_2!1581 lt!38744) (_2!1581 lt!38752))))))

(assert (=> b!27179 (isPrefixOf!0 thiss!1379 (_2!1581 lt!38752))))

(declare-fun lt!38751 () Unit!2181)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1310 BitStream!1310 BitStream!1310) Unit!2181)

(assert (=> b!27179 (= lt!38751 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1581 lt!38744) (_2!1581 lt!38752)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1310 array!1713 (_ BitVec 64) (_ BitVec 64)) tuple2!2988)

(assert (=> b!27179 (= lt!38752 (appendBitsMSBFirstLoop!0 (_2!1581 lt!38744) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27179 e!18381))

(declare-fun res!23484 () Bool)

(assert (=> b!27179 (=> (not res!23484) (not e!18381))))

(assert (=> b!27179 (= res!23484 (validate_offset_bits!1 ((_ sign_extend 32) (size!739 (buf!1066 (_2!1581 lt!38744)))) ((_ sign_extend 32) (currentByte!2391 thiss!1379)) ((_ sign_extend 32) (currentBit!2386 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38741 () Unit!2181)

(assert (=> b!27179 (= lt!38741 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1066 (_2!1581 lt!38744)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27179 (= lt!38747 (reader!0 thiss!1379 (_2!1581 lt!38744)))))

(declare-fun b!27180 () Bool)

(declare-fun res!23485 () Bool)

(declare-fun e!18388 () Bool)

(assert (=> b!27180 (=> (not res!23485) (not e!18388))))

(assert (=> b!27180 (= res!23485 (validate_offset_bits!1 ((_ sign_extend 32) (size!739 (buf!1066 thiss!1379))) ((_ sign_extend 32) (currentByte!2391 thiss!1379)) ((_ sign_extend 32) (currentBit!2386 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27181 () Bool)

(declare-fun res!23489 () Bool)

(assert (=> b!27181 (=> res!23489 e!18384)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27181 (= res!23489 (not (invariant!0 (currentBit!2386 (_2!1581 lt!38744)) (currentByte!2391 (_2!1581 lt!38744)) (size!739 (buf!1066 (_2!1581 lt!38744))))))))

(declare-fun b!27182 () Bool)

(declare-fun res!23492 () Bool)

(assert (=> b!27182 (=> res!23492 e!18387)))

(declare-fun length!82 (List!356) Int)

(assert (=> b!27182 (= res!23492 (<= (length!82 lt!38756) 0))))

(declare-fun b!27183 () Bool)

(declare-fun e!18383 () Bool)

(declare-fun array_inv!708 (array!1713) Bool)

(assert (=> b!27183 (= e!18383 (array_inv!708 (buf!1066 thiss!1379)))))

(declare-fun res!23479 () Bool)

(assert (=> start!5976 (=> (not res!23479) (not e!18388))))

(assert (=> start!5976 (= res!23479 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!739 srcBuffer!2))))))))

(assert (=> start!5976 e!18388))

(assert (=> start!5976 true))

(assert (=> start!5976 (array_inv!708 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1310) Bool)

(assert (=> start!5976 (and (inv!12 thiss!1379) e!18383)))

(declare-fun b!27170 () Bool)

(assert (=> b!27170 (= e!18388 (not e!18380))))

(declare-fun res!23491 () Bool)

(assert (=> b!27170 (=> res!23491 e!18380)))

(assert (=> b!27170 (= res!23491 (bvsge i!635 to!314))))

(assert (=> b!27170 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38749 () Unit!2181)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1310) Unit!2181)

(assert (=> b!27170 (= lt!38749 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38755 () (_ BitVec 64))

(assert (=> b!27170 (= lt!38755 (bitIndex!0 (size!739 (buf!1066 thiss!1379)) (currentByte!2391 thiss!1379) (currentBit!2386 thiss!1379)))))

(declare-fun b!27184 () Bool)

(declare-fun res!23496 () Bool)

(assert (=> b!27184 (=> res!23496 e!18384)))

(assert (=> b!27184 (= res!23496 (not (invariant!0 (currentBit!2386 (_2!1581 lt!38744)) (currentByte!2391 (_2!1581 lt!38744)) (size!739 (buf!1066 (_2!1581 lt!38752))))))))

(declare-fun b!27185 () Bool)

(declare-fun res!23494 () Bool)

(assert (=> b!27185 (=> res!23494 e!18377)))

(assert (=> b!27185 (= res!23494 (not (invariant!0 (currentBit!2386 (_2!1581 lt!38752)) (currentByte!2391 (_2!1581 lt!38752)) (size!739 (buf!1066 (_2!1581 lt!38752))))))))

(declare-fun b!27186 () Bool)

(declare-fun res!23487 () Bool)

(assert (=> b!27186 (=> res!23487 e!18377)))

(assert (=> b!27186 (= res!23487 (not (= (size!739 (buf!1066 thiss!1379)) (size!739 (buf!1066 (_2!1581 lt!38752))))))))

(declare-fun b!27187 () Bool)

(assert (=> b!27187 (= e!18382 e!18377)))

(declare-fun res!23495 () Bool)

(assert (=> b!27187 (=> res!23495 e!18377)))

(assert (=> b!27187 (= res!23495 (not (= lt!38750 (bvsub (bvadd lt!38755 to!314) i!635))))))

(assert (=> b!27187 (= lt!38750 (bitIndex!0 (size!739 (buf!1066 (_2!1581 lt!38752))) (currentByte!2391 (_2!1581 lt!38752)) (currentBit!2386 (_2!1581 lt!38752))))))

(assert (= (and start!5976 res!23479) b!27180))

(assert (= (and b!27180 res!23485) b!27170))

(assert (= (and b!27170 (not res!23491)) b!27176))

(assert (= (and b!27176 (not res!23490)) b!27179))

(assert (= (and b!27179 res!23484) b!27178))

(assert (= (and b!27179 (not res!23488)) b!27187))

(assert (= (and b!27187 (not res!23495)) b!27185))

(assert (= (and b!27185 (not res!23494)) b!27186))

(assert (= (and b!27186 (not res!23487)) b!27173))

(assert (= (and b!27173 res!23481) b!27169))

(assert (= (and b!27173 (not res!23482)) b!27181))

(assert (= (and b!27181 (not res!23489)) b!27184))

(assert (= (and b!27184 (not res!23496)) b!27174))

(assert (= (and b!27174 (not res!23493)) b!27182))

(assert (= (and b!27182 (not res!23492)) b!27172))

(assert (= (and b!27172 (not res!23486)) b!27175))

(assert (= (and b!27175 (not res!23483)) b!27168))

(assert (= (and b!27168 (not res!23480)) b!27171))

(assert (= (and b!27171 (not res!23478)) b!27177))

(assert (= start!5976 b!27183))

(declare-fun m!38937 () Bool)

(assert (=> b!27183 m!38937))

(declare-fun m!38939 () Bool)

(assert (=> b!27174 m!38939))

(declare-fun m!38941 () Bool)

(assert (=> b!27174 m!38941))

(declare-fun m!38943 () Bool)

(assert (=> b!27174 m!38943))

(declare-fun m!38945 () Bool)

(assert (=> b!27174 m!38945))

(declare-fun m!38947 () Bool)

(assert (=> b!27174 m!38947))

(declare-fun m!38949 () Bool)

(assert (=> b!27174 m!38949))

(declare-fun m!38951 () Bool)

(assert (=> b!27174 m!38951))

(declare-fun m!38953 () Bool)

(assert (=> b!27174 m!38953))

(declare-fun m!38955 () Bool)

(assert (=> b!27168 m!38955))

(declare-fun m!38957 () Bool)

(assert (=> b!27170 m!38957))

(declare-fun m!38959 () Bool)

(assert (=> b!27170 m!38959))

(declare-fun m!38961 () Bool)

(assert (=> b!27170 m!38961))

(declare-fun m!38963 () Bool)

(assert (=> b!27185 m!38963))

(declare-fun m!38965 () Bool)

(assert (=> b!27180 m!38965))

(declare-fun m!38967 () Bool)

(assert (=> b!27179 m!38967))

(declare-fun m!38969 () Bool)

(assert (=> b!27179 m!38969))

(declare-fun m!38971 () Bool)

(assert (=> b!27179 m!38971))

(declare-fun m!38973 () Bool)

(assert (=> b!27179 m!38973))

(declare-fun m!38975 () Bool)

(assert (=> b!27179 m!38975))

(declare-fun m!38977 () Bool)

(assert (=> b!27179 m!38977))

(declare-fun m!38979 () Bool)

(assert (=> b!27179 m!38979))

(declare-fun m!38981 () Bool)

(assert (=> b!27175 m!38981))

(declare-fun m!38983 () Bool)

(assert (=> b!27176 m!38983))

(declare-fun m!38985 () Bool)

(assert (=> b!27176 m!38985))

(declare-fun m!38987 () Bool)

(assert (=> b!27176 m!38987))

(assert (=> b!27176 m!38985))

(declare-fun m!38989 () Bool)

(assert (=> b!27176 m!38989))

(declare-fun m!38991 () Bool)

(assert (=> b!27176 m!38991))

(declare-fun m!38993 () Bool)

(assert (=> b!27177 m!38993))

(declare-fun m!38995 () Bool)

(assert (=> b!27177 m!38995))

(declare-fun m!38997 () Bool)

(assert (=> b!27178 m!38997))

(assert (=> b!27178 m!38997))

(declare-fun m!38999 () Bool)

(assert (=> b!27178 m!38999))

(declare-fun m!39001 () Bool)

(assert (=> b!27178 m!39001))

(assert (=> b!27178 m!39001))

(declare-fun m!39003 () Bool)

(assert (=> b!27178 m!39003))

(declare-fun m!39005 () Bool)

(assert (=> b!27184 m!39005))

(declare-fun m!39007 () Bool)

(assert (=> b!27169 m!39007))

(declare-fun m!39009 () Bool)

(assert (=> start!5976 m!39009))

(declare-fun m!39011 () Bool)

(assert (=> start!5976 m!39011))

(declare-fun m!39013 () Bool)

(assert (=> b!27187 m!39013))

(declare-fun m!39015 () Bool)

(assert (=> b!27182 m!39015))

(declare-fun m!39017 () Bool)

(assert (=> b!27172 m!39017))

(declare-fun m!39019 () Bool)

(assert (=> b!27181 m!39019))

(push 1)

(assert (not b!27174))

(assert (not b!27178))

(assert (not b!27170))

(assert (not b!27180))

(assert (not b!27172))

(assert (not b!27177))

(assert (not b!27179))

(assert (not b!27181))

(assert (not b!27187))

(assert (not start!5976))

(assert (not b!27184))

(assert (not b!27168))

(assert (not b!27185))

(assert (not b!27169))

(assert (not b!27176))

(assert (not b!27175))

(assert (not b!27183))

(assert (not b!27182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

