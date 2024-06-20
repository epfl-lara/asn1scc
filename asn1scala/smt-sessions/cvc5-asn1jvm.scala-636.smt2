; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17860 () Bool)

(assert start!17860)

(declare-fun b!87458 () Bool)

(declare-fun e!57990 () Bool)

(declare-fun e!57996 () Bool)

(assert (=> b!87458 (= e!57990 e!57996)))

(declare-fun res!71925 () Bool)

(assert (=> b!87458 (=> (not res!71925) (not e!57996))))

(declare-fun lt!135642 () (_ BitVec 64))

(declare-fun lt!135643 () (_ BitVec 64))

(assert (=> b!87458 (= res!71925 (= lt!135642 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135643)))))

(declare-datatypes ((array!4128 0))(
  ( (array!4129 (arr!2502 (Array (_ BitVec 32) (_ BitVec 8))) (size!1865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3292 0))(
  ( (BitStream!3293 (buf!2255 array!4128) (currentByte!4470 (_ BitVec 32)) (currentBit!4465 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5749 0))(
  ( (Unit!5750) )
))
(declare-datatypes ((tuple2!7396 0))(
  ( (tuple2!7397 (_1!3931 Unit!5749) (_2!3931 BitStream!3292)) )
))
(declare-fun lt!135644 () tuple2!7396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87458 (= lt!135642 (bitIndex!0 (size!1865 (buf!2255 (_2!3931 lt!135644))) (currentByte!4470 (_2!3931 lt!135644)) (currentBit!4465 (_2!3931 lt!135644))))))

(declare-fun b!87459 () Bool)

(declare-fun e!57992 () Bool)

(declare-datatypes ((tuple2!7398 0))(
  ( (tuple2!7399 (_1!3932 BitStream!3292) (_2!3932 Bool)) )
))
(declare-fun lt!135645 () tuple2!7398)

(assert (=> b!87459 (= e!57992 (= (bitIndex!0 (size!1865 (buf!2255 (_1!3932 lt!135645))) (currentByte!4470 (_1!3932 lt!135645)) (currentBit!4465 (_1!3932 lt!135645))) lt!135642))))

(declare-fun b!87460 () Bool)

(declare-fun e!57987 () Bool)

(declare-fun thiss!1152 () BitStream!3292)

(declare-fun array_inv!1711 (array!4128) Bool)

(assert (=> b!87460 (= e!57987 (array_inv!1711 (buf!2255 thiss!1152)))))

(declare-fun res!71933 () Bool)

(declare-fun e!57994 () Bool)

(assert (=> start!17860 (=> (not res!71933) (not e!57994))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17860 (= res!71933 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17860 e!57994))

(declare-fun inv!12 (BitStream!3292) Bool)

(assert (=> start!17860 (and (inv!12 thiss!1152) e!57987)))

(declare-fun thiss!1151 () BitStream!3292)

(declare-fun e!57995 () Bool)

(assert (=> start!17860 (and (inv!12 thiss!1151) e!57995)))

(assert (=> start!17860 true))

(declare-fun b!87461 () Bool)

(declare-fun res!71938 () Bool)

(assert (=> b!87461 (=> (not res!71938) (not e!57994))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!87461 (= res!71938 (and (bvsle i!576 nBits!336) (= (size!1865 (buf!2255 thiss!1152)) (size!1865 (buf!2255 thiss!1151)))))))

(declare-fun b!87462 () Bool)

(declare-fun e!57989 () Bool)

(assert (=> b!87462 (= e!57989 (and (bvsle ((_ sign_extend 32) (size!1865 (buf!2255 (_2!3931 lt!135644)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4470 (_2!3931 lt!135644))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4465 (_2!3931 lt!135644))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!87463 () Bool)

(declare-fun res!71934 () Bool)

(assert (=> b!87463 (=> (not res!71934) (not e!57996))))

(declare-fun isPrefixOf!0 (BitStream!3292 BitStream!3292) Bool)

(assert (=> b!87463 (= res!71934 (isPrefixOf!0 thiss!1152 (_2!3931 lt!135644)))))

(declare-fun b!87464 () Bool)

(declare-fun res!71935 () Bool)

(assert (=> b!87464 (=> (not res!71935) (not e!57994))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87464 (= res!71935 (invariant!0 (currentBit!4465 thiss!1151) (currentByte!4470 thiss!1151) (size!1865 (buf!2255 thiss!1151))))))

(declare-fun b!87465 () Bool)

(declare-fun res!71937 () Bool)

(assert (=> b!87465 (=> (not res!71937) (not e!57994))))

(assert (=> b!87465 (= res!71937 (invariant!0 (currentBit!4465 thiss!1152) (currentByte!4470 thiss!1152) (size!1865 (buf!2255 thiss!1152))))))

(declare-fun b!87466 () Bool)

(declare-fun res!71932 () Bool)

(declare-fun e!57991 () Bool)

(assert (=> b!87466 (=> (not res!71932) (not e!57991))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87466 (= res!71932 (validate_offset_bits!1 ((_ sign_extend 32) (size!1865 (buf!2255 thiss!1152))) ((_ sign_extend 32) (currentByte!4470 thiss!1152)) ((_ sign_extend 32) (currentBit!4465 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87467 () Bool)

(declare-fun res!71931 () Bool)

(assert (=> b!87467 (=> (not res!71931) (not e!57994))))

(assert (=> b!87467 (= res!71931 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87468 () Bool)

(declare-fun res!71924 () Bool)

(assert (=> b!87468 (=> res!71924 e!57989)))

(assert (=> b!87468 (= res!71924 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1865 (buf!2255 (_2!3931 lt!135644))) (size!1865 (buf!2255 thiss!1151))))))))

(declare-fun b!87469 () Bool)

(declare-fun res!71929 () Bool)

(assert (=> b!87469 (=> res!71929 e!57989)))

(declare-fun lt!135641 () (_ BitVec 64))

(assert (=> b!87469 (= res!71929 (not (= (bitIndex!0 (size!1865 (buf!2255 (_2!3931 lt!135644))) (currentByte!4470 (_2!3931 lt!135644)) (currentBit!4465 (_2!3931 lt!135644))) (bvadd lt!135641 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87470 () Bool)

(declare-fun res!71923 () Bool)

(assert (=> b!87470 (=> (not res!71923) (not e!57994))))

(assert (=> b!87470 (= res!71923 (validate_offset_bits!1 ((_ sign_extend 32) (size!1865 (buf!2255 thiss!1151))) ((_ sign_extend 32) (currentByte!4470 thiss!1151)) ((_ sign_extend 32) (currentBit!4465 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87471 () Bool)

(assert (=> b!87471 (= e!57996 e!57992)))

(declare-fun res!71930 () Bool)

(assert (=> b!87471 (=> (not res!71930) (not e!57992))))

(declare-fun lt!135640 () Bool)

(assert (=> b!87471 (= res!71930 (and (= (_2!3932 lt!135645) lt!135640) (= (_1!3932 lt!135645) (_2!3931 lt!135644))))))

(declare-fun readBitPure!0 (BitStream!3292) tuple2!7398)

(declare-fun readerFrom!0 (BitStream!3292 (_ BitVec 32) (_ BitVec 32)) BitStream!3292)

(assert (=> b!87471 (= lt!135645 (readBitPure!0 (readerFrom!0 (_2!3931 lt!135644) (currentBit!4465 thiss!1152) (currentByte!4470 thiss!1152))))))

(declare-fun b!87472 () Bool)

(assert (=> b!87472 (= e!57994 e!57991)))

(declare-fun res!71927 () Bool)

(assert (=> b!87472 (=> (not res!71927) (not e!57991))))

(assert (=> b!87472 (= res!71927 (= lt!135643 (bvadd lt!135641 ((_ sign_extend 32) i!576))))))

(assert (=> b!87472 (= lt!135643 (bitIndex!0 (size!1865 (buf!2255 thiss!1152)) (currentByte!4470 thiss!1152) (currentBit!4465 thiss!1152)))))

(assert (=> b!87472 (= lt!135641 (bitIndex!0 (size!1865 (buf!2255 thiss!1151)) (currentByte!4470 thiss!1151) (currentBit!4465 thiss!1151)))))

(declare-fun b!87473 () Bool)

(assert (=> b!87473 (= e!57991 (not e!57989))))

(declare-fun res!71926 () Bool)

(assert (=> b!87473 (=> res!71926 e!57989)))

(assert (=> b!87473 (= res!71926 (not (invariant!0 (currentBit!4465 (_2!3931 lt!135644)) (currentByte!4470 (_2!3931 lt!135644)) (size!1865 (buf!2255 (_2!3931 lt!135644))))))))

(assert (=> b!87473 e!57990))

(declare-fun res!71936 () Bool)

(assert (=> b!87473 (=> (not res!71936) (not e!57990))))

(assert (=> b!87473 (= res!71936 (= (size!1865 (buf!2255 thiss!1152)) (size!1865 (buf!2255 (_2!3931 lt!135644)))))))

(declare-fun appendBit!0 (BitStream!3292 Bool) tuple2!7396)

(assert (=> b!87473 (= lt!135644 (appendBit!0 thiss!1152 lt!135640))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87473 (= lt!135640 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87474 () Bool)

(assert (=> b!87474 (= e!57995 (array_inv!1711 (buf!2255 thiss!1151)))))

(declare-fun b!87475 () Bool)

(declare-fun res!71928 () Bool)

(assert (=> b!87475 (=> (not res!71928) (not e!57991))))

(assert (=> b!87475 (= res!71928 (bvslt i!576 nBits!336))))

(assert (= (and start!17860 res!71933) b!87470))

(assert (= (and b!87470 res!71923) b!87464))

(assert (= (and b!87464 res!71935) b!87467))

(assert (= (and b!87467 res!71931) b!87465))

(assert (= (and b!87465 res!71937) b!87461))

(assert (= (and b!87461 res!71938) b!87472))

(assert (= (and b!87472 res!71927) b!87466))

(assert (= (and b!87466 res!71932) b!87475))

(assert (= (and b!87475 res!71928) b!87473))

(assert (= (and b!87473 res!71936) b!87458))

(assert (= (and b!87458 res!71925) b!87463))

(assert (= (and b!87463 res!71934) b!87471))

(assert (= (and b!87471 res!71930) b!87459))

(assert (= (and b!87473 (not res!71926)) b!87468))

(assert (= (and b!87468 (not res!71924)) b!87469))

(assert (= (and b!87469 (not res!71929)) b!87462))

(assert (= start!17860 b!87460))

(assert (= start!17860 b!87474))

(declare-fun m!132935 () Bool)

(assert (=> b!87473 m!132935))

(declare-fun m!132937 () Bool)

(assert (=> b!87473 m!132937))

(declare-fun m!132939 () Bool)

(assert (=> b!87472 m!132939))

(declare-fun m!132941 () Bool)

(assert (=> b!87472 m!132941))

(declare-fun m!132943 () Bool)

(assert (=> b!87460 m!132943))

(declare-fun m!132945 () Bool)

(assert (=> start!17860 m!132945))

(declare-fun m!132947 () Bool)

(assert (=> start!17860 m!132947))

(declare-fun m!132949 () Bool)

(assert (=> b!87465 m!132949))

(declare-fun m!132951 () Bool)

(assert (=> b!87458 m!132951))

(declare-fun m!132953 () Bool)

(assert (=> b!87471 m!132953))

(assert (=> b!87471 m!132953))

(declare-fun m!132955 () Bool)

(assert (=> b!87471 m!132955))

(declare-fun m!132957 () Bool)

(assert (=> b!87464 m!132957))

(declare-fun m!132959 () Bool)

(assert (=> b!87459 m!132959))

(assert (=> b!87469 m!132951))

(declare-fun m!132961 () Bool)

(assert (=> b!87463 m!132961))

(declare-fun m!132963 () Bool)

(assert (=> b!87474 m!132963))

(declare-fun m!132965 () Bool)

(assert (=> b!87470 m!132965))

(declare-fun m!132967 () Bool)

(assert (=> b!87466 m!132967))

(push 1)

(assert (not b!87460))

(assert (not b!87469))

(assert (not b!87463))

(assert (not b!87464))

(assert (not b!87473))

(assert (not start!17860))

(assert (not b!87466))

(assert (not b!87472))

(assert (not b!87470))

(assert (not b!87471))

(assert (not b!87465))

(assert (not b!87459))

(assert (not b!87458))

(assert (not b!87474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

